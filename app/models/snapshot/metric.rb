class Snapshot::Metric < ApplicationRecord
  ALLOWED_NAMES = %w[
    controllers
    helpers
    jobs
    models
    mailers
    views
    viewcomponents
    stylesheets
    javascript
    libraries
    total
  ].freeze

  belongs_to :snapshot

  validates :name, inclusion: {in: ALLOWED_NAMES}
end
