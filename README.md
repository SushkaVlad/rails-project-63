# HexletCode

[![hexlet-check](https://github.com/SushkaVlad/rails-project-63/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/SushkaVlad/rails-project-63/actions/workflows/hexlet-check.yml)
[![CI](https://github.com/SushkaVlad/rails-project-63/actions/workflows/main.yml/badge.svg)](https://github.com/SushkaVlad/rails-project-63/actions/workflows/main.yml)

A simple HTML form generator for Ruby applications. The gem builds HTML tags and
(eventually) full forms from plain Ruby objects.

## Installation

Add the gem to your application's Gemfile from this repository:

```ruby
gem "hexlet_code", git: "https://github.com/SushkaVlad/rails-project-63.git"
```

And then install dependencies:

```bash
bundle install
```

## Usage

### Building tags

`HexletCode::Tag.build` generates HTML for both single and paired tags.

```ruby
require "hexlet_code"

# Single tags
HexletCode::Tag.build("br")
# => "<br>"

HexletCode::Tag.build("img", src: "path/to/image")
# => '<img src="path/to/image">'

HexletCode::Tag.build("input", type: "submit", value: "Save")
# => '<input type="submit" value="Save">'

# Paired tags — the body is passed as a block
HexletCode::Tag.build("label") { "Email" }
# => "<label>Email</label>"

HexletCode::Tag.build("label", for: "email") { "Email" }
# => '<label for="email">Email</label>'

HexletCode::Tag.build("div")
# => "<div></div>"
```

## Development

After checking out the repo, install dependencies:

```bash
make install
```

Run the test suite:

```bash
make test
```

Run the linter (and auto-fix where possible):

```bash
make lint
make lint-fix
```

You can also run `bin/console` for an interactive prompt to experiment.

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/SushkaVlad/rails-project-63.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
