EmberCli::Configuration.class_eval do
  def app(name, **options)
    app = App.new(name, options)
    apps.store(name, app)
  end
end
