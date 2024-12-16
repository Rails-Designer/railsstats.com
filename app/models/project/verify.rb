class Project::VerificationRequest
  include ActiveModel::Model

  attribute :domain, :string
  attribute :email, :string

  validates :domain, :email, presence: true
  validate :email_matches_domain

  def send_verification
    return false unless valid?

    # TODO
    # verification = Verification.create!(domain: domain)
    # VerificationMailer.domain_verification(email, verification.token).deliver_later
  end

  private

  def email_matches_domain
    return if email.blank? || domain.blank?

    errors.add(:email, "must match domain") unless email.split("@").last == domain
  end
end
