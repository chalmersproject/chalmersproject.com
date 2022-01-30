# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `jbuilder` gem.
# Please instead update this file by running `bin/tapioca gem jbuilder`.

class Jbuilder < ::ActiveSupport::ProxyObject
  def initialize(options = T.unsafe(nil)); end

  # Turns the current element into an array and iterates over the passed collection, adding each iteration as
  # an element of the resulting array.
  #
  # Example:
  #
  # json.array!(@people) do |person|
  # json.name person.name
  # json.age calculate_age(person.birthday)
  # end
  #
  # [ { "name": David", "age": 32 }, { "name": Jamie", "age": 31 } ]
  #
  # You can use the call syntax instead of an explicit extract! call:
  #
  # json.(@people) { |person| ... }
  #
  # It's generally only needed to use this method for top-level arrays. If you have named arrays, you can do:
  #
  # json.people(@people) do |person|
  # json.name person.name
  # json.age calculate_age(person.birthday)
  # end
  #
  # { "people": [ { "name": David", "age": 32 }, { "name": Jamie", "age": 31 } ] }
  #
  # If you omit the block then you can set the top level array directly:
  #
  # json.array! [1, 2, 3]
  #
  # [1,2,3]
  def array!(collection = T.unsafe(nil), *attributes, &block); end

  # Returns the attributes of the current builder.
  def attributes!; end

  def call(object, *attributes, &block); end

  # Turns the current element into an array and yields a builder to add a hash.
  #
  # Example:
  #
  # json.comments do
  # json.child! { json.content "hello" }
  # json.child! { json.content "world" }
  # end
  #
  # { "comments": [ { "content": "hello" }, { "content": "world" } ]}
  #
  # More commonly, you'd use the combined iterator, though:
  #
  # json.comments(@post.comments) do |comment|
  # json.content comment.formatted_content
  # end
  def child!; end

  # Deeply apply key format to nested hashes and arrays passed to
  # methods like set!, merge! or array!.
  #
  # Example:
  #
  # json.key_format! camelize: :lower
  # json.settings({some_value: "abc"})
  #
  # { "settings": { "some_value": "abc" }}
  #
  # json.key_format! camelize: :lower
  # json.deep_format_keys!
  # json.settings({some_value: "abc"})
  #
  # { "settings": { "someValue": "abc" }}
  def deep_format_keys!(value = T.unsafe(nil)); end

  # Extracts the mentioned attributes or hash elements from the passed object and turns them into attributes of the JSON.
  #
  # Example:
  #
  # @person = Struct.new(:name, :age).new('David', 32)
  #
  # or you can utilize a Hash
  #
  # @person = { name: 'David', age: 32 }
  #
  # json.extract! @person, :name, :age
  #
  # { "name": David", "age": 32 }, { "name": Jamie", "age": 31 }
  #
  # You can also use the call syntax instead of an explicit extract! call:
  #
  # json.(@person, :name, :age)
  def extract!(object, *attributes); end

  # If you want to skip adding nil values to your JSON hash. This is useful
  # for JSON clients that don't deal well with nil values, and would prefer
  # not to receive keys which have null values.
  #
  # Example:
  # json.ignore_nil! false
  # json.id User.new.id
  #
  # { "id": null }
  #
  # json.ignore_nil!
  # json.id User.new.id
  #
  # {}
  def ignore_nil!(value = T.unsafe(nil)); end

  # Specifies formatting to be applied to the key. Passing in a name of a function
  # will cause that function to be called on the key.  So :upcase will upper case
  # the key.  You can also pass in lambdas for more complex transformations.
  #
  # Example:
  #
  # json.key_format! :upcase
  # json.author do
  # json.name "David"
  # json.age 32
  # end
  #
  # { "AUTHOR": { "NAME": "David", "AGE": 32 } }
  #
  # You can pass parameters to the method using a hash pair.
  #
  # json.key_format! camelize: :lower
  # json.first_name "David"
  #
  # { "firstName": "David" }
  #
  # Lambdas can also be used.
  #
  # json.key_format! ->(key){ "_" + key }
  # json.first_name "David"
  #
  # { "_first_name": "David" }
  def key_format!(*args); end

  # Merges hash, array, or Jbuilder instance into current builder.
  def merge!(object); end

  def method_missing(*args, &block); end

  # Returns the nil JSON.
  def nil!; end

  # Returns the nil JSON.
  def null!; end

  def set!(key, value = T.unsafe(nil), *args, &block); end

  # Encodes the current builder as JSON.
  def target!; end

  private

  def _blank?(value = T.unsafe(nil)); end
  def _extract_hash_values(object, attributes); end
  def _extract_method_values(object, attributes); end
  def _format_keys(hash_or_array); end
  def _is_collection?(object); end
  def _key(key); end
  def _map_collection(collection); end
  def _merge_block(key); end
  def _merge_values(current_value, updates); end
  def _object_respond_to?(object, *methods); end
  def _scope; end
  def _set_value(key, value); end

  class << self
    # Same as instance method deep_format_keys! except sets the default.
    def deep_format_keys(value = T.unsafe(nil)); end

    # Yields a builder and automatically turns the result into a JSON string
    def encode(*args, &block); end

    # Same as instance method ignore_nil! except sets the default.
    def ignore_nil(value = T.unsafe(nil)); end

    # Same as the instance method key_format! except sets the default.
    def key_format(*args); end
  end
end

class Jbuilder::ArrayError < ::StandardError
  class << self
    def build(key); end
  end
