# HexletCode

[![hexlet-check](https://github.com/SushkaVlad/rails-project-63/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/SushkaVlad/rails-project-63/actions/workflows/hexlet-check.yml)
[![CI](https://github.com/SushkaVlad/rails-project-63/actions/workflows/main.yml/badge.svg)](https://github.com/SushkaVlad/rails-project-63/actions/workflows/main.yml)

A simple HTML form generator for Ruby applications. The gem builds HTML tags and
forms from plain Ruby objects (entities).

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

### Generating forms

`HexletCode.form_for` builds a form from an entity (any object that responds to
the requested fields, e.g. a `Struct`).

```ruby
require "hexlet_code"

User = Struct.new(:name, :job, :gender, keyword_init: true)
user = User.new(name: "rob", job: "hexlet", gender: "m")

HexletCode.form_for(user) do |f|
  f.input :name
  f.input :job, as: :text
end
# <form action="#" method="post">
#   <input name="name" type="text" value="rob">
#   <textarea name="job" cols="20" rows="40">hexlet</textarea>
# </form>
```

The `url:` option sets the form action, any other options become form
attributes:

```ruby
HexletCode.form_for(user, url: "/profile", class: "hexlet-form") do |f|
  f.input :name, class: "user-input"
end
# <form action="/profile" method="post" class="hexlet-form">
#   <input name="name" type="text" value="rob" class="user-input">
# </form>
```

Default attributes (such as a textarea's `cols`/`rows`) can be overridden:

```ruby
HexletCode.form_for(user) do |f|
  f.input :job, as: :text, rows: 50, cols: 50
end
# <form action="#" method="post">
#   <textarea name="job" cols="50" rows="50">hexlet</textarea>
# </form>
```

Requesting a field that the entity does not have raises `NoMethodError`.

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
