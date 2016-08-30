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

  def social_media_links_are_valid
    attributes.each do |key, value|
      next unless value.is_a?(String) && key != "email"

      # first want to make sure correct domain_name is used for attribute
      domain_name = key.downcase.gsub("_url", "")
      if value[/#{domain_name}/].nil?
        errors
          .add(key.to_sym, "does not correspond with the correct social media site.")
      end

      social_media_regex = /\A((http|https)\:\/\/)?(www\.)?#{domain_name}.\w+(.\w+)?\/[\w_\-\.]+\z/

      if value[social_media_regex].nil?
        errors.add(key.to_sym, "is not a valid url. Please check ")
      end
    end
  end

  def clean_data
    clean_attributes = Hash.new
    attributes.each do |key, value|
      # clean user inputted strings
      value = value.downcase.strip if value.is_a?(String)

      clean_attributes[key.to_sym] = value
    end
    clean_attributes
  end
end
