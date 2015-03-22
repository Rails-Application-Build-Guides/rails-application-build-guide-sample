@app_name = app_name
@template_dir = File.dirname(__FILE__)

# ==========
# Gems
# ==========

run 'rm Gemfile'
run 'touch Gemfile'

append_file 'Gemfile', <<-CODE
source 'https://rubygems.org'

gem 'rails', '4.1.0'
gem 'mysql2' # Use Mysql
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'therubyracer',  platforms: :ruby
gem 'less-rails'
gem 'twitter-bootstrap-rails'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'spring', group: :development
gem 'twitter-bootstrap-rails'
gem 'therubyracer',  platforms: :ruby
gem 'migration_comments'
gem 'foreigner'

group :development do
  gem 'annotate'
end

group :development, :test do
  gem 'pry'
  gem 'pry-doc'
  gem 'pry-rails'
  gem 'pry-byebug'
end
CODE

# optional gems
# if yes?("Use cocoon?")
#   gem 'cocoon'
# end
# if yes?("Use Draper?")
#   gem 'draper'
# end
# if yes?("Use ransack?")
#   gem 'ransack', github: 'activerecord-hackery/ransack', branch: 'rails-4.1'
# end

# install gems
run 'bundle install'



# ==========
# Test
# ==========

remove_dir 'test'


# ==========
# Git
# ==========

run "cat << EOF >> .gitignore
/.bundle
/db/*.sqlite3
/db/*.sqlite3-journal
/log/*.log
/tmp
database.yml
doc/
*.swp
*~
.project
.idea
.secret
.DS_Store
EOF"


# ==========
# Database Settings
# ==========

run "rm config/database.yml"

run "cat << EOF >> config/database.yml
development:
  adapter: mysql2
  encoding: utf8
  database: rails_guide_development
  pool: 5
  timeout: 5000
  username: root
  password:
  collation: utf8_bin

test:
  adapter: mysql2
  encoding: utf8
  database: rails_guide_test
  pool: 5
  timeout: 5000
  username: root
  password:
  collation: utf8_bin

production:
  adapter: mysql2
  encoding: utf8
  database: rails_guide
  pool: 5
  timeout: 5000
  username: root
  password:
  collation: utf8_bin
EOF"

gsub_file 'config/application.rb', /config.active_record.raise_in_transactional_callbacks = true/, ''
run 'bundle exec rake db:drop db:create db:migrate db:seed'

# ==========
# Assets
# ==========
run "rm public/index.html"
run "cp #{@template_dir}/assets/javascripts/* app/assets/javascripts/"
run "cp #{@template_dir}/assets/stylesheets/* app/assets/stylesheets/"
run "cp -rf #{@template_dir}/views/shared app/views"
run "cp #{@template_dir}/views/layouts/application.html.erb app/views/layouts/application.html.erb"
run "cp #{@template_dir}/helpers/application_helper.rb app/helpers/application_helper.rb"
run "cp #{@template_dir}/config/locales/ja.yml config/locales"

# config/application.rb
application do
  %q{
    config.i18n.default_locale = :ja
    config.action_view.field_error_proc = Proc.new do |html_tag, _|
      "<div class=\"has-error\">#{html_tag}</div>".html_safe
    end
    config.autoload_paths += Dir["#{config.root}/app/models/validators"]

    config.generators do |g|
      g.test_framework nil
      g.helper false
    end
  }
end

# ==========
# Initial Controller
# ==========

run 'bundle exec rails generate scaffold products name:string'
run 'bundle exec rake db:migrate annotate'
route "root to: 'products#index'"
