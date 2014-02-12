require "airbrake"

module AirbrakeLocal
  class << self
    attr_accessor :mailing_list, :mail_period, :mail_from

    def setup
      yield self
    end
  end

  def self.table_name_prefix
    'airbrake_local_'
  end
end

Airbrake.instance_eval do

  def send_notice(notice)

    # puts notice.exception
    # puts notice.backtrace
    # puts notice.error_class
    # puts notice.environment_name
    # puts notice.cgi_data
    # puts notice.error_message
    # # puts notice.backtrace_filters
    # puts notice.parameters
    # puts notice.component
    # puts notice.action
    # puts notice.session_data
    # puts notice.project_root
    # puts notice.url

    if notice.environment_name == "production"

      errorlog = AirbrakeLocal::ErrorLog.new
      errorlog_in_hash = {}

      attributes =  [ 
                      :exception, :backtrace, :error_class, :environment_name,
                      :cgi_data, :error_message, :parameters, :component, :action,
                      :session_data, :project_root, :url
                    ]

      attributes.each do |attr|
        if attr==:cgi_data
          errorlog.send("#{attr}=", notice[attr].to_json)
          errorlog_in_hash[attr] = notice[attr].to_json
        else
          errorlog.send("#{attr}=", notice[attr].to_s)
          errorlog_in_hash[attr] = notice[attr].to_s
        end
      end

      # AirbrakeLocal::ErrorLog.create(errorlog)      
      errorlog.save

      # AirbrakeLocal::ErrorMailer.error_notify(errorlog_in_hash).deliver

    end
    
  end
end

require "airbrake_local/rails"