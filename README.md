airbrake-local
=============

This project rocks and uses MIT-LICENSE.

Usage:
------
1. Add to Gemfile in production group and bundle: `gem airbrake-local`
2. Run `rails generate airbrake_local:install <PROJECT_NAME>`
3. `rake db:migrate`
4. Change the configuration in config/initializers/airbrake_local.rb
5. That's it!