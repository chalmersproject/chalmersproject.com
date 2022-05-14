# typed: true
# frozen_string_literal: true

class LocationInput < SimpleForm::Inputs::Base
  def input(wrapper_options)
    options = merge_wrapper_options(input_html_options, wrapper_options)
    template.render(
      LocationInputComponent.new(
        @builder,
        attribute_name,
        options,
        **options.slice(:class),
      ),
    )
  end
end
