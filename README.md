# MopedRailsLogger

Rails-like logger for moped.

## Preview

```
Processing by PostsController#index as HTML
  MOPED: 127.0.0.1:27017 QUERY        database=development collection=posts selector={} flags=[:slave_ok] limit=0 skip=0 batch_size=nil fields=nil (0.2210ms)
  Rendered posts/index.html.erb within layouts/application (1.9ms)
Completed 200 OK in 5ms (Views: 4.7ms | Redis: 0.0ms | Moped: 0.2ms)
```

## Installation

Add this line to your application's Gemfile:

    gem 'moped_rails_logger', group: 'development', github: 'qqshfox/moped_rails_logger'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install moped_rails_logger

## More

Support [my fork of RailsPanel](https://github.com/qqshfox/rails_panel/tree/moped_support).

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
