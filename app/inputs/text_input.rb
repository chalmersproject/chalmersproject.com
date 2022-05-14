# typed: true
# frozen_string_literal: true

class TextInput < SimpleForm::Inputs::TextInput
  def input_html_options
    super.merge("data-xt-textareaautosize": true)
  end
end
