# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `stimulus-rails` gem.
# Please instead update this file by running `bin/tapioca gem stimulus-rails`.

module Stimulus; end

class Stimulus::Engine < ::Rails::Engine
  class << self
    def __callbacks; end
  end
end

module Stimulus::Manifest
  extend ::Stimulus::Manifest

  def extract_controllers_from(directory); end
  def generate_from(controllers_path); end
  def import_and_register_controller(controllers_path, controller_path); end
end

Stimulus::VERSION = T.let(T.unsafe(nil), String)