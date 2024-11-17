class Snapshot::CreateForm < ApplicationForm
  attribute :project_name, :string
  attribute :founded_at, :datetime
  attribute :website, :string
  attribute :raw_data, :string

  validates :name, :founded_at, :website, :raw_data, presence: true
  validates :website, presence: true, format: URI::DEFAULT_PARSER.make_regexp(%w[http https])

  def save = project.snapshots.create(raw_data: raw_data).tap { _1.parse }

  def model_name = ActiveModel::Name.new(self, nil, "Snapshot")

  private

  def project = Project.where(name: project_name, founded_at: founded_at, website: website).first_or_create
end
