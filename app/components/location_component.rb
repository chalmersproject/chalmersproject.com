# typed: strict
# frozen_string_literal: true

class LocationComponent < ApplicationComponent
  extend T::Sig

  sig { params(location: T.untyped, kwargs: T.untyped).void }
  def initialize(location:, **kwargs)
    super(**kwargs)
    @location = T.let(location, T.untyped)
  end
end
