# typed: strict
# frozen_string_literal: true

# Use TIMESTAMPTZ as native type for :datetime columns
ActiveRecord::ConnectionAdapters::PostGISAdapter.datetime_type = :timestamptz
