require 'findr'
require 'thor'

module Findr
  class CLI < Thor
    default_task :find_and_replace
    desc :find_and_replace, ''
    option :verbose, type: :boolean, aliases: :v, default: true
    def find_and_replace(pattern, replacement, path = '**/*')
      Findr.new(pattern, replacement, path, options).find_and_replace
    end

    # Show help by not using default feature of Thor, because this 'findr' command do not need arguments.
    def help
      print <<~EOT
      #{'findr'.bold} -- Find files in directory recursively and replace texts in the files.

      #{'Usage'.bold}
        findr pattern replacement [path]

      #{'Examples'.bold}
        # Replace 'apple' to 'lemon' in all files in current and children directory
        $ findr "apple" "lemon"

        # Delete a line with 'require' in all ruby file
        $ findr "require(.*?)\\n" "" "**/*.rb"

      #{'Details'.bold}
        -v, --verbose
            Verbose mode.
      EOT
    end
  end
end
