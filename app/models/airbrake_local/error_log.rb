class AirbrakeLocal::ErrorLog < ActiveRecord::Base
  attr_accessible :exception, :backtrace, :error_class, :environment_name,
                  :cgi_data, :error_message, :parameters, :component, :action,
                  :session_data, :project_root, :url,
                  :status, :assign_to
end