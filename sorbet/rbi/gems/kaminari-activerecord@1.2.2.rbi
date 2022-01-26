# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `kaminari-activerecord` gem.
# Please instead update this file by running `bin/tapioca gem kaminari-activerecord`.

module Kaminari
  class << self
    def config; end
    def configure; end
    def paginate_array(array, limit: T.unsafe(nil), offset: T.unsafe(nil), total_count: T.unsafe(nil), padding: T.unsafe(nil)); end
  end
end

module Kaminari::ActiveRecordExtension
  extend ::ActiveSupport::Concern

  mixes_in_class_methods ::Kaminari::ActiveRecordExtension::ClassMethods
end

module Kaminari::ActiveRecordExtension::ClassMethods
  # Future subclasses will pick up the model extension
  def inherited(kls); end
end

module Kaminari::ActiveRecordModelExtension
  extend ::ActiveSupport::Concern
  include ::Kaminari::ConfigurationMethods

  mixes_in_class_methods ::Kaminari::ConfigurationMethods::ClassMethods
end

# Active Record specific page scope methods implementations
module Kaminari::ActiveRecordRelationMethods
  # Used for page_entry_info
  def entry_name(options = T.unsafe(nil)); end

  def reset; end
  def total_count(column_name = T.unsafe(nil), _options = T.unsafe(nil)); end

  # Turn this Relation to a "without count mode" Relation.
  # Note that the "without count mode" is supposed to be performant but has a feature limitation.
  # Pro: paginates without casting an extra SELECT COUNT query
  # Con: unable to know the total number of records/pages
  def without_count; end
end

module Kaminari::Activerecord; end
Kaminari::Activerecord::VERSION = T.let(T.unsafe(nil), String)

# A module that makes AR::Relation paginatable without having to cast another SELECT COUNT query
module Kaminari::PaginatableWithoutCount
  # The page wouldn't be the last page if there's "limit + 1" record
  def last_page?; end

  # Overwrite AR::Relation#load to actually load one more record to judge if the page has next page
  # then store the result in @_has_next ivar
  def load; end

  # Empty relation needs no pagination
  def out_of_range?; end

  # Force to raise an exception if #total_count is called explicitly.
  def total_count; end
end

module Kaminari::PaginatableWithoutCount::LimitValueSetter; end