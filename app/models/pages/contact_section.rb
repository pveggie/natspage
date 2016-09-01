# Admin editable data in the Content Page
class Pages::ContactSection < ActiveRecord::Base
  # == Constants ============================================================

  # == Attributes ===========================================================

  # == Extensions ===========================================================

  # == Relationships ========================================================

  # == Validations ==========================================================
  validate :email_address_is_valid
  validate :social_media_links_are_valid
  # == Scopes ===============================================================

  # == Callbacks ============================================================
  before_validation :clean_data
  # == Class Methods ========================================================

  # == Instance Methods =====================================================
  private

  # ====== Instance methods: Custom Validation
  def email_address_is_valid
    email_regex = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/
    if email.present? && email[email_regex].nil?
      errors.add(:email, "is not valid")
    end
  end

  def social_media_links_are_valid
    attributes.each do |key, value|
      next unless value.is_a?(String) && !value.blank? && key != "email"

      domain_name = key.downcase.gsub("_url", "")

      confirm_domain_matches_attribute(domain_name, value, key)
      confirm_as_url(domain_name, value, key)
    end
  end

  def confirm_domain_matches_attribute(dom_name, url, key)
    if url[/#{dom_name}/].nil?
      errors.add(key
        .to_sym, "does not correspond with the correct social media site.")
    end
  end

  def confirm_as_url(dom_name, url, key)
    url_regex =
      /\A((http|https)\:\/\/)?(www\.)?#{dom_name}.\w+(.\w+)?\/[\w_\-\.]+\/?\z/
    if url[url_regex].nil?
      errors.add(key.to_sym, "is not a valid url. Please check ")
    end
  end

  # ====== Instance methods: Callbacks
  def clean_data
    clean_attributes = {}
    attributes.each do |key, value|
      # clean user inputted strings
      value = value.downcase.strip if value.is_a?(String)

      clean_attributes[key.to_sym] = value
    end
    clean_attributes
  end
end
