class Snapshot::Metric < ApplicationRecord
  include Decoration

  ALLOWED_NAMES = {
    controllers: "Controllers",
    helpers: "Helpers",
    javascript: "JavaScript",
    jobs: "Background Jobs",
    libraries: "Libraries",
    mailers: "Mailers",
    models: "Models",
    stylesheets: "CSS",
    total: "Total",
    viewcomponents: "ViewComponents",
    views: "View Templates"
  }.freeze

  VISIBLE_KEYS = %w[
    lines_of_code
    classes
    methods
  ].freeze

  belongs_to :snapshot

  validates :name, inclusion: {in: ALLOWED_NAMES.keys}
end
