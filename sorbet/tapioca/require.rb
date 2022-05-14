# typed: true
# frozen_string_literal: true

require "active_record/connection_adapters/postgresql_adapter"
require "active_record/connection_adapters/postgis_adapter"
require "annotate"
require "rubocop"
require "sprockets/railtie"
require "stimulus/manifest"

# Eager-load and initialize application.
Rails.application.eager_load!
Rails.application.initialize!
