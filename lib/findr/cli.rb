require 'findr'
require 'thor'

module Findr
  class CLI < Thor
    default_task :pattern
    desc 'pattern', <<~EOT
    Details:
      -v, --verbose
          Verbose mode.
    EOT
    option :verbose, type: :boolean, aliases: :v, default: false

    def pattern(pattern, replacement, path = '**/*')
      Findr.new(pattern, replacement, path, options).find_and_replace
    end
  end
end
