source "https://rubygems.org"

gem "bootsnap", "~> 1.18", require: false
gem "rails", "~> 8.0"
gem "sqlite3", "~> 2.7"
gem "puma", "~> 6.6"

gem "importmap-rails", "~> 2.0", ">= 2.0.3"
gem "invisible_captcha", "~> 2.3"
gem "kramdown", "~> 2.5", ">= 2.5.1"
gem "propshaft", "~> 1.1"
gem "rails_icons", "~> 1.3"
gem "stimulus-rails", "~> 1.3", ">= 1.3.4"
gem "turbo-rails", "~> 2.0"

gem "solid_queue", "~> 1.2"
gem "solid_cable", "~> 3.0"

gem "kamal", "~> 2.7", require: false
gem "thruster", "~> 0.1.14", require: false

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
