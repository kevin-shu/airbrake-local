# require "airbrake"
require "airbrake-local/rails"

module AirbrakeLocal
  class << self
    attr_accessor :mailing_list, :mail_period

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

    errorlog = {}

    attributes =  [ 
                    :exception, :backtrace, :error_class, :environment_name,
                    :cgi_data, :error_message, :parameters, :component, :action,
                    :session_data, :project_root, :url
                  ]

    attributes.each do |attr|
      if attr==:cgi_data
        errorlog[attr] = notice[attr].to_json
      else
        errorlog[attr] = notice[attr].to_s
      end
    end

    # puts errorlog.inspect

    # AirbrakeLocal::ErrorLog
    # puts AirbrakeLocal::ErrorLog
    AirbrakeLocal::ErrorLog.create(errorlog)

    AirbrakeLocal::ErrorMailer.error_notify(errorlog).deliver

  end

end


# class Airbrake
#   # class << self
#   #   def send_notice(notice)
#   #     puts notice.inspect
#   #   end
#   # end

#   def send_notice(notice)
#     puts notice.inspect
#   end

#   # class Sender
#   #   def send_to_airbrake(notice)
#   #     puts notice.inspect
#   #   end
#   # end
# end