class AirbrakeLocalCreateErrorLogs < ActiveRecord::Migration
  def change
    create_table(:airbrake_local_error_logs) do |t|

      t.string  :exception
      t.text    :backtrace
      t.string  :error_class
      t.string  :environment_name
      t.text    :cgi_data
      t.string  :error_message
      t.text    :parameters
      t.string  :component
      t.string  :action
      t.text    :session_data
      t.string  :project_root
      t.string  :url

      t.string  :status, :default=>"Unsolved"
      t.string  :assign_to

      t.timestamps
    end
  end
end