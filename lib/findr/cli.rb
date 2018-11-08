require 'findr'
require 'thor'

module Findr
  class CLI < Thor
    default_task :pattern
    desc 'pattern', <<~EOT
    Usage:
      findr pattern replacement [path]

    Examples:
      # Delete a line with 'require' in ruby file
      $ findr "require(.*?)\\n" ""

    Details:
      -v, --verbose
          Verbose mode.
    EOT
    option :verbose, type: :boolean, aliases: :v, default: true

    def pattern(pattern, replacement, path = '**/*')
      Findr.new(pattern, replacement, path, options).find_and_replace
    end
  end
end
