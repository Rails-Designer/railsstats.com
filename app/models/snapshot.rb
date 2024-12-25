class Snapshot < ApplicationRecord
  belongs_to :project

  has_many :metrics, class_name: "Snapshot::Metric", dependent: :destroy

  def parse = Snapshot::Parse.new(self).run

  def total_count = metrics.find_by(name: "total")&.lines
end
