EmberCli::App.class_eval do
  def initialize(name, **options)
    @name = name.to_s
    @options = options
    @paths = PathSet.new(
      app: self,
      environment: Rails.env,
      rails_root: Rails.root,
      ember_cli_root: EmberCli.root,
    )
    @shell = Shell.new(
      paths: @paths,
      env: env_hash,
      options: options,
    )
    @build = BuildMonitor.new(name, @paths)
  end
end
