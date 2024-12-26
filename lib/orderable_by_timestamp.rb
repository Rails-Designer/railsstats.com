module OrderableByTimestamp
  extend ActiveSupport::Concern

  included do
    scope :by_earliest_created, -> { order(created_at: :asc) }
    scope :by_recently_created, -> { order(created_at: :desc) }
    scope :by_earliest_updated, -> { order(updated_at: :asc) }
    scope :by_recently_updated, -> { order(updated_at: :desc) }
  end
end
