class ApplicationForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  def model_name = ActiveModel::Name.new(self, nil, self.class.name.sub(/Form$/, ""))
end
