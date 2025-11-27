source "https://rubygems.org"

gem "bootsnap", "~> 1.19", require: false
gem "rails", "~> 8.1"
gem "sqlite3", "~> 2.8"
gem "puma", "~> 7.1"

gem "importmap-rails", "~> 2.2"
gem "invisible_captcha", "~> 2.3"
gem "kramdown", "~> 2.5", ">= 2.5.1"
gem "propshaft", "~> 1.3"
gem "rails_icons", "~> 1.5"
gem "stimulus-rails", "~> 1.3", ">= 1.3.4"
gem "turbo-rails", "~> 2.0"

gem "solid_queue", "~> 1.2"
gem "solid_cable", "~> 3.0"

gem "kamal", "~> 2.9", require: false
gem "thruster", "~> 0.1.16", require: false

gem "tzinfo-data", platforms: %i[ windows jruby ]

group :development, :test do
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
  gem "brakeman", require: false
  gem "rubocop-rails-omakase", require: false
end

group :development do
  gem "hotwire-spark", "~> 0.1.13"
  gem "web-console"
end
