class Project < ApplicationRecord
  include OrderableByTimestamp
  include Decoration

  before_validation :set_slug, if: :new_record?

  normalizes :name, with: -> { _1.strip }
  normalizes :website, with: -> { _1.strip }

  has_many :snapshots, dependent: :destroy
  has_one :current_snapshot, class_name: "Snapshot"

  scope :verified, -> { where.not(verified_at: nil) }

  validates :website, presence: true, uniqueness: { case_sensitive: false }

  def to_param = slug

  delegate :total_lines_count, to: :current_snapshot

  def verify! = update(verified_at: Time.current)

  def verified? = verified_at.present?

  private

  def set_slug
    self.slug = name.to_s.parameterize
  end
end
