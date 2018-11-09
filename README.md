# Findr
[![Gem](https://img.shields.io/gem/v/findr_null.svg)](https://rubygems.org/gems/findr_null)
[![MIT License](http://img.shields.io/badge/license-MIT-blue.svg?style=flat)](LICENSE)

Bored with finding and replacing files by `find . -type f -name "*.rb" | xargs sed -i "" -e "s/${1}/${2}/"` ?

`findr` is optimized tool to find files in directory recursively and replace texts in the files. findr has the following features:

* **Replace by ruby regexp** : You can replace strings by using regexp in ruby. The behavior of `sed` sometimes differ depends on your os (expecially GNU and BSD ). Moreover, it's hard to replace strings with some contextby using `sed`, for example when replace strings with new line.
* **Show stats** : `findr` shows searched files and results of replacement :tada: It will really help your development. (use ` --no-verbose` option to supress stats)

[![Image from Gyazo](https://i.gyazo.com/c5ff3b85e1aa748eab5d864949373dc5.png)](https://gyazo.com/c5ff3b85e1aa748eab5d864949373dc5)

## Installation
```sh
$ gem install findr_null
```

## Usage
```sh
# Replace 'apple' to 'lemon' in all files in current and children directory
$ findr "apple" "lemon"

# Delete a line with 'require' in all ruby file
$ findr "require(.*?)\\n" "" "**/*.rb"
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/nullnull/findr. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Findr project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/findr/blob/master/CODE_OF_CONDUCT.md).
