# typed: true
# frozen_string_literal: true

# Produce pretty JSON during development.
if Rails.env.development?
  module ActiveSupport
    module JSON
      module Encoding
        class JSONGemEncoder
          # Replaces the JSON gem encoder's string-ify method with a
          # pretty-generator implementation. Just clobbers the original method,
          # so makes assumptions about method name, arguments and
          # implementation details. That makes it Rails version dependent.
          # Useful just for development only.
          def stringify(jsonified)
            ::JSON.pretty_generate(jsonified)
          end
        end
      end
    end
  end
end
