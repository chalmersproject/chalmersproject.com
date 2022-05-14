# typed: strict
# frozen_string_literal: true

class BadgeComponent < ApplicationComponent
  extend T::Sig

  sig { params(interactive: T::Boolean, kwargs: T.untyped).void }
  def initialize(interactive: false, **kwargs)
    super(**kwargs)
    @interactive = T.let(interactive, T::Boolean)
  end
end
