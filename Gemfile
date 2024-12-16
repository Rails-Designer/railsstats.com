source "https://rubygems.org"

gem "bootsnap", "~> 1.18", ">= 1.18.4", require: false
gem "rails", "~> 8.0", ">= 8.0.1"
gem "sqlite3", "~> 2.4", ">= 2.4.1"
gem "puma", "~> 6.5"

gem "propshaft", "~> 1.1"
gem "importmap-rails", "~> 2.0", ">= 2.0.3"
gem "turbo-rails", "~> 2.0", ">= 2.0.11"
gem "stimulus-rails", "~> 1.3", ">= 1.3.4"

gem "solid_queue"
gem "solid_cable"

gem "kamal", "~> 2.4", require: false
gem "thruster", "~> 0.1.9", require: false

gem "tzinfo-data", platforms: %i[ windows jruby ]

group :development, :test do
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
  gem "brakeman", require: false
  gem "rubocop-rails-omakase", require: false
end

group :development do
  gem "web-console"
end
