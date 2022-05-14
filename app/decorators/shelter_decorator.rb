# typed: strict
# frozen_string_literal: true

class ShelterDecorator < ApplicationDecorator
  extend T::Sig

  delegate_all

  sig { returns(T.nilable(String)) }
  def contact_phone
    super.try do |phone|
      phone = Phonelib.parse(phone)
      phone.country == "CA" ? phone.national : phone.international
    end
  end

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end
end
