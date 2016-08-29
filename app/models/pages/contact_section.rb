# Admin editable data in the Content Page
class Pages::ContactSection < ActiveRecord::Base
  # == Constants ============================================================

  # == Attributes ===========================================================

  # == Extensions ===========================================================

  # == Relationships ========================================================

  # == Validations ==========================================================
  validate :email_address_is_valid

  # == Scopes ===============================================================
  before_validation :clean_data
  # == Callbacks ============================================================

  # == Class Methods ========================================================

  # == Instance Methods =====================================================
  def email_address_is_valid
    email_regex = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/
    if email.present? && email[email_regex].nil?
      errors.add(:email, "is not valid")
    end
  end

  def clean_data
    p @attributes
  #   attributes = @attributes
  #   attributes.each do |attribute|
  #     p attribute
  #   end
  end
end

# send("#{name}=", send(name).strip)
