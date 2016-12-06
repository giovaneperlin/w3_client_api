require 'rails/generators'

class W3ClientApiGenerator < Rails::Generators::Base
  include Rails::Generators::Migration

  def self.source_root
    @source_root ||= File.expand_path(
      File.join(File.dirname(__FILE__), 'templates/')
    )
  end

  def create_w3_client_api_initializer
    template 'w3_client_api.rb',
             'config/initializers/w3_client_api.rb'
  end
end
