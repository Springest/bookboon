# Bookboon

This gem is a simple API wrapper for the [Bookboon API](https://github.com/bookboon/api).
> Bookboon.com is the world’s largest publisher of online educational literature. We provide free textbooks for university students, premium eBooks for business professionals and learning solutions for companies.

For access to the API please consult Bookboon directly.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'bookboon'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bookboon

## Usage

### Set up

```ruby
client = Bookboon::Client.new do |config|
  config.id = "..."
  config.secret = "..."
end
```

Additional config settings are available:

```ruby
config.language = "..." # Defaults to "en", see Bookboon API reference for available languages
config.branding_id = "..." # Defaults to nil
config.rotation_id = "..." # Defaults to nil
```

### Available methods

Please refer to the official [Bookboon API Reference](https://github.com/bookboon/api/blob/master/Reference.md) for structure of the output. Right now no transformation of any kind is done, we just return the raw output from Bookboon as a Hash, except for the `download_book` method, which returns a temporary URL to download the book directly.

* `client.categories`
* `client.category(id)`
* `client.search(term)`
* `client.book(id)`
* `client.download_book(id, handle)`

### To be implemented

1. Questions
2. Recommendations

Want to help implementing these end points? Check out the Contributing part below.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/springest/bookboon. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


