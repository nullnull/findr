require 'findr/version'
require 'findr/cli'
require 'shared-mime-info'
require 'diffy'
require 'colorize'

module Findr
  PSEUDO_TEXT_TYPE_MIMES = %w(
    application/x-ruby
    application/x-php
    application/x-python
    application/json
    application/rtf
    application/xml
  )

  class Findr
    def initialize(pattern, replacement, search_path, options = {})
      @pattern = pattern
      @replacement = replacement
      @search_path = search_path
      @options = options
      @results = []

      Diffy::Diff.default_format = :color
    end

    def find_and_replace
      paths.each do |path|
        print "searching: #{path}\n" if @options[:verbose]
        sed_i(path)
      end

      if @options[:verbose] && !@results.empty?
        print_line
        print @results.map { |x| [x[0].bold, x[1]].join("\n") }.join("\n")
        print_line
      end

      print "searched: #{paths.size} files\n".bold
      print "replaced: #{@results.size} files\n".bold
    end

    private

    def paths
      @paths ||= Dir.glob(@search_path).select do |path|
        File.file?(path) && text_file?(path)
      end
    end

    def text_file?(path)
      mime = MIME.check(path)
      mime.media_type == 'text' || PSEUDO_TEXT_TYPE_MIMES.include?(mime.to_s)
    end

    def sed_i(path)
      File.open(path, 'r') do |f_in|
        original = f_in.read
        replaced = original.gsub(/#{@pattern}/, @replacement)
        return if original == replaced
        File.open(path, 'w') do |f_out|
          f_out.write(replaced)
        end
        store_results(path, original, replaced)
      end
    end

    def store_results(path, original, replaced)
      if @options[:verbose]
        diff_strings = Diffy::Diff.new(original, replaced, context: 2, include_diff_info: true).to_s.sub(/^(.*?)\n(.*?)\n/, "")
        @results << [path, diff_strings]
      else
        @results << [path]
      end
    end

    def print_line
      print "-----\n"
    end
  end
end
