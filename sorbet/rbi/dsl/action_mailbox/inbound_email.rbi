# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for dynamic methods in `ActionMailbox::InboundEmail`.
# Please instead update this file by running `bin/tapioca dsl ActionMailbox::InboundEmail`.

class ActionMailbox::InboundEmail
  include GeneratedAssociationMethods
  include EnumMethodsModule
  extend CommonRelationMethods
  extend GeneratedRelationMethods

  sig { returns(ActiveStorage::Attached::One) }
  def raw_email; end

  sig { params(attachable: T.untyped).returns(T.untyped) }
  def raw_email=(attachable); end

  private

  sig { returns(NilClass) }
  def to_ary; end

  class << self
    sig { returns(T::Hash[T.any(String, Symbol), Integer]) }
    def statuses; end
  end

  module CommonRelationMethods
    sig { params(block: T.nilable(T.proc.params(record: ::ActionMailbox::InboundEmail).returns(T.untyped))).returns(T::Boolean) }
    def any?(&block); end

    sig { params(column_name: T.any(String, Symbol)).returns(T.untyped) }
    def average(column_name); end

    sig { params(attributes: T.untyped, block: T.nilable(T.proc.params(object: ::ActionMailbox::InboundEmail).void)).returns(::ActionMailbox::InboundEmail) }
    def build(attributes = nil, &block); end

    sig { params(operation: Symbol, column_name: T.any(String, Symbol)).returns(T.untyped) }
    def calculate(operation, column_name); end

    sig { params(column_name: T.untyped).returns(T.untyped) }
    def count(column_name = nil); end

    sig { params(attributes: T.untyped, block: T.nilable(T.proc.params(object: ::ActionMailbox::InboundEmail).void)).returns(::ActionMailbox::InboundEmail) }
    def create(attributes = nil, &block); end

    sig { params(attributes: T.untyped, block: T.nilable(T.proc.params(object: ::ActionMailbox::InboundEmail).void)).returns(::ActionMailbox::InboundEmail) }
    def create!(attributes = nil, &block); end

    sig { params(attributes: T.untyped, block: T.nilable(T.proc.params(object: ::ActionMailbox::InboundEmail).void)).returns(::ActionMailbox::InboundEmail) }
    def create_or_find_by(attributes, &block); end

    sig { params(attributes: T.untyped, block: T.nilable(T.proc.params(object: ::ActionMailbox::InboundEmail).void)).returns(::ActionMailbox::InboundEmail) }
    def create_or_find_by!(attributes, &block); end

    sig { returns(T::Array[::ActionMailbox::InboundEmail]) }
    def destroy_all; end

    sig { params(conditions: T.untyped).returns(T::Boolean) }
    def exists?(conditions = :none); end

    sig { returns(T.nilable(::ActionMailbox::InboundEmail)) }
    def fifth; end

    sig { returns(::ActionMailbox::InboundEmail) }
    def fifth!; end

    sig { params(args: T.untyped).returns(T.untyped) }
    def find(*args); end

    sig { params(args: T.untyped).returns(T.nilable(::ActionMailbox::InboundEmail)) }
    def find_by(*args); end

    sig { params(args: T.untyped).returns(::ActionMailbox::InboundEmail) }
    def find_by!(*args); end

    sig { params(attributes: T.untyped, block: T.nilable(T.proc.params(object: ::ActionMailbox::InboundEmail).void)).returns(::ActionMailbox::InboundEmail) }
    def find_or_create_by(attributes, &block); end

    sig { params(attributes: T.untyped, block: T.nilable(T.proc.params(object: ::ActionMailbox::InboundEmail).void)).returns(::ActionMailbox::InboundEmail) }
    def find_or_create_by!(attributes, &block); end

    sig { params(attributes: T.untyped, block: T.nilable(T.proc.params(object: ::ActionMailbox::InboundEmail).void)).returns(::ActionMailbox::InboundEmail) }
    def find_or_initialize_by(attributes, &block); end

    sig { returns(T.nilable(::ActionMailbox::InboundEmail)) }
    def find_sole_by; end

    sig { params(limit: T.untyped).returns(T.untyped) }
    def first(limit = nil); end

    sig { returns(::ActionMailbox::InboundEmail) }
    def first!; end

    sig { returns(T.nilable(::ActionMailbox::InboundEmail)) }
    def forty_two; end

    sig { returns(::ActionMailbox::InboundEmail) }
    def forty_two!; end

    sig { returns(T.nilable(::ActionMailbox::InboundEmail)) }
    def fourth; end

    sig { returns(::ActionMailbox::InboundEmail) }
    def fourth!; end

    sig { returns(Array) }
    def ids; end

    sig { params(record: T.untyped).returns(T::Boolean) }
    def include?(record); end

    sig { params(limit: T.untyped).returns(T.untyped) }
    def last(limit = nil); end

    sig { returns(::ActionMailbox::InboundEmail) }
    def last!; end

    sig { params(block: T.nilable(T.proc.params(record: ::ActionMailbox::InboundEmail).returns(T.untyped))).returns(T::Boolean) }
    def many?(&block); end

    sig { params(column_name: T.any(String, Symbol)).returns(T.untyped) }
    def maximum(column_name); end

    sig { params(record: T.untyped).returns(T::Boolean) }
    def member?(record); end

    sig { params(column_name: T.any(String, Symbol)).returns(T.untyped) }
    def minimum(column_name); end

    sig { params(attributes: T.untyped, block: T.nilable(T.proc.params(object: ::ActionMailbox::InboundEmail).void)).returns(::ActionMailbox::InboundEmail) }
    def new(attributes = nil, &block); end

    sig { params(block: T.nilable(T.proc.params(record: ::ActionMailbox::InboundEmail).returns(T.untyped))).returns(T::Boolean) }
    def none?(&block); end

    sig { params(block: T.nilable(T.proc.params(record: ::ActionMailbox::InboundEmail).returns(T.untyped))).returns(T::Boolean) }
    def one?(&block); end

    sig { params(column_names: T.untyped).returns(T.untyped) }
    def pick(*column_names); end

    sig { params(column_names: T.untyped).returns(T.untyped) }
    def pluck(*column_names); end

    sig { returns(T.nilable(::ActionMailbox::InboundEmail)) }
    def second; end

    sig { returns(::ActionMailbox::InboundEmail) }
    def second!; end

    sig { returns(T.nilable(::ActionMailbox::InboundEmail)) }
    def second_to_last; end

    sig { returns(::ActionMailbox::InboundEmail) }
    def second_to_last!; end

    sig { returns(T.nilable(::ActionMailbox::InboundEmail)) }
    def sole; end

    sig { params(column_name: T.nilable(T.any(String, Symbol)), block: T.nilable(T.proc.params(record: T.untyped).returns(T.untyped))).returns(T.untyped) }
    def sum(column_name = nil, &block); end

    sig { params(limit: T.untyped).returns(T.untyped) }
    def take(limit = nil); end

    sig { returns(::ActionMailbox::InboundEmail) }
    def take!; end

    sig { returns(T.nilable(::ActionMailbox::InboundEmail)) }
    def third; end

    sig { returns(::ActionMailbox::InboundEmail) }
    def third!; end

    sig { returns(T.nilable(::ActionMailbox::InboundEmail)) }
    def third_to_last; end

    sig { returns(::ActionMailbox::InboundEmail) }
    def third_to_last!; end
  end

  module EnumMethodsModule
    sig { void }
    def bounced!; end

    sig { returns(T::Boolean) }
    def bounced?; end

    sig { void }
    def delivered!; end

    sig { returns(T::Boolean) }
    def delivered?; end

    sig { void }
    def failed!; end

    sig { returns(T::Boolean) }
    def failed?; end

    sig { void }
    def pending!; end

    sig { returns(T::Boolean) }
    def pending?; end

    sig { void }
    def processing!; end

    sig { returns(T::Boolean) }
    def processing?; end
  end

  module GeneratedAssociationMethods
    sig { params(args: T.untyped, blk: T.untyped).returns(T.untyped) }
    def build_raw_email_attachment(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(T.untyped) }
    def build_raw_email_blob(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(T.untyped) }
    def create_raw_email_attachment(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(T.untyped) }
    def create_raw_email_attachment!(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(T.untyped) }
    def create_raw_email_blob(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(T.untyped) }
    def create_raw_email_blob!(*args, &blk); end

    sig { returns(T.nilable(T.untyped)) }
    def raw_email_attachment; end

    sig { params(value: T.nilable(T.untyped)).void }
    def raw_email_attachment=(value); end

    sig { returns(T.nilable(T.untyped)) }
    def raw_email_blob; end

    sig { params(value: T.nilable(T.untyped)).void }
    def raw_email_blob=(value); end

    sig { returns(T.nilable(T.untyped)) }
    def reload_raw_email_attachment; end

    sig { returns(T.nilable(T.untyped)) }
    def reload_raw_email_blob; end
  end

  module GeneratedAssociationRelationMethods
    sig { returns(PrivateAssociationRelation) }
    def all; end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateAssociationRelation) }
    def and(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateAssociationRelation) }
    def annotate(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateAssociationRelation) }
    def bounced(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateAssociationRelation) }
    def create_with(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateAssociationRelation) }
    def delivered(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateAssociationRelation) }
    def distinct(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateAssociationRelation) }
    def eager_load(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateAssociationRelation) }
    def except(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateAssociationRelation) }
    def excluding(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateAssociationRelation) }
    def extending(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateAssociationRelation) }
    def extract_associated(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateAssociationRelation) }
    def failed(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateAssociationRelation) }
    def from(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateAssociationRelation) }
    def group(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateAssociationRelation) }
    def having(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateAssociationRelation) }
    def in_order_of(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateAssociationRelation) }
    def includes(*args, &blk); end

    sig { params(attributes: Hash, returning: T.nilable(T.any(T::Array[Symbol], FalseClass)), unique_by: T.nilable(T.any(T::Array[Symbol], Symbol))).returns(ActiveRecord::Result) }
    def insert(attributes, returning: nil, unique_by: nil); end

    sig { params(attributes: Hash, returning: T.nilable(T.any(T::Array[Symbol], FalseClass))).returns(ActiveRecord::Result) }
    def insert!(attributes, returning: nil); end

    sig { params(attributes: T::Array[Hash], returning: T.nilable(T.any(T::Array[Symbol], FalseClass)), unique_by: T.nilable(T.any(T::Array[Symbol], Symbol))).returns(ActiveRecord::Result) }
    def insert_all(attributes, returning: nil, unique_by: nil); end

    sig { params(attributes: T::Array[Hash], returning: T.nilable(T.any(T::Array[Symbol], FalseClass))).returns(ActiveRecord::Result) }
    def insert_all!(attributes, returning: nil); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateAssociationRelation) }
    def invert_where(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateAssociationRelation) }
    def joins(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateAssociationRelation) }
    def left_joins(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateAssociationRelation) }
    def left_outer_joins(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateAssociationRelation) }
    def limit(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateAssociationRelation) }
    def lock(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateAssociationRelation) }
    def merge(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateAssociationRelation) }
    def none(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateAssociationRelation) }
    def not_bounced(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateAssociationRelation) }
    def not_delivered(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateAssociationRelation) }
    def not_failed(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateAssociationRelation) }
    def not_pending(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateAssociationRelation) }
    def not_processing(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateAssociationRelation) }
    def offset(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateAssociationRelation) }
    def only(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateAssociationRelation) }
    def optimizer_hints(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateAssociationRelation) }
    def or(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateAssociationRelation) }
    def order(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateAssociationRelation) }
    def pending(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateAssociationRelation) }
    def preload(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateAssociationRelation) }
    def processing(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateAssociationRelation) }
    def readonly(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateAssociationRelation) }
    def references(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateAssociationRelation) }
    def reorder(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateAssociationRelation) }
    def reselect(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateAssociationRelation) }
    def reverse_order(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateAssociationRelation) }
    def rewhere(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateAssociationRelation) }
    def select(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateAssociationRelation) }
    def strict_loading(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateAssociationRelation) }
    def structurally_compatible?(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateAssociationRelation) }
    def uniq!(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateAssociationRelation) }
    def unscope(*args, &blk); end

    sig { params(attributes: Hash, returning: T.nilable(T.any(T::Array[Symbol], FalseClass)), unique_by: T.nilable(T.any(T::Array[Symbol], Symbol))).returns(ActiveRecord::Result) }
    def upsert(attributes, returning: nil, unique_by: nil); end

    sig { params(attributes: T::Array[Hash], returning: T.nilable(T.any(T::Array[Symbol], FalseClass)), unique_by: T.nilable(T.any(T::Array[Symbol], Symbol))).returns(ActiveRecord::Result) }
    def upsert_all(attributes, returning: nil, unique_by: nil); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateAssociationRelationWhereChain) }
    def where(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateAssociationRelation) }
    def with_attached_raw_email(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateAssociationRelation) }
    def without(*args, &blk); end
  end

  module GeneratedRelationMethods
    sig { returns(PrivateRelation) }
    def all; end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateRelation) }
    def and(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateRelation) }
    def annotate(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateRelation) }
    def bounced(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateRelation) }
    def create_with(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateRelation) }
    def delivered(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateRelation) }
    def distinct(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateRelation) }
    def eager_load(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateRelation) }
    def except(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateRelation) }
    def excluding(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateRelation) }
    def extending(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateRelation) }
    def extract_associated(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateRelation) }
    def failed(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateRelation) }
    def from(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateRelation) }
    def group(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateRelation) }
    def having(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateRelation) }
    def in_order_of(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateRelation) }
    def includes(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateRelation) }
    def invert_where(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateRelation) }
    def joins(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateRelation) }
    def left_joins(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateRelation) }
    def left_outer_joins(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateRelation) }
    def limit(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateRelation) }
    def lock(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateRelation) }
    def merge(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateRelation) }
    def none(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateRelation) }
    def not_bounced(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateRelation) }
    def not_delivered(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateRelation) }
    def not_failed(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateRelation) }
    def not_pending(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateRelation) }
    def not_processing(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateRelation) }
    def offset(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateRelation) }
    def only(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateRelation) }
    def optimizer_hints(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateRelation) }
    def or(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateRelation) }
    def order(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateRelation) }
    def pending(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateRelation) }
    def preload(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateRelation) }
    def processing(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateRelation) }
    def readonly(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateRelation) }
    def references(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateRelation) }
    def reorder(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateRelation) }
    def reselect(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateRelation) }
    def reverse_order(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateRelation) }
    def rewhere(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateRelation) }
    def select(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateRelation) }
    def strict_loading(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateRelation) }
    def structurally_compatible?(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateRelation) }
    def uniq!(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateRelation) }
    def unscope(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateRelationWhereChain) }
    def where(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateRelation) }
    def with_attached_raw_email(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(PrivateRelation) }
    def without(*args, &blk); end
  end

  class PrivateAssociationRelation < ::ActiveRecord::AssociationRelation
    include CommonRelationMethods
    include GeneratedAssociationRelationMethods

    sig { returns(T::Array[::ActionMailbox::InboundEmail]) }
    def to_ary; end

    Elem = type_member(fixed: ::ActionMailbox::InboundEmail)
  end

  class PrivateAssociationRelationWhereChain < PrivateAssociationRelation
    sig { params(args: T.untyped).returns(PrivateAssociationRelation) }
    def associated(*args); end

    sig { params(args: T.untyped).returns(PrivateAssociationRelation) }
    def missing(*args); end

    sig { params(opts: T.untyped, rest: T.untyped).returns(PrivateAssociationRelation) }
    def not(opts, *rest); end

    Elem = type_member(fixed: ::ActionMailbox::InboundEmail)
  end

  class PrivateCollectionProxy < ::ActiveRecord::Associations::CollectionProxy
    include CommonRelationMethods
    include GeneratedAssociationRelationMethods

    sig { params(records: T.any(::ActionMailbox::InboundEmail, T::Enumerable[T.any(::ActionMailbox::InboundEmail, T::Enumerable[::ActionMailbox::InboundEmail])])).returns(PrivateCollectionProxy) }
    def <<(*records); end

    sig { params(records: T.any(::ActionMailbox::InboundEmail, T::Enumerable[T.any(::ActionMailbox::InboundEmail, T::Enumerable[::ActionMailbox::InboundEmail])])).returns(PrivateCollectionProxy) }
    def append(*records); end

    sig { returns(PrivateCollectionProxy) }
    def clear; end

    sig { params(records: T.any(::ActionMailbox::InboundEmail, T::Enumerable[T.any(::ActionMailbox::InboundEmail, T::Enumerable[::ActionMailbox::InboundEmail])])).returns(PrivateCollectionProxy) }
    def concat(*records); end

    sig { params(records: T.any(::ActionMailbox::InboundEmail, Integer, String, T::Enumerable[T.any(::ActionMailbox::InboundEmail, Integer, String, T::Enumerable[::ActionMailbox::InboundEmail])])).returns(T::Array[::ActionMailbox::InboundEmail]) }
    def delete(*records); end

    sig { params(records: T.any(::ActionMailbox::InboundEmail, Integer, String, T::Enumerable[T.any(::ActionMailbox::InboundEmail, Integer, String, T::Enumerable[::ActionMailbox::InboundEmail])])).returns(T::Array[::ActionMailbox::InboundEmail]) }
    def destroy(*records); end

    sig { returns(T::Array[::ActionMailbox::InboundEmail]) }
    def load_target; end

    sig { params(records: T.any(::ActionMailbox::InboundEmail, T::Enumerable[T.any(::ActionMailbox::InboundEmail, T::Enumerable[::ActionMailbox::InboundEmail])])).returns(PrivateCollectionProxy) }
    def prepend(*records); end

    sig { params(records: T.any(::ActionMailbox::InboundEmail, T::Enumerable[T.any(::ActionMailbox::InboundEmail, T::Enumerable[::ActionMailbox::InboundEmail])])).returns(PrivateCollectionProxy) }
    def push(*records); end

    sig { params(other_array: T.any(::ActionMailbox::InboundEmail, T::Enumerable[T.any(::ActionMailbox::InboundEmail, T::Enumerable[::ActionMailbox::InboundEmail])])).returns(T::Array[::ActionMailbox::InboundEmail]) }
    def replace(other_array); end

    sig { returns(PrivateAssociationRelation) }
    def scope; end

    sig { returns(T::Array[::ActionMailbox::InboundEmail]) }
    def target; end

    sig { returns(T::Array[::ActionMailbox::InboundEmail]) }
    def to_ary; end

    Elem = type_member(fixed: ::ActionMailbox::InboundEmail)
  end

  class PrivateRelation < ::ActiveRecord::Relation
    include CommonRelationMethods
    include GeneratedRelationMethods

    sig { returns(T::Array[::ActionMailbox::InboundEmail]) }
    def to_ary; end

    Elem = type_member(fixed: ::ActionMailbox::InboundEmail)
  end

  class PrivateRelationWhereChain < PrivateRelation
    sig { params(args: T.untyped).returns(PrivateRelation) }
    def associated(*args); end

    sig { params(args: T.untyped).returns(PrivateRelation) }
    def missing(*args); end

    sig { params(opts: T.untyped, rest: T.untyped).returns(PrivateRelation) }
    def not(opts, *rest); end

    Elem = type_member(fixed: ::ActionMailbox::InboundEmail)
  end
end
