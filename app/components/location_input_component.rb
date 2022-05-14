# typed: strict
# frozen_string_literal: true

class LocationInputComponent < ApplicationComponent
  extend T::Sig

  sig do
    params(
      form: ActionView::Helpers::FormBuilder,
      method: Symbol,
      options: T::Hash[T.any(Symbol, String), T.untyped],
      kwargs: T.untyped,
    ).void
  end
  def initialize(form, method, options = {}, **kwargs)
    super(**kwargs)
    @form = T.let(form, ActionView::Helpers::FormBuilder)
    @method = T.let(method, Symbol)
    @options =
      T.let(
        scoped do
          options[:class] =
            class_names(component_class_name("field"), options[:class])
          options["data-location-input-component-target"] = "field"
          options
        end,
        T::Hash[T.any(Symbol, String), T.untyped],
      )
  end
end
