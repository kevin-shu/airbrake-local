require 'rails/generators/active_record'
require 'airbrake_local/rails'

module AirbrakeLocal
  # module Generators
    class InstallGenerator < ActiveRecord::Generators::Base
      TEMPLATES_PATH = File.expand_path('../templates', __FILE__)
      source_root File.expand_path(Engine.root, __FILE__)

      def install_initializer
        migration_template "#{TEMPLATES_PATH}/migration.rb", "db/migrate/airbrake_local_create_error_logs"
        copy_file "#{TEMPLATES_PATH}/airbrake_local.rb", 'config/initializers/airbrake_local.rb'
      end
    end
  # end
end