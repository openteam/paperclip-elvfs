# Paperclip::Elvfs

This gem extends [Paperclip](https://github.com/thoughtbot/paperclip) with [elFinder](https://github.com/Studio-42/elFinder) storage.

## Installation

Add this line to your application's Gemfile:

    gem 'paperclip-elvfs'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install paperclip-elvfs

## Usage

Example:

```ruby
class User < ActiveRecord::Base
  has_attached_file :avatar, :storage => :elvfs, :elvfs_url => "http://elfinder.org"
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
