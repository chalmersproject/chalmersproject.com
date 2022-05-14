# typed: strict
# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  # == Attributes ==
  attribute :id, :uuid, default: -> { SecureRandom.uuid }
end
