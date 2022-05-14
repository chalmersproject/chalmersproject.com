# frozen_string_literal: true

require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems you've limited to
# :test, :development, or :production.
Bundler.require(*Rails.groups)

module Chalmers
  class Application < Rails::Application
    # Load patches and modifications.
    config.before_configuration do
      # Apply core extensions.
      require_dependency "core_ext"
    end

    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults(7.0)

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # Configure generators.
    config.generators do |g|
      # Generate Active Record model and migration with UUID primary keys.
      g.orm(:active_record, primary_key_type: :uuid)

      # Don't generate jbuilder views:
      g.jbuilder(false)

      # Don't generate helpers:
      g.helper(false)

      # Don't generate tests:
      g.test_framework(nil)
      g.controller_specs(false)
      g.view_specs(false)
      g.helper_specs(false)
      g.model_specs(false)
    end

    # == Active Record ==
    config.active_record.internal_metadata_table_name =
      "active_record_internal_metadata"
    config.active_record.schema_migrations_table_name =
      "active_record_schema_migrations"

    # == Action Cable ==
    config.action_cable.mount_path = "/rails/action_cable/cable"

    # == Active Job ==
    # config.active_job.queue_adapter = :good_job

    # == Active Storage ==
    config.active_storage.variant_processor = :vips

    # == Active Support ==
    config.active_support.remove_deprecated_time_with_zone_name = true
  end
end
