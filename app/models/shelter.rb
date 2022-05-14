# typed: strict
# frozen_string_literal: true

# == Schema Information
#
# Table name: shelters
#
#  id                :uuid             not null, primary key
#  about             :text             not null
#  address           :string           not null
#  contact_email     :string
#  contact_phone     :string
#  food_availability :string
#  location          :geography        not null, geometry, 4326
#  name              :string           not null
#  slug              :string           not null
#  tags              :string           default([]), not null, is an Array
#  website_url       :string
#  created_at        :timestamptz      not null
#  updated_at        :timestamptz      not null
#
# Indexes
#
#  index_shelters_on_contact_email  (contact_email) UNIQUE
#  index_shelters_on_contact_phone  (contact_phone) UNIQUE
#  index_shelters_on_name           (name) UNIQUE
#  index_shelters_on_slug           (slug) UNIQUE
#

class Shelter < ApplicationRecord
  extend T::Sig

  # == Attributes ==
  attribute :location, :geometry, srid: 4326, geographic: true

  # == Validation ==
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :slug, presence: true, uniqueness: { case_sensitive: false }

  validates :location, presence: true
  validates :address, presence: true

  validates :contact_email,
            length: {
              maximum: 100,
            },
            email: {
              mode: :strict,
            },
            uniqueness: {
              case_sensitive: false,
            },
            allow_nil: true
  validates :contact_email,
            presence: {
              message: "can't be blank unless there's a contact phone number",
            },
            unless: :contact_phone?

  validates :contact_phone, phone: true, uniqueness: true, allow_nil: true
  validates :contact_phone,
            presence: {
              message: "can't be blank unless there's a contact email address",
            },
            unless: :contact_email?

  # == Callbacks ==
  after_validation :normalize_contact_phone
  after_validation :normalize_contact_email

  # == Attachments ==
  has_one_attached :image

  # == FriendlyId ==
  include FriendlyId
  friendly_id :name

  sig { returns(T::Boolean) }
  def should_generate_new_friendly_id?
    name.present? && name_changed?
  end

  private

  sig { void }
  def normalize_contact_phone
    contact_phone.try! do |phone|
      self.contact_phone = Phonelib.parse(phone).to_s
    end
  end

  sig { void }
  def normalize_contact_email
    contact_email&.downcase!
  end
end
