require 'yaml'
require_relative 'load_path'
require_relative 'erb_binding'

module ConfigHelper
  extend self

  def load_config(filename, params = { })
    path = LoadPath.base_path(filename)
    if !File.exist?(path)
      abort "Configuration file #{path} does not exist"
    end
    load_from_path(path, params)
  end

  def load_from_path(path, params = { })
    YAML::load(ErbBinding.erb(File.read(path), params))
  end
end
