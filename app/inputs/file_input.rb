# typed: true
# frozen_string_literal: true

class FileInput < SimpleForm::Inputs::Base
  def input(wrapper_options)
    input_options = merge_wrapper_options(input_html_options, wrapper_options)
    template.render(
      FileInputComponent.new(
        @builder,
        attribute_name,
        input_options,
        **options.slice(:class),
      ),
    )
  end
end
