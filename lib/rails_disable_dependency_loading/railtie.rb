module RailsDisableDependencyLoading
  class Railtie < ::Rails::Railtie
    # Disable dependency loading during request cycle so you see thread-unsafe dependency loading
    # immediately & consistently. Ideally, I'd like for this to happen *last*, but it's very hard to do that
    # since the Rails standard initializers aren't in place when the gem is loaded. after_initialize is probably
    # good enough...
    config.after_initialize do |app|
      if app.config.eager_load && app.config.cache_classes
        ActiveSupport::Dependencies.unhook!
      end
    end
  end
end
