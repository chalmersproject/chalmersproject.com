# typed: strict
# frozen_string_literal: true

class LoadingOverlayComponent < ApplicationComponent
  extend T::Sig

  sig { params(loading: T::Boolean, kwargs: T.untyped).void }
  def initialize(loading: true, **kwargs)
    super(**kwargs)
    @loading = T.let(loading, T::Boolean)
  end

  sig { returns(T::Boolean) }
  attr_reader :loading
end
