require 'findr'
require 'thor'

module Findr
  class CLI < Thor
    default_task :find_and_replace
    desc 'find_and_replace', <<~EOT
Details:
    EOT

    def find_and_replace(path = '.')
      p path
    end
  end
end
