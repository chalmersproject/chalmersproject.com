# typed: strict
# frozen_string_literal: true

class FileInputComponent < ApplicationComponent
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
          options["data-file-input-component-target"] = "field"
          options
        end,
        T::Hash[T.any(Symbol, String), T.untyped],
      )
  end

  private

  sig { returns(T.nilable(ActiveStorage::Blob)) }
  def blob
    @form.object.public_send(@method).try(&:blob)
  end

  sig { returns(T::Boolean) }
  def blob?
    blob.present?
  end

  sig { returns(T.nilable(T::Boolean)) }
  def previewable?
    blob.try! do |blob|
      T.cast(blob, ActiveStorage::Blob)
      blob.image? || blob.previewable?
    end
  end

  sig do
    returns(
      T.nilable(
        T.any(ActiveStorage::VariantWithRecord, ActiveStorage::Preview),
      ),
    )
  end
  def preview
    preview_options = { resize_to_limit: [512, 512] }
    blob.try! do |blob|
      T.cast(blob, ActiveStorage::Blob)
      if blob.image?
        blob.variant(preview_options)
      elsif blob.previewable?
        blob.preview(preview_options)
      end
    end
  end

  delegate :filename, :signed_id, to: :blob, allow_nil: true
end
