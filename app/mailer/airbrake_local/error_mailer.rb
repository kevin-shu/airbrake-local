# encoding: utf-8
module AirbrakeLocal
  class ErrorMailer < ActionMailer::Base
    default from: "server@example.com"

    def error_notify errorlog
      @errorlog = errorlog
      mail  to: AirbrakeLocal.mailing_list,
            subject: "#{errorlog[:error_class]}:#{errorlog[:exception]}"
    end
  end
end