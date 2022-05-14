# typed: strict
# frozen_string_literal: true

class ApplicationComponent < ViewComponent::Base
  extend T::Sig

  sig { params(kwargs: T.untyped).void }
  def initialize(**kwargs)
    super(**kwargs)
    @component_class =
      T.let(
        kwargs.delete(:class) { "" },
        T.any(String, Symbol, T::Array[T.any(String, Symbol)]),
      )
    @component_attributes =
      T.let(
        scoped do
          attributes = kwargs
          if attributes.key?(:attributes)
            attributes.merge!(attributes.delete(:attributes))
          end
          attributes
        end,
        T::Hash[Symbol, T.untyped],
      )
  end

  private

  sig { params(name: T.nilable(String)).returns(String) }
  def component_class_name(name = nil)
    class_name = T.must(self.class.name).underscore
    name.present? ? "#{class_name}-#{name}" : class_name
  end

  sig { params(args: T.untyped).returns(String) }
  def component_class_names(*args)
    helpers.class_names(component_class_name, args, @component_class)
  end
end
