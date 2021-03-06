# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `discard` gem.
# Please instead update this file by running `bin/tapioca gem discard`.

module Discard; end

# = Discard Errors
#
# Generic exception class.
class Discard::DiscardError < ::StandardError; end

# Handles soft deletes of records.
#
# Options:
#
# - :discard_column - The columns used to track soft delete, defaults to `:discarded_at`.
module Discard::Model
  extend ::ActiveSupport::Concern
  include GeneratedInstanceMethods

  mixes_in_class_methods GeneratedClassMethods
  mixes_in_class_methods ::Discard::Model::ClassMethods

  # Discard the record in the database
  #
  # @return [Boolean] true if successful, otherwise false
  def discard; end

  # Discard the record in the database
  #
  # There's a series of callbacks associated with #discard!. If the
  # <tt>before_discard</tt> callback throws +:abort+ the action is cancelled
  # and #discard! raises {Discard::RecordNotDiscarded}.
  #
  # @raise [Discard::RecordNotDiscarded]
  # @return [Boolean] true if successful
  def discard!; end

  # @return [Boolean] true if this record has been discarded, otherwise false
  def discarded?; end

  # @return [Boolean] false if this record has been discarded, otherwise true
  def kept?; end

  # Undiscard the record in the database
  #
  # @return [Boolean] true if successful, otherwise false
  def undiscard; end

  # Discard the record in the database
  #
  # There's a series of callbacks associated with #undiscard!. If the
  # <tt>before_undiscard</tt> callback throws +:abort+ the action is cancelled
  # and #undiscard! raises {Discard::RecordNotUndiscarded}.
  #
  # @raise [Discard::RecordNotUndiscarded]
  # @return [Boolean] true if successful
  def undiscard!; end

  # @return [Boolean] false if this record has been discarded, otherwise true
  def undiscarded?; end

  private

  # @raise [::Discard::RecordNotDiscarded]
  def _raise_record_not_discarded; end

  # @raise [::Discard::RecordNotUndiscarded]
  def _raise_record_not_undiscarded; end

  module GeneratedClassMethods
    def discard_column; end
    def discard_column=(value); end
    def discard_column?; end
  end

  module GeneratedInstanceMethods
    def discard_column; end
    def discard_column=(value); end
    def discard_column?; end
  end
end

module Discard::Model::ClassMethods
  # Discards the records by instantiating each
  # record and calling its {#discard} method.
  # Each object's callbacks are executed.
  # Returns the collection of objects that were discarded.
  #
  # Note: Instantiation, callback execution, and update of each
  # record can be time consuming when you're discarding many records at
  # once. It generates at least one SQL +UPDATE+ query per record (or
  # possibly more, to enforce your callbacks). If you want to discard many
  # rows quickly, without concern for their associations or callbacks, use
  # #update_all(discarded_at: Time.current) instead.
  #
  # ==== Examples
  #
  #   Person.where(age: 0..18).discard_all
  def discard_all; end

  # Discards the records by instantiating each
  # record and calling its {#discard!} method.
  # Each object's callbacks are executed.
  # Returns the collection of objects that were discarded.
  #
  # Note: Instantiation, callback execution, and update of each
  # record can be time consuming when you're discarding many records at
  # once. It generates at least one SQL +UPDATE+ query per record (or
  # possibly more, to enforce your callbacks). If you want to discard many
  # rows quickly, without concern for their associations or callbacks, use
  # #update_all!(discarded_at: Time.current) instead.
  #
  # ==== Examples
  #
  #   Person.where(age: 0..18).discard_all!
  def discard_all!; end

  # Undiscards the records by instantiating each
  # record and calling its {#undiscard} method.
  # Each object's callbacks are executed.
  # Returns the collection of objects that were undiscarded.
  #
  # Note: Instantiation, callback execution, and update of each
  # record can be time consuming when you're undiscarding many records at
  # once. It generates at least one SQL +UPDATE+ query per record (or
  # possibly more, to enforce your callbacks). If you want to undiscard many
  # rows quickly, without concern for their associations or callbacks, use
  # #update_all(discarded_at: nil) instead.
  #
  # ==== Examples
  #
  #   Person.where(age: 0..18).undiscard_all
  def undiscard_all; end

  # Undiscards the records by instantiating each
  # record and calling its {#undiscard!} method.
  # Each object's callbacks are executed.
  # Returns the collection of objects that were undiscarded.
  #
  # Note: Instantiation, callback execution, and update of each
  # record can be time consuming when you're undiscarding many records at
  # once. It generates at least one SQL +UPDATE+ query per record (or
  # possibly more, to enforce your callbacks). If you want to undiscard many
  # rows quickly, without concern for their associations or callbacks, use
  # #update_all!(discarded_at: nil) instead.
  #
  # ==== Examples
  #
  #   Person.where(age: 0..18).undiscard_all!
  def undiscard_all!; end
end

# Raised by {Discard::Model#discard!}
class Discard::RecordNotDiscarded < ::Discard::DiscardError
  # @return [RecordNotDiscarded] a new instance of RecordNotDiscarded
  def initialize(message = T.unsafe(nil), record = T.unsafe(nil)); end

  # Returns the value of attribute record.
  def record; end
end

# Raised by {Discard::Model#undiscard!}
class Discard::RecordNotUndiscarded < ::Discard::DiscardError
  # @return [RecordNotUndiscarded] a new instance of RecordNotUndiscarded
  def initialize(message = T.unsafe(nil), record = T.unsafe(nil)); end

  # Returns the value of attribute record.
  def record; end
end

# Discard version
Discard::VERSION = T.let(T.unsafe(nil), String)
