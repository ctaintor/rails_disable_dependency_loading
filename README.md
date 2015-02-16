# RailsDisableDependencyLoading

This gem adds back the `disable_dependency_loading` initializer to Rails, which was removed with [this commit](https://github.com/rails/rails/commit/a8bf12979e5fa15282b39c8cfa315e663f613539).
The purpose of this initializer is to remove Rails auto-loading capabilities in production environments after the
initialization sequence has completed. This is because auto-loading is not threadsafe and thus you want to avoid auto-loading
during request processing because you *will* have problems if using a threaded web server like Puma and you have a reasonable amount of load.
Read Aaron Patterson's [writeup](http://tenderlovemaking.com/2012/06/18/removing-config-threadsafe.html),
on thread safety if you want more information. (Note that his writeup was done when the ability to disable dependency
loading was supported natively in Rails.)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rails_disable_dependency_loading'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rails_disable_dependency_loading

## Usage

If you have both `config.eager_load` \& `config.cache_classes` set to `true` (the default for RAILS_ENV=production),
then the Rails auto-dependency-loading will be disabled. This will mean that you will get runtime errors if you fail to
have your dependencies loaded during initialization. You can fix that by explicitly requiring your dependencies from
a file that is loaded during initialization, or you can add directories to the `eager_load_paths` configuration - it is
probably a good idea to read [this issue](https://github.com/rails/rails/issues/13142) to understand more.

It is highly likely that including this gem will cause your servive to break,
so you should test thoroughly after including the gem. After fixing all the issues,
you will be able to sleep better at night knowing that your users aren't
experiencing random, hard-to-reproduce bugs in your code.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/rails_disable_dependency_loading/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
