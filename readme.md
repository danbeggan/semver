# Semantic version comparison

## Your task:
Implement a ruby class `Semver` that can be used to compare semantic versions. 

Your class should support the operators `<`, `>` and `==`. It should also implement a `#match?` method that matches against Gemfile version strings like `'~> 10.1'`.

### Examples
```
Semver.new('1.10') > Semver.new('2.10')   # => false
Semver.new('1.10') < Semver.new('2.10')   # => true

Semver.new('1.10') == Semver.new('1.10')  # => true

Semver.new('1.9.1').match?('~> 1.10')     # => false
Semver.new('1.10.1').match?('~> 1.10')    # => true
Semver.new('1.10.1').match?('> 1.10')     # => true
```

This is an incomplete set of examples, [here's more on the workings of ruby's "pessimistic" `~>` operator](https://thoughtbot.com/blog/rubys-pessimistic-operator).

## What we are looking for:
* Process of working documented by concise commits
* Clean, readable code
* Tests!

## Recommended time
2 - 4 hours

## Setup
`bundle install`

## Tests
`bundle exec rspec`