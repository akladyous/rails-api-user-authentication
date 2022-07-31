source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"
gem "rails", "~> 7.0.2", ">= 7.0.2.3"
gem 'puma', '~> 5.6', '>= 5.6.4'
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false
gem "rack-cors"
gem 'pg', '~> 1.4', '>= 1.4.2'
gem 'bcrypt', '~> 3.1', '>= 3.1.18'
gem 'active_model_serializers', '~> 0.10.13'

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

group :development do
    # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
    # gem "spring"
    gem 'faker', require: false
    gem "debug", platforms: %i[ mri mingw x64_mingw ]
    gem "web-console"
end

