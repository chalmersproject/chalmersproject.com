# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `hotwire-livereload` gem.
# Please instead update this file by running `bin/tapioca gem hotwire-livereload`.

module Hotwire; end

module Hotwire::Livereload
  class << self
    def railtie_helpers_paths; end
    def railtie_namespace; end
    def railtie_routes_url_helpers(include_path_helpers = T.unsafe(nil)); end
    def table_name_prefix; end
    def use_relative_model_naming?; end
  end
end

Hotwire::Livereload::DISABLE_FILE = T.let(T.unsafe(nil), String)

class Hotwire::Livereload::Engine < ::Rails::Engine
  class << self
    def __callbacks; end
  end
end

module Hotwire::Livereload::LivereloadTagsHelper
  def hotwire_livereload_tags; end
end

class Hotwire::Livereload::ReloadChannel < ::ActionCable::Channel::Base
  def subscribed; end
end
