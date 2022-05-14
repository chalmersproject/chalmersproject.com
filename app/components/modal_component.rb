# typed: strict
# frozen_string_literal: true

class ModalComponent < ApplicationComponent
  renders_one :trigger
  renders_one :header
  renders_one :body
  renders_one :footer
end
