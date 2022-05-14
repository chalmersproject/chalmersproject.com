# typed: strict
# frozen_string_literal: true

class ShelterComponent < ApplicationComponent
  extend T::Sig

  sig { params(shelter: T.untyped, kwargs: T.untyped).void }
  def initialize(shelter:, **kwargs)
    super(**kwargs)
    @shelter = T.let(shelter, T.untyped)
  end
end
