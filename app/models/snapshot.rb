class Snapshot < ApplicationRecord
  belongs_to :project

  has_many :metrics, class_name: "Snapshot::Metric", dependent: :destroy

  def parse = Snapshot::Parse.new(self).run

  def listable_metrics = metrics.excluding(total_lines)

  def total_lines_count = total_lines&.lines

  private

  def total_lines = metrics.find_by(name: "total")
end