end

Jbuilder::BLANK = T.let(T.unsafe(nil), Jbuilder::Blank)

class Jbuilder::Blank
  def ==(other); end
  def empty?; end
end

module Jbuilder::CollectionRenderable
  extend ::ActiveSupport::Concern

  mixes_in_class_methods ::Jbuilder::CollectionRenderable::ClassMethods

  private

  def build_rendered_collection(templates, _spacer); end
  def build_rendered_template(content, template, layout = T.unsafe(nil)); end
  def json; end
end

module Jbuilder::CollectionRenderable::ClassMethods
  def supported?; end
end

class Jbuilder::CollectionRenderable::ScopedIterator < ::SimpleDelegator
  include ::Enumerable
  include ::ActiveSupport::ToJsonWithActiveSupportEncoder

  def initialize(obj, scope); end

  # Rails 6.0 support:
  def each; end

  # Rails 6.1 support:
  def each_with_info; end
end

# Rails 6.0 support:
class Jbuilder::CollectionRenderer < ::ActionView::CollectionRenderer
  include ::Jbuilder::CollectionRenderable
  extend ::Jbuilder::CollectionRenderable::ClassMethods

  def initialize(lookup_context, options, &scope); end

  private

  def collection_with_template(view, template, layout, collection); end
end

class Jbuilder::KeyFormatter
  def initialize(*args); end

  def format(key); end

  private

  def initialize_copy(original); end
end

class Jbuilder::MergeError < ::StandardError
  class << self
    def build(current_value, updates); end
  end
end

Jbuilder::NON_ENUMERABLES = T.let(T.unsafe(nil), Set)

class Jbuilder::NullError < ::NoMethodError
  class << self
    def build(key); end
  end
end

class Jbuilder::Railtie < ::Rails::Railtie; end

class JbuilderHandler
  def default_format; end
  def default_format=(val); end

  class << self
    def call(template, source = T.unsafe(nil)); end
    def default_format; end
    def default_format=(val); end
  end
end

class JbuilderTemplate < ::Jbuilder
  def initialize(context, *args); end

  def array!(collection = T.unsafe(nil), *args); end

  # Caches the json constructed within the block passed. Has the same signature as the `cache` helper
  # method in `ActionView::Helpers::CacheHelper` and so can be used in the same way.
  #
  # Example:
  #
  # json.cache! ['v1', @person], expires_in: 10.minutes do
  # json.extract! @person, :name, :age
  # end
  def cache!(key = T.unsafe(nil), options = T.unsafe(nil)); end

  # Conditionally caches the json depending in the condition given as first parameter. Has the same
  # signature as the `cache` helper method in `ActionView::Helpers::CacheHelper` and so can be used in
  # the same way.
  #
  # Example:
  #
  # json.cache_if! !admin?, @person, expires_in: 10.minutes do
  # json.extract! @person, :name, :age
  # end
  def cache_if!(condition, *args, &block); end

  # Caches the json structure at the root using a string rather than the hash structure. This is considerably
  # faster, but the drawback is that it only works, as the name hints, at the root. So you cannot
  # use this approach to cache deeper inside the hierarchy, like in partials or such. Continue to use #cache! there.
  #
  # Example:
  #
  # json.cache_root! @person do
  # json.extract! @person, :name, :age
  # end
  #
  # # json.extra 'This will not work either, the root must be exclusive'
  def cache_root!(key = T.unsafe(nil), options = T.unsafe(nil)); end

  # Generates JSON using the template specified with the `:partial` option. For example, the code below will render
  # the file `views/comments/_comments.json.jbuilder`, and set a local variable comments with all this message's
  # comments, which can be used inside the partial.
  #
  # Example:
  #
  # json.partial! 'comments/comments', comments: @message.comments
  #
  # There are multiple ways to generate a collection of elements as JSON, as ilustrated below:
  #
  # Example:
  #
  # json.array! @posts, partial: 'posts/post', as: :post
  #
  # # or:
  # json.partial! 'posts/post', collection: @posts, as: :post
  #
  # # or:
  # json.partial! partial: 'posts/post', collection: @posts, as: :post
  #
  # # or:
  # json.comments @post.comments, partial: 'comments/comment', as: :comment
  #
  # Aside from that, the `:cached` options is available on Rails >= 6.0. This will cache the rendered results
  # effectively using the multi fetch feature.
  #
  # Example:
  #
  # json.array! @posts, partial: "posts/post", as: :post, cached: true
  #
  # json.comments @post.comments, partial: "comments/comment", as: :comment, cached: true
  def partial!(*args); end

  def set!(name, object = T.unsafe(nil), *args); end
  def target!; end

  private

  def _cache_fragment_for(key, options, &block); end
  def _cache_key(key, options); end
  def _fragment_name_with_digest(key, options); end
  def _is_active_model?(object); end
  def _partial_options?(options); end
  def _read_fragment_cache(key, options = T.unsafe(nil)); end
  def _render_active_model_partial(object); end
  def _render_explicit_partial(name_or_options, locals = T.unsafe(nil)); end
  def _render_partial(options); end
  def _render_partial_with_options(options); end
  def _set_inline_partial(name, object, options); end
  def _write_fragment_cache(key, options = T.unsafe(nil)); end

  class << self
    # Returns the value of attribute template_lookup_options.
    def template_lookup_options; end

    # Sets the attribute template_lookup_options
    def template_lookup_options=(_arg0); end
  end
end
