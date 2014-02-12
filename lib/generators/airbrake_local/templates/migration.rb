class AirbrakeLocalCreateErrorLogs < ActiveRecord::Migration
  def change
    create_table(:airbrake_local_error_logs) do |t|

      t.text    :exception
      t.text    :backtrace
      t.text    :error_class
      t.string  :environment_name
      t.text    :cgi_data
      t.text    :error_message
      t.text    :parameters
      t.text    :component
      t.text    :action
      t.text    :session_data
      t.text    :project_root, :limit=>512
      t.text    :url

      t.string  :status, :default=>"Unsolved"
      t.string  :assign_to

      t.timestamps
    end
  end
end