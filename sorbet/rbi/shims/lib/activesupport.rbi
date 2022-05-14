# typed: strong

module ActiveSupport
  module Dependencies
    sig { returns(ActiveSupport::Dependencies::Interlock) }
    def self.interlock; end
  end

  # module Tryable
  #   sig do
  #     type_parameters(:U)
  #       .params(
  #         args: T.untyped,
  #         kwargs: T.untyped,
  #         block:
  #           T.nilable(
  #             T.proc.params(arg: T.self_type).returns(T.type_parameter(:U)),
  #           ),
  #       )
  #       .returns(T.type_parameter(:U))
  #   end
  #   def try2(*args, **kwargs, &block); end

  #   sig do
  #     type_parameters(:T)
  #       .params(
  #         args: T.untyped,
  #         kwargs: T.untyped,
  #         block:
  #           T.nilable(
  #             T.proc.params(arg: T.self_type).returns(T.type_parameter(:T)),
  #           ),
  #       )
  #       .returns(T.type_parameter(:T))
  #   end
  #   def try!(*args, **kwargs, &block); end
  # end
end

class Object
  sig { returns(T::Boolean) }
  def present?; end
end
