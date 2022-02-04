# rubocop:disable Layout/LineLength
# typed: true

# class ActiveSupport::StringInquirer
#   sig { returns(T::Boolean) }
#   def production?; end

#   sig { returns(T::Boolean) }
#   def development?; end

#   sig { returns(T::Boolean) }
#   def test?; end
# end

::RUBY19 = T.let(T.unsafe(nil), TrueClass)

module ActiveSupport
  extend ::ActiveSupport::LazyLoadHooks
  extend ::ActiveSupport::Autoload

  def parse_json_times; end
  def parse_json_times=(val); end
  def test_order; end
  def test_order=(val); end
  def test_parallelization_threshold; end
  def test_parallelization_threshold=(val); end

  class << self
    def cache_format_version; end
    def cache_format_version=(value); end
    def eager_load!; end
    def error_reporter; end
    def error_reporter=(_arg0); end
    def escape_html_entities_in_json(*_arg0, &_arg1); end
    def escape_html_entities_in_json=(arg); end

    # Returns the version of the currently loaded Active Support as a <tt>Gem::Version</tt>.
    def gem_version; end

    def json_encoder(*_arg0, &_arg1); end
    def json_encoder=(arg); end
    def parse_json_times; end
    def parse_json_times=(val); end
    def test_order; end
    def test_order=(val); end
    def test_parallelization_threshold; end
    def test_parallelization_threshold=(val); end
    def time_precision(*_arg0, &_arg1); end
    def time_precision=(arg); end
    def to_time_preserves_timezone; end
    def to_time_preserves_timezone=(value); end
    def use_standard_json_time_format(*_arg0, &_arg1); end
    def use_standard_json_time_format=(arg); end
    def utc_to_local_returns_utc_offset_times; end
    def utc_to_local_returns_utc_offset_times=(value); end

    # Returns the version of the currently loaded ActiveSupport as a <tt>Gem::Version</tt>
    def version; end
  end
end

# Actionable errors lets you define actions to resolve an error.
#
# To make an error actionable, include the <tt>ActiveSupport::ActionableError</tt>
# module and invoke the +action+ class macro to define the action. An action
# needs a name and a block to execute.
module ActiveSupport::ActionableError
  extend ::ActiveSupport::Concern
  include GeneratedInstanceMethods

  mixes_in_class_methods GeneratedClassMethods
  mixes_in_class_methods ::ActiveSupport::ActionableError::ClassMethods

  class << self
    def actions(error); end
    def dispatch(error, name); end
  end

  module GeneratedClassMethods
    def _actions; end
    def _actions=(value); end
    def _actions?; end
  end

  module GeneratedInstanceMethods
    def _actions; end
    def _actions=(value); end
    def _actions?; end
  end
end

module ActiveSupport::ActionableError::ClassMethods
  # Defines an action that can resolve the error.
  #
  # class PendingMigrationError < MigrationError
  # include ActiveSupport::ActionableError
  #
  # action "Run pending migrations" do
  # ActiveRecord::Tasks::DatabaseTasks.migrate
  # end
  # end
  def action(name, &block); end
end

class ActiveSupport::ActionableError::NonActionable < ::StandardError
end

# Wrapping an array in an +ArrayInquirer+ gives a friendlier way to check
# its string-like contents:
#
# variants = ActiveSupport::ArrayInquirer.new([:phone, :tablet])
#
# variants.phone?    # => true
# variants.tablet?   # => true
# variants.desktop?  # => false
class ActiveSupport::ArrayInquirer < ::Array
  # Passes each element of +candidates+ collection to ArrayInquirer collection.
  # The method returns true if any element from the ArrayInquirer collection
  # is equal to the stringified or symbolized form of any element in the +candidates+ collection.
  #
  # If +candidates+ collection is not given, method returns true.
  #
  # variants = ActiveSupport::ArrayInquirer.new([:phone, :tablet])
  #
  # variants.any?                      # => true
  # variants.any?(:phone, :tablet)     # => true
  # variants.any?('phone', 'desktop')  # => true
  # variants.any?(:desktop, :watch)    # => false
  def any?(*candidates); end

  private

  def method_missing(name, *args); end
  def respond_to_missing?(name, include_private = T.unsafe(nil)); end
end

# Autoload and eager load conveniences for your library.
#
# This module allows you to define autoloads based on
# Rails conventions (i.e. no need to define the path
# it is automatically guessed based on the filename)
# and also define a set of constants that needs to be
# eager loaded:
#
# module MyLib
# extend ActiveSupport::Autoload
#
# autoload :Model
#
# eager_autoload do
# autoload :Cache
# end
# end
#
# Then your library can be eager loaded by simply calling:
#
# MyLib.eager_load!
module ActiveSupport::Autoload
  def autoload(const_name, path = T.unsafe(nil)); end
  def autoload_at(path); end
  def autoload_under(path); end
  def autoloads; end
  def eager_autoload; end
  def eager_load!; end

  class << self
    def extended(base); end
  end
end

# Backtraces often include many lines that are not relevant for the context
# under review. This makes it hard to find the signal amongst the backtrace
# noise, and adds debugging time. With a BacktraceCleaner, filters and
# silencers are used to remove the noisy lines, so that only the most relevant
# lines remain.
#
# Filters are used to modify lines of data, while silencers are used to remove
# lines entirely. The typical filter use case is to remove lengthy path
# information from the start of each line, and view file paths relevant to the
# app directory instead of the file system root. The typical silencer use case
# is to exclude the output of a noisy library from the backtrace, so that you
# can focus on the rest.
#
# bc = ActiveSupport::BacktraceCleaner.new
# bc.add_filter   { |line| line.gsub(Rails.root.to_s, '') } # strip the Rails.root prefix
# bc.add_silencer { |line| /puma|rubygems/.match?(line) } # skip any lines from puma or rubygems
# bc.clean(exception.backtrace) # perform the cleanup
#
# To reconfigure an existing BacktraceCleaner (like the default one in Rails)
# and show as much data as possible, you can always call
# <tt>BacktraceCleaner#remove_silencers!</tt>, which will restore the
# backtrace to a pristine state. If you need to reconfigure an existing
# BacktraceCleaner so that it does not filter or modify the paths of any lines
# of the backtrace, you can call <tt>BacktraceCleaner#remove_filters!</tt>
# These two methods will give you a completely untouched backtrace.
#
# Inspired by the Quiet Backtrace gem by thoughtbot.
class ActiveSupport::BacktraceCleaner
  def initialize; end

  # Adds a filter from the block provided. Each line in the backtrace will be
  # mapped against this filter.
  #
  # # Will turn "/my/rails/root/app/models/person.rb" into "/app/models/person.rb"
  # backtrace_cleaner.add_filter { |line| line.gsub(Rails.root, '') }
  def add_filter(&block); end

  # Adds a silencer from the block provided. If the silencer returns +true+
  # for a given line, it will be excluded from the clean backtrace.
  #
  # # Will reject all lines that include the word "puma", like "/gems/puma/server.rb" or "/app/my_puma_server/rb"
  # backtrace_cleaner.add_silencer { |line| /puma/.match?(line) }
  def add_silencer(&block); end

  # Returns the backtrace after all filters and silencers have been run
  # against it. Filters run first, then silencers.
  def clean(backtrace, kind = T.unsafe(nil)); end

  # Returns the backtrace after all filters and silencers have been run
  # against it. Filters run first, then silencers.
  def filter(backtrace, kind = T.unsafe(nil)); end

  # Removes all filters, but leaves in the silencers. Useful if you suddenly
  # need to see entire filepaths in the backtrace that you had already
  # filtered out.
  def remove_filters!; end

  # Removes all silencers, but leaves in the filters. Useful if your
  # context of debugging suddenly expands as you suspect a bug in one of
  # the libraries you use.
  def remove_silencers!; end

  private

  def add_gem_filter; end
  def add_gem_silencer; end
  def add_stdlib_silencer; end
  def filter_backtrace(backtrace); end
  def noise(backtrace); end
  def silence(backtrace); end
end

ActiveSupport::BacktraceCleaner::FORMATTED_GEMS_PATTERN =
  T.let(T.unsafe(nil), Regexp)

module ActiveSupport::Benchmarkable
  # Allows you to measure the execution time of a block in a template and
  # records the result to the log. Wrap this block around expensive operations
  # or possible bottlenecks to get a time reading for the operation. For
  # example, let's say you thought your file processing method was taking too
  # long; you could wrap it in a benchmark block.
  #
  # <% benchmark 'Process data files' do %>
  # <%= expensive_files_operation %>
  # <% end %>
  #
  # That would add something like "Process data files (345.2ms)" to the log,
  # which you can then use to compare timings when optimizing your code.
  #
  # You may give an optional logger level (<tt>:debug</tt>, <tt>:info</tt>,
  # <tt>:warn</tt>, <tt>:error</tt>) as the <tt>:level</tt> option. The
  # default logger level value is <tt>:info</tt>.
  #
  # <% benchmark 'Low-level files', level: :debug do %>
  # <%= lowlevel_files_operation %>
  # <% end %>
  #
  # Finally, you can pass true as the third argument to silence all log
  # activity (other than the timing information) from inside the block. This
  # is great for boiling down a noisy block to just a single statement that
  # produces one log line:
  #
  # <% benchmark 'Process data files', level: :info, silence: true do %>
  # <%= expensive_and_chatty_files_operation %>
  # <% end %>
  def benchmark(message = T.unsafe(nil), options = T.unsafe(nil), &block); end
end

module ActiveSupport::BigDecimalWithDefaultFormat
  def to_s(format = T.unsafe(nil)); end
end

# See ActiveSupport::Cache::Store for documentation.
module ActiveSupport::Cache
  class << self
    # Expands out the +key+ argument into a key that can be used for the
    # cache store. Optionally accepts a namespace, and all keys will be
    # scoped within that namespace.
    #
    # If the +key+ argument provided is an array, or responds to +to_a+, then
    # each of elements in the array will be turned into parameters/keys and
    # concatenated into a single key. For example:
    #
    # ActiveSupport::Cache.expand_cache_key([:foo, :bar])               # => "foo/bar"
    # ActiveSupport::Cache.expand_cache_key([:foo, :bar], "namespace")  # => "namespace/foo/bar"
    #
    # The +key+ argument can also respond to +cache_key+ or +to_param+.
    def expand_cache_key(key, namespace = T.unsafe(nil)); end

    # Returns the value of attribute format_version.
    def format_version; end

    # Sets the attribute format_version
    def format_version=(_arg0); end

    # Creates a new Store object according to the given options.
    #
    # If no arguments are passed to this method, then a new
    # ActiveSupport::Cache::MemoryStore object will be returned.
    #
    # If you pass a Symbol as the first argument, then a corresponding cache
    # store class under the ActiveSupport::Cache namespace will be created.
    # For example:
    #
    # ActiveSupport::Cache.lookup_store(:memory_store)
    # # => returns a new ActiveSupport::Cache::MemoryStore object
    #
    # ActiveSupport::Cache.lookup_store(:mem_cache_store)
    # # => returns a new ActiveSupport::Cache::MemCacheStore object
    #
    # Any additional arguments will be passed to the corresponding cache store
    # class's constructor:
    #
    # ActiveSupport::Cache.lookup_store(:file_store, '/tmp/cache')
    # # => same as: ActiveSupport::Cache::FileStore.new('/tmp/cache')
    #
    # If the first argument is not a Symbol, then it will simply be returned:
    #
    # ActiveSupport::Cache.lookup_store(MyOwnCacheStore.new)
    # # => returns MyOwnCacheStore.new
    def lookup_store(store = T.unsafe(nil), *parameters); end

    private

    def retrieve_cache_key(key); end

    # Obtains the specified cache store class, given the name of the +store+.
    # Raises an error when the store class cannot be found.
    def retrieve_store_class(store); end
  end
end

module ActiveSupport::Cache::Coders
  class << self
    def [](version); end
  end
end

module ActiveSupport::Cache::Coders::Loader
  extend ::ActiveSupport::Cache::Coders::Loader

  def load(payload); end
end

# The one set by Marshal.
ActiveSupport::Cache::Coders::MARK_61 = T.let(T.unsafe(nil), String)

ActiveSupport::Cache::Coders::MARK_70_COMPRESSED = T.let(T.unsafe(nil), String)
ActiveSupport::Cache::Coders::MARK_70_UNCOMPRESSED =
  T.let(T.unsafe(nil), String)

module ActiveSupport::Cache::Coders::Rails61Coder
  include ::ActiveSupport::Cache::Coders::Loader
  extend ::ActiveSupport::Cache::Coders::Loader
  extend ::ActiveSupport::Cache::Coders::Rails61Coder

  def dump(entry); end
  def dump_compressed(entry, threshold); end
end

module ActiveSupport::Cache::Coders::Rails70Coder
  include ::ActiveSupport::Cache::Coders::Loader
  extend ::ActiveSupport::Cache::Coders::Loader
  extend ::ActiveSupport::Cache::Coders::Rails70Coder

  def dump(entry); end
  def dump_compressed(entry, threshold); end
end

ActiveSupport::Cache::DEFAULT_COMPRESS_LIMIT = T.let(T.unsafe(nil), Integer)

# This class is used to represent cache entries. Cache entries have a value, an optional
# expiration time, and an optional version. The expiration time is used to support the :race_condition_ttl option
# on the cache. The version is used to support the :version option on the cache for rejecting
# mismatches.
#
# Since cache entries in most instances will be serialized, the internals of this class are highly optimized
# using short instance variable names that are lazily defined.
class ActiveSupport::Cache::Entry
  # Creates a new cache entry for the specified value. Options supported are
  # +:compressed+, +:version+, +:expires_at+ and +:expires_in+.
  def initialize(
    value,
    compressed: T.unsafe(nil),
    version: T.unsafe(nil),
    expires_in: T.unsafe(nil),
    expires_at: T.unsafe(nil),
    **_arg5
  ); end

  # Returns the size of the cached value. This could be less than
  # <tt>value.bytesize</tt> if the data is compressed.
  def bytesize; end

  def compressed(compress_threshold); end
  def compressed?; end

  # Duplicates the value in a class. This is used by cache implementations that don't natively
  # serialize entries to protect against accidental cache modifications.
  def dup_value!; end

  # Checks if the entry is expired. The +expires_in+ parameter can override
  # the value set when the entry was created.
  def expired?; end

  def expires_at; end
  def expires_at=(value); end
  def local?; end
  def mismatched?(version); end
  def pack; end
  def value; end

  # Returns the value of attribute version.
  def version; end

  private

  def uncompress(value); end

  class << self
    def unpack(members); end
  end
end

# A cache store implementation which stores everything on the filesystem.
#
# FileStore implements the Strategy::LocalCache strategy which implements
# an in-memory cache inside of a block.
class ActiveSupport::Cache::FileStore < ::ActiveSupport::Cache::Store
  def initialize(cache_path, **options); end

  # Returns the value of attribute cache_path.
  def cache_path; end

  # Preemptively iterates through all stored keys and removes the ones which have expired.
  def cleanup(options = T.unsafe(nil)); end

  # Deletes all items from the cache. In this case it deletes all the entries in the specified
  # file store directory except for .keep or .gitkeep. Be careful which directory is specified in your
  # config file when using +FileStore+ because everything in that directory will be deleted.
  def clear(options = T.unsafe(nil)); end

  # Decrements an already existing integer value that is stored in the cache.
  # If the key is not found nothing is done.
  def decrement(name, amount = T.unsafe(nil), options = T.unsafe(nil)); end

  def delete_matched(matcher, options = T.unsafe(nil)); end

  # Increments an already existing integer value that is stored in the cache.
  # If the key is not found nothing is done.
  def increment(name, amount = T.unsafe(nil), options = T.unsafe(nil)); end

  private

  # Delete empty directories in the cache.
  def delete_empty_directories(dir); end

  def delete_entry(key, **options); end

  # Make sure a file path's directories exist.
  def ensure_cache_path(path); end

  # Translate a file path into a key.
  def file_path_key(path); end

  # Lock a file for a block so only one process can modify it at a time.
  def lock_file(file_name, &block); end

  # Modifies the amount of an already existing integer value that is stored in the cache.
  # If the key is not found nothing is done.
  def modify_value(name, amount, options); end

  # Translate a key into a file path.
  def normalize_key(key, options); end

  def read_entry(key, **options); end
  def read_serialized_entry(key, **_arg1); end
  def search_dir(dir, &callback); end
  def write_entry(key, entry, **options); end
  def write_serialized_entry(key, payload, **options); end

  class << self
    # Advertise cache versioning support.
    def supports_cache_versioning?; end
  end
end

ActiveSupport::Cache::FileStore::DIR_FORMATTER = T.let(T.unsafe(nil), String)

# max filename size on file system is 255, minus room for timestamp, pid, and random characters appended by Tempfile (used by atomic write)
ActiveSupport::Cache::FileStore::FILENAME_MAX_SIZE =
  T.let(T.unsafe(nil), Integer)

# max is 1024, plus some room
ActiveSupport::Cache::FileStore::FILEPATH_MAX_SIZE =
  T.let(T.unsafe(nil), Integer)

ActiveSupport::Cache::FileStore::GITKEEP_FILES = T.let(T.unsafe(nil), Array)

# A cache store implementation which stores everything into memory in the
# same process. If you're running multiple Ruby on Rails server processes
# (which is the case if you're using Phusion Passenger or puma clustered mode),
# then this means that Rails server process instances won't be able
# to share cache data with each other and this may not be the most
# appropriate cache in that scenario.
#
# This cache has a bounded size specified by the :size options to the
# initializer (default is 32Mb). When the cache exceeds the allotted size,
# a cleanup will occur which tries to prune the cache down to three quarters
# of the maximum size by removing the least recently used entries.
#
# Unlike other Cache store implementations, MemoryStore does not compress
# values by default. MemoryStore does not benefit from compression as much
# as other Store implementations, as it does not send data over a network.
# However, when compression is enabled, it still pays the full cost of
# compression in terms of cpu use.
#
# MemoryStore is thread-safe.
class ActiveSupport::Cache::MemoryStore < ::ActiveSupport::Cache::Store
  def initialize(options = T.unsafe(nil)); end

  # Preemptively iterates through all stored keys and removes the ones which have expired.
  def cleanup(options = T.unsafe(nil)); end

  # Delete all data stored in a given cache store.
  def clear(options = T.unsafe(nil)); end

  # Decrement an integer value in the cache.
  def decrement(name, amount = T.unsafe(nil), options = T.unsafe(nil)); end

  # Deletes cache entries if the cache key matches a given pattern.
  def delete_matched(matcher, options = T.unsafe(nil)); end

  # Increment an integer value in the cache.
  def increment(name, amount = T.unsafe(nil), options = T.unsafe(nil)); end

  def inspect; end

  # To ensure entries fit within the specified memory prune the cache by removing the least
  # recently accessed entries.
  def prune(target_size, max_time = T.unsafe(nil)); end

  # Returns true if the cache is currently being pruned.
  def pruning?; end

  # Synchronize calls to the cache. This should be called wherever the underlying cache implementation
  # is not thread safe.
  def synchronize(&block); end

  private

  def cached_size(key, payload); end
  def default_coder; end
  def delete_entry(key, **options); end
  def modify_value(name, amount, options); end
  def read_entry(key, **options); end
  def write_entry(key, entry, **options); end

  class << self
    # Advertise cache versioning support.
    def supports_cache_versioning?; end
  end
end

module ActiveSupport::Cache::MemoryStore::DupCoder
  extend ::ActiveSupport::Cache::MemoryStore::DupCoder

  def dump(entry); end
  def dump_compressed(entry, threshold); end
  def load(entry); end
end

ActiveSupport::Cache::MemoryStore::PER_ENTRY_OVERHEAD =
  T.let(T.unsafe(nil), Integer)

module ActiveSupport::Cache::NullCoder
  extend ::ActiveSupport::Cache::NullCoder

  def dump(entry); end
  def dump_compressed(entry, threshold); end
  def load(payload); end
end

# A cache store implementation which doesn't actually store anything. Useful in
# development and test environments where you don't want caching turned on but
# need to go through the caching interface.
#
# This cache does implement the local cache strategy, so values will actually
# be cached inside blocks that utilize this strategy. See
# ActiveSupport::Cache::Strategy::LocalCache for more details.
class ActiveSupport::Cache::NullStore < ::ActiveSupport::Cache::Store
  include ::ActiveSupport::Cache::Strategy::LocalCache

  private

  def read_entry(key, **s); end
  def write_entry(key, entry, **_arg2); end

  class << self
    # Advertise cache versioning support.
    def supports_cache_versioning?; end
  end
end

# Mapping of canonical option names to aliases that a store will recognize.
ActiveSupport::Cache::OPTION_ALIASES = T.let(T.unsafe(nil), Hash)

# An abstract cache store class. There are multiple cache store
# implementations, each having its own additional features. See the classes
# under the ActiveSupport::Cache module, e.g.
# ActiveSupport::Cache::MemCacheStore. MemCacheStore is currently the most
# popular cache store for large production websites.
#
# Some implementations may not support all methods beyond the basic cache
# methods of +fetch+, +write+, +read+, +exist?+, and +delete+.
#
# ActiveSupport::Cache::Store can store any serializable Ruby object.
#
# cache = ActiveSupport::Cache::MemoryStore.new
#
# cache.read('city')   # => nil
# cache.write('city', "Duckburgh")
# cache.read('city')   # => "Duckburgh"
#
# Keys are always translated into Strings and are case sensitive. When an
# object is specified as a key and has a +cache_key+ method defined, this
# method will be called to define the key.  Otherwise, the +to_param+
# method will be called. Hashes and Arrays can also be used as keys. The
# elements will be delimited by slashes, and the elements within a Hash
# will be sorted by key so they are consistent.
#
# cache.read('city') == cache.read(:city)   # => true
#
# Nil values can be cached.
#
# If your cache is on a shared infrastructure, you can define a namespace
# for your cache entries. If a namespace is defined, it will be prefixed on
# to every key. The namespace can be either a static value or a Proc. If it
# is a Proc, it will be invoked when each key is evaluated so that you can
# use application logic to invalidate keys.
#
# cache.namespace = -> { @last_mod_time }  # Set the namespace to a variable
# @last_mod_time = Time.now  # Invalidate the entire cache by changing namespace
#
# Cached data larger than 1kB are compressed by default. To turn off
# compression, pass <tt>compress: false</tt> to the initializer or to
# individual +fetch+ or +write+ method calls. The 1kB compression
# threshold is configurable with the <tt>:compress_threshold</tt> option,
# specified in bytes.
class ActiveSupport::Cache::Store
  # Creates a new cache. The options will be passed to any write method calls
  # except for <tt>:namespace</tt> which can be used to set the global
  # namespace for the cache.
  def initialize(options = T.unsafe(nil)); end

  # Cleanups the cache by removing expired entries.
  #
  # Options are passed to the underlying cache implementation.
  #
  # Some implementations may not support this method.
  def cleanup(options = T.unsafe(nil)); end

  # Clears the entire cache. Be careful with this method since it could
  # affect other processes if shared cache is being used.
  #
  # The options hash is passed to the underlying cache implementation.
  #
  # Some implementations may not support this method.
  def clear(options = T.unsafe(nil)); end

  # Decrements an integer value in the cache.
  #
  # Options are passed to the underlying cache implementation.
  #
  # Some implementations may not support this method.
  def decrement(name, amount = T.unsafe(nil), options = T.unsafe(nil)); end

  # Deletes an entry in the cache. Returns +true+ if an entry is deleted.
  #
  # Options are passed to the underlying cache implementation.
  def delete(name, options = T.unsafe(nil)); end

  # Deletes all entries with keys matching the pattern.
  #
  # Options are passed to the underlying cache implementation.
  #
  # Some implementations may not support this method.
  def delete_matched(matcher, options = T.unsafe(nil)); end

  # Deletes multiple entries in the cache.
  #
  # Options are passed to the underlying cache implementation.
  def delete_multi(names, options = T.unsafe(nil)); end

  # Returns +true+ if the cache contains an entry for the given key.
  #
  # Options are passed to the underlying cache implementation.
  def exist?(name, options = T.unsafe(nil)); end

  # Fetches data from the cache, using the given key. If there is data in
  # the cache with the given key, then that data is returned.
  #
  # If there is no such data in the cache (a cache miss), then +nil+ will be
  # returned. However, if a block has been passed, that block will be passed
  # the key and executed in the event of a cache miss. The return value of the
  # block will be written to the cache under the given cache key, and that
  # return value will be returned.
  #
  # cache.write('today', 'Monday')
  # cache.fetch('today')  # => "Monday"
  #
  # cache.fetch('city')   # => nil
  # cache.fetch('city') do
  # 'Duckburgh'
  # end
  # cache.fetch('city')   # => "Duckburgh"
  #
  # You may also specify additional options via the +options+ argument.
  # Setting <tt>force: true</tt> forces a cache "miss," meaning we treat
  # the cache value as missing even if it's present. Passing a block is
  # required when +force+ is true so this always results in a cache write.
  #
  # cache.write('today', 'Monday')
  # cache.fetch('today', force: true) { 'Tuesday' } # => 'Tuesday'
  # cache.fetch('today', force: true) # => ArgumentError
  #
  # The +:force+ option is useful when you're calling some other method to
  # ask whether you should force a cache write. Otherwise, it's clearer to
  # just call <tt>Cache#write</tt>.
  #
  # Setting <tt>skip_nil: true</tt> will not cache nil result:
  #
  # cache.fetch('foo') { nil }
  # cache.fetch('bar', skip_nil: true) { nil }
  # cache.exist?('foo') # => true
  # cache.exist?('bar') # => false
  #
  #
  # Setting <tt>compress: false</tt> disables compression of the cache entry.
  #
  # Setting <tt>:expires_in</tt> will set an expiration time on the cache.
  # All caches support auto-expiring content after a specified number of
  # seconds. This value can be specified as an option to the constructor
  # (in which case all entries will be affected), or it can be supplied to
  # the +fetch+ or +write+ method to affect just one entry.
  # <tt>:expire_in</tt> and <tt>:expired_in</tt> are aliases for
  # <tt>:expires_in</tt>.
  #
  # cache = ActiveSupport::Cache::MemoryStore.new(expires_in: 5.minutes)
  # cache.write(key, value, expires_in: 1.minute) # Set a lower value for one entry
  #
  # Setting <tt>:expires_at</tt> will set an absolute expiration time on the cache.
  # All caches support auto-expiring content after a specified number of
  # seconds. This value can only be supplied to the +fetch+ or +write+ method to
  # affect just one entry.
  #
  # cache = ActiveSupport::Cache::MemoryStore.new
  # cache.write(key, value, expires_at: Time.now.at_end_of_hour)
  #
  # Setting <tt>:version</tt> verifies the cache stored under <tt>name</tt>
  # is of the same version. nil is returned on mismatches despite contents.
  # This feature is used to support recyclable cache keys.
  #
  # Setting <tt>:race_condition_ttl</tt> is very useful in situations where
  # a cache entry is used very frequently and is under heavy load. If a
  # cache expires and due to heavy load several different processes will try
  # to read data natively and then they all will try to write to cache. To
  # avoid that case the first process to find an expired cache entry will
  # bump the cache expiration time by the value set in <tt>:race_condition_ttl</tt>.
  # Yes, this process is extending the time for a stale value by another few
  # seconds. Because of extended life of the previous cache, other processes
  # will continue to use slightly stale data for a just a bit longer. In the
  # meantime that first process will go ahead and will write into cache the
  # new value. After that all the processes will start getting the new value.
  # The key is to keep <tt>:race_condition_ttl</tt> small.
  #
  # If the process regenerating the entry errors out, the entry will be
  # regenerated after the specified number of seconds. Also note that the
  # life of stale cache is extended only if it expired recently. Otherwise
  # a new value is generated and <tt>:race_condition_ttl</tt> does not play
  # any role.
  #
  # # Set all values to expire after one minute.
  # cache = ActiveSupport::Cache::MemoryStore.new(expires_in: 1.minute)
  #
  # cache.write('foo', 'original value')
  # val_1 = nil
  # val_2 = nil
  # sleep 60
  #
  # Thread.new do
  # val_1 = cache.fetch('foo', race_condition_ttl: 10.seconds) do
  # sleep 1
  # 'new value 1'
  # end
  # end
  #
  # Thread.new do
  # val_2 = cache.fetch('foo', race_condition_ttl: 10.seconds) do
  # 'new value 2'
  # end
  # end
  #
  # cache.fetch('foo') # => "original value"
  # sleep 10 # First thread extended the life of cache by another 10 seconds
  # cache.fetch('foo') # => "new value 1"
  # val_1 # => "new value 1"
  # val_2 # => "original value"
  #
  # Other options will be handled by the specific cache store implementation.
  # Internally, #fetch calls #read_entry, and calls #write_entry on a cache
  # miss. +options+ will be passed to the #read and #write calls.
  #
  # For example, MemCacheStore's #write method supports the +:raw+
  # option, which tells the memcached server to store all values as strings.
  # We can use this option with #fetch too:
  #
  # cache = ActiveSupport::Cache::MemCacheStore.new
  # cache.fetch("foo", force: true, raw: true) do
  # :bar
  # end
  # cache.fetch('foo') # => "bar"
  def fetch(name, options = T.unsafe(nil), &block); end

  # Fetches data from the cache, using the given keys. If there is data in
  # the cache with the given keys, then that data is returned. Otherwise,
  # the supplied block is called for each key for which there was no data,
  # and the result will be written to the cache and returned.
  # Therefore, you need to pass a block that returns the data to be written
  # to the cache. If you do not want to write the cache when the cache is
  # not found, use #read_multi.
  #
  # Returns a hash with the data for each of the names. For example:
  #
  # cache.write("bim", "bam")
  # cache.fetch_multi("bim", "unknown_key") do |key|
  # "Fallback value for key: #{key}"
  # end
  # # => { "bim" => "bam",
  # #      "unknown_key" => "Fallback value for key: unknown_key" }
  #
  # Options are passed to the underlying cache implementation. For example:
  #
  # cache.fetch_multi("fizz", expires_in: 5.seconds) do |key|
  # "buzz"
  # end
  # # => {"fizz"=>"buzz"}
  # cache.read("fizz")
  # # => "buzz"
  # sleep(6)
  # cache.read("fizz")
  # # => nil
  def fetch_multi(*names); end

  # Increments an integer value in the cache.
  #
  # Options are passed to the underlying cache implementation.
  #
  # Some implementations may not support this method.
  def increment(name, amount = T.unsafe(nil), options = T.unsafe(nil)); end

  def logger; end
  def logger=(val); end

  # Silences the logger within a block.
  def mute; end

  def new_entry(value, options = T.unsafe(nil)); end

  # Returns the value of attribute options.
  def options; end

  # Reads data from the cache, using the given key. If there is data in
  # the cache with the given key, then that data is returned. Otherwise,
  # +nil+ is returned.
  #
  # Note, if data was written with the <tt>:expires_in</tt> or
  # <tt>:version</tt> options, both of these conditions are applied before
  # the data is returned.
  #
  # Options are passed to the underlying cache implementation.
  def read(name, options = T.unsafe(nil)); end

  # Reads multiple values at once from the cache. Options can be passed
  # in the last argument.
  #
  # Some cache implementation may optimize this method.
  #
  # Returns a hash mapping the names provided to the values found.
  def read_multi(*names); end

  # Returns the value of attribute silence.
  def silence; end

  # Silences the logger.
  def silence!; end

  # Returns the value of attribute silence.
  def silence?; end

  # Writes the value to the cache, with the key.
  #
  # Options are passed to the underlying cache implementation.
  def write(name, value, options = T.unsafe(nil)); end

  # Cache Storage API to write multiple values at once.
  def write_multi(hash, options = T.unsafe(nil)); end

  private

  def default_coder; end

  # Deletes an entry from the cache implementation. Subclasses must
  # implement this method.
  def delete_entry(key, **options); end

  # Deletes multiples entries in the cache implementation. Subclasses MAY
  # implement this method.
  def delete_multi_entries(entries, **options); end

  def deserialize_entry(payload); end

  # Expands key to be a consistent string value. Invokes +cache_key+ if
  # object responds to +cache_key+. Otherwise, +to_param+ method will be
  # called. If the key is a Hash, then keys will be sorted alphabetically.
  def expanded_key(key); end

  def expanded_version(key); end
  def get_entry_value(entry, name, options); end
  def handle_expired_entry(entry, key, options); end
  def instrument(operation, key, options = T.unsafe(nil)); end

  # Adds the namespace defined in the options to a pattern designed to
  # match keys. Implementations that support delete_matched should call
  # this method to translate a pattern that matches names into one that
  # matches namespaced keys.
  def key_matcher(pattern, options); end

  # Merges the default options with ones specific to a method call.
  def merged_options(call_options); end

  # Prefix the key with a namespace string:
  #
  # namespace_key 'foo', namespace: 'cache'
  # # => 'cache:foo'
  #
  # With a namespace block:
  #
  # namespace_key 'foo', namespace: -> { 'cache' }
  # # => 'cache:foo'
  def namespace_key(key, options = T.unsafe(nil)); end

  # Expands and namespaces the cache key. May be overridden by
  # cache stores to do additional normalization.
  def normalize_key(key, options = T.unsafe(nil)); end

  # Normalize aliased options to their canonical form
  def normalize_options(options); end

  def normalize_version(key, options = T.unsafe(nil)); end

  # Reads an entry from the cache implementation. Subclasses must implement
  # this method.
  def read_entry(key, **options); end

  # Reads multiple entries from the cache implementation. Subclasses MAY
  # implement this method.
  def read_multi_entries(names, **options); end

  def save_block_result_to_cache(name, options); end
  def serialize_entry(entry, **options); end

  # Writes an entry to the cache implementation. Subclasses must implement
  # this method.
  def write_entry(key, entry, **options); end

  # Writes multiple entries to the cache implementation. Subclasses MAY
  # implement this method.
  def write_multi_entries(hash, **options); end

  class << self
    def logger; end
    def logger=(val); end

    private

    def ensure_connection_pool_added!; end
    def retrieve_pool_options(options); end
  end
end

module ActiveSupport::Cache::Strategy
end

# Caches that implement LocalCache will be backed by an in-memory cache for the
# duration of a block. Repeated calls to the cache for the same key will hit the
# in-memory cache for faster access.
module ActiveSupport::Cache::Strategy::LocalCache
  def cleanup(**options); end
  def clear(**options); end
  def decrement(name, amount = T.unsafe(nil), **options); end
  def delete_matched(matcher, options = T.unsafe(nil)); end
  def increment(name, amount = T.unsafe(nil), **options); end

  # Middleware class can be inserted as a Rack handler to be local cache for the
  # duration of request.
  def middleware; end

  # Use a local cache for the duration of block.
  def with_local_cache(&block); end

  private

  def bypass_local_cache(&block); end
  def delete_entry(key, **_arg1); end
  def local_cache; end
  def local_cache_key; end
  def read_multi_entries(keys, **options); end
  def read_serialized_entry(key, raw: T.unsafe(nil), **options); end
  def use_temporary_local_cache(temporary_cache); end
  def write_cache_value(name, value, **options); end
  def write_serialized_entry(key, payload, **_arg2); end
end

# Class for storing and registering the local caches.
module ActiveSupport::Cache::Strategy::LocalCache::LocalCacheRegistry
  extend ::ActiveSupport::Cache::Strategy::LocalCache::LocalCacheRegistry

  def cache_for(local_cache_key); end
  def set_cache_for(local_cache_key, value); end
end

# Simple memory backed cache. This cache is not thread safe and is intended only
# for serving as a temporary memory cache for a single thread.
class ActiveSupport::Cache::Strategy::LocalCache::LocalStore
  def initialize; end

  def clear(options = T.unsafe(nil)); end
  def delete_entry(key); end
  def fetch_entry(key); end
  def read_entry(key); end
  def read_multi_entries(keys); end
  def write_entry(key, entry); end
end

# --
# This class wraps up local storage for middlewares. Only the middleware method should
# construct them.
class ActiveSupport::Cache::Strategy::LocalCache::Middleware
  def initialize(name, local_cache_key); end

  def call(env); end
  def local_cache_key; end
  def name; end
  def new(app); end
end

# These options mean something to all cache implementations. Individual cache
# implementations may support additional options.
ActiveSupport::Cache::UNIVERSAL_OPTIONS = T.let(T.unsafe(nil), Array)

# CachingKeyGenerator is a wrapper around KeyGenerator which allows users to avoid
# re-executing the key generation process when it's called using the same salt and
# key_size.
class ActiveSupport::CachingKeyGenerator
  def initialize(key_generator); end

  # Returns a derived key suitable for use.
  def generate_key(*args); end
end

# Callbacks are code hooks that are run at key points in an object's life cycle.
# The typical use case is to have a base class define a set of callbacks
# relevant to the other functionality it supplies, so that subclasses can
# install callbacks that enhance or modify the base functionality without
# needing to override or redefine methods of the base class.
#
# Mixing in this module allows you to define the events in the object's
# life cycle that will support callbacks (via +ClassMethods.define_callbacks+),
# set the instance methods, procs, or callback objects to be called (via
# +ClassMethods.set_callback+), and run the installed callbacks at the
# appropriate times (via +run_callbacks+).
#
# By default callbacks are halted by throwing +:abort+.
# See +ClassMethods.define_callbacks+ for details.
#
# Three kinds of callbacks are supported: before callbacks, run before a
# certain event; after callbacks, run after the event; and around callbacks,
# blocks that surround the event, triggering it when they yield. Callback code
# can be contained in instance methods, procs or lambdas, or callback objects
# that respond to certain predetermined methods. See +ClassMethods.set_callback+
# for details.
#
# class Record
# include ActiveSupport::Callbacks
# define_callbacks :save
#
# def save
# run_callbacks :save do
# puts "- save"
# end
# end
# end
#
# class PersonRecord < Record
# set_callback :save, :before, :saving_message
# def saving_message
# puts "saving..."
# end
#
# set_callback :save, :after do |object|
# puts "saved"
# end
# end
#
# person = PersonRecord.new
# person.save
#
# Output:
# saving...
# - save
# saved
module ActiveSupport::Callbacks
  extend ::ActiveSupport::Concern
  include GeneratedInstanceMethods

  mixes_in_class_methods GeneratedClassMethods
  mixes_in_class_methods ::ActiveSupport::Callbacks::ClassMethods
  mixes_in_class_methods ::ActiveSupport::DescendantsTracker

  # Runs the callbacks for the given event.
  #
  # Calls the before and around callbacks in the order they were set, yields
  # the block (if given one), and then runs the after callbacks in reverse
  # order.
  #
  # If the callback chain was halted, returns +false+. Otherwise returns the
  # result of the block, +nil+ if no callbacks have been set, or +true+
  # if callbacks have been set but no block is given.
  #
  # run_callbacks :save do
  # save
  # end
  #
  # --
  #
  # As this method is used in many places, and often wraps large portions of
  # user code, it has an additional design goal of minimizing its impact on
  # the visible call stack. An exception from inside a :before or :after
  # callback can be as noisy as it likes -- but when control has passed
  # smoothly through and into the supplied block, we want as little evidence
  # as possible that we were here.
  def run_callbacks(kind); end

  private

  # A hook invoked every time a before callback is halted.
  # This can be overridden in ActiveSupport::Callbacks implementors in order
  # to provide better debugging/logging.
  def halted_callback_hook(filter, name); end

  module GeneratedClassMethods
    def __callbacks; end
    def __callbacks=(value); end
    def __callbacks?; end
  end

  module GeneratedInstanceMethods
    def __callbacks; end
    def __callbacks?; end
  end
end

ActiveSupport::Callbacks::CALLBACK_FILTER_TYPES = T.let(T.unsafe(nil), Array)

# A future invocation of user-supplied code (either as a callback,
# or a condition filter).
module ActiveSupport::Callbacks::CallTemplate
  class << self
    # Filters support:
    #
    # Symbols:: A method to call.
    # Procs::   A proc to call with the object.
    # Objects:: An object with a <tt>before_foo</tt> method on it to call.
    #
    # All of these objects are converted into a CallTemplate and handled
    # the same after this point.
    def build(filter, callback); end
  end
end

class ActiveSupport::Callbacks::CallTemplate::InstanceExec0
  def initialize(block); end

  def expand(target, value, block); end
  def inverted_lambda; end
  def make_lambda; end
end

class ActiveSupport::Callbacks::CallTemplate::InstanceExec1
  def initialize(block); end

  def expand(target, value, block); end
  def inverted_lambda; end
  def make_lambda; end
end

class ActiveSupport::Callbacks::CallTemplate::InstanceExec2
  def initialize(block); end

  def expand(target, value, block); end
  def inverted_lambda; end
  def make_lambda; end
end

class ActiveSupport::Callbacks::CallTemplate::MethodCall
  def initialize(method); end

  # Return the parts needed to make this call, with the given
  # input values.
  #
  # Returns an array of the form:
  #
  # [target, block, method, *arguments]
  #
  # This array can be used as such:
  #
  # target.send(method, *arguments, &block)
  #
  # The actual invocation is left up to the caller to minimize
  # call stack pollution.
  def expand(target, value, block); end

  def inverted_lambda; end
  def make_lambda; end
end

class ActiveSupport::Callbacks::CallTemplate::ObjectCall
  def initialize(target, method); end

  def expand(target, value, block); end
  def inverted_lambda; end
  def make_lambda; end
end

class ActiveSupport::Callbacks::CallTemplate::ProcCall
  def initialize(target); end

  def expand(target, value, block); end
  def inverted_lambda; end
  def make_lambda; end
end

class ActiveSupport::Callbacks::Callback
  def initialize(name, filter, kind, options, chain_config); end

  # Wraps code with filter
  def apply(callback_sequence); end

  # Returns the value of attribute chain_config.
  def chain_config; end

  def current_scopes; end
  def duplicates?(other); end

  # Returns the value of attribute filter.
  def filter; end

  # Returns the value of attribute kind.
  def kind; end

  # Sets the attribute kind
  def kind=(_arg0); end

  def matches?(_kind, _filter); end
  def merge_conditional_options(chain, if_option:, unless_option:); end

  # Returns the value of attribute name.
  def name; end

  # Sets the attribute name
  def name=(_arg0); end

  private

  def check_conditionals(conditionals); end
  def conditions_lambdas; end

  class << self
    def build(chain, filter, kind, options); end
  end
end

ActiveSupport::Callbacks::Callback::EMPTY_ARRAY = T.let(T.unsafe(nil), Array)

class ActiveSupport::Callbacks::CallbackChain
  include ::Enumerable

  def initialize(name, config); end

  def append(*callbacks); end
  def clear; end
  def compile; end

  # Returns the value of attribute config.
  def config; end

  def delete(o); end
  def each(&block); end
  def empty?; end
  def index(o); end
  def insert(index, o); end

  # Returns the value of attribute name.
  def name; end

  def prepend(*callbacks); end

  protected

  # Returns the value of attribute chain.
  def chain; end

  private

  def append_one(callback); end
  def default_terminator; end
  def initialize_copy(other); end
  def prepend_one(callback); end
  def remove_duplicates(callback); end
end

# Execute before and after filters in a sequence instead of
# chaining them with nested lambda calls, see:
# https://github.com/rails/rails/issues/18011
class ActiveSupport::Callbacks::CallbackSequence
  def initialize(
    nested = T.unsafe(nil),
    call_template = T.unsafe(nil),
    user_conditions = T.unsafe(nil)
  ); end

  def after(&after); end
  def around(call_template, user_conditions); end
  def before(&before); end
  def expand_call_template(arg, block); end
  def final?; end
  def invoke_after(arg); end
  def invoke_before(arg); end

  # Returns the value of attribute nested.
  def nested; end

  def skip?(arg); end
end

module ActiveSupport::Callbacks::ClassMethods
  # This is used internally to append, prepend and skip callbacks to the
  # CallbackChain.
  def __update_callbacks(name); end

  # Define sets of events in the object life cycle that support callbacks.
  #
  # define_callbacks :validate
  # define_callbacks :initialize, :save, :destroy
  #
  # ===== Options
  #
  # * <tt>:terminator</tt> - Determines when a before filter will halt the
  # callback chain, preventing following before and around callbacks from
  # being called and the event from being triggered.
  # This should be a lambda to be executed.
  # The current object and the result lambda of the callback will be provided
  # to the terminator lambda.
  #
  # define_callbacks :validate, terminator: ->(target, result_lambda) { result_lambda.call == false }
  #
  # In this example, if any before validate callbacks returns +false+,
  # any successive before and around callback is not executed.
  #
  # The default terminator halts the chain when a callback throws +:abort+.
  #
  # * <tt>:skip_after_callbacks_if_terminated</tt> - Determines if after
  # callbacks should be terminated by the <tt>:terminator</tt> option. By
  # default after callbacks are executed no matter if callback chain was
  # terminated or not. This option has no effect if <tt>:terminator</tt>
  # option is set to +nil+.
  #
  # * <tt>:scope</tt> - Indicates which methods should be executed when an
  # object is used as a callback.
  #
  # class Audit
  # def before(caller)
  # puts 'Audit: before is called'
  # end
  #
  # def before_save(caller)
  # puts 'Audit: before_save is called'
  # end
  # end
  #
  # class Account
  # include ActiveSupport::Callbacks
  #
  # define_callbacks :save
  # set_callback :save, :before, Audit.new
  #
  # def save
  # run_callbacks :save do
  # puts 'save in main'
  # end
  # end
  # end
  #
  # In the above case whenever you save an account the method
  # <tt>Audit#before</tt> will be called. On the other hand
  #
  # define_callbacks :save, scope: [:kind, :name]
  #
  # would trigger <tt>Audit#before_save</tt> instead. That's constructed
  # by calling <tt>#{kind}_#{name}</tt> on the given instance. In this
  # case "kind" is "before" and "name" is "save". In this context +:kind+
  # and +:name+ have special meanings: +:kind+ refers to the kind of
  # callback (before/after/around) and +:name+ refers to the method on
  # which callbacks are being defined.
  #
  # A declaration like
  #
  # define_callbacks :save, scope: [:name]
  #
  # would call <tt>Audit#save</tt>.
  #
  # ===== Notes
  #
  # +names+ passed to +define_callbacks+ must not end with
  # <tt>!</tt>, <tt>?</tt> or <tt>=</tt>.
  #
  # Calling +define_callbacks+ multiple times with the same +names+ will
  # overwrite previous callbacks registered with +set_callback+.
  def define_callbacks(*names); end

  def normalize_callback_params(filters, block); end

  # Remove all set callbacks for the given event.
  def reset_callbacks(name); end

  # Install a callback for the given event.
  #
  # set_callback :save, :before, :before_method
  # set_callback :save, :after,  :after_method, if: :condition
  # set_callback :save, :around, ->(r, block) { stuff; result = block.call; stuff }
  #
  # The second argument indicates whether the callback is to be run +:before+,
  # +:after+, or +:around+ the event. If omitted, +:before+ is assumed. This
  # means the first example above can also be written as:
  #
  # set_callback :save, :before_method
  #
  # The callback can be specified as a symbol naming an instance method; as a
  # proc, lambda, or block; or as an object that responds to a certain method
  # determined by the <tt>:scope</tt> argument to +define_callbacks+.
  #
  # If a proc, lambda, or block is given, its body is evaluated in the context
  # of the current object. It can also optionally accept the current object as
  # an argument.
  #
  # Before and around callbacks are called in the order that they are set;
  # after callbacks are called in the reverse order.
  #
  # Around callbacks can access the return value from the event, if it
  # wasn't halted, from the +yield+ call.
  #
  # ===== Options
  #
  # * <tt>:if</tt> - A symbol or an array of symbols, each naming an instance
  # method or a proc; the callback will be called only when they all return
  # a true value.
  #
  # If a proc is given, its body is evaluated in the context of the
  # current object. It can also optionally accept the current object as
  # an argument.
  # * <tt>:unless</tt> - A symbol or an array of symbols, each naming an
  # instance method or a proc; the callback will be called only when they
  # all return a false value.
  #
  # If a proc is given, its body is evaluated in the context of the
  # current object. It can also optionally accept the current object as
  # an argument.
  # * <tt>:prepend</tt> - If +true+, the callback will be prepended to the
  # existing chain rather than appended.
  def set_callback(name, *filter_list, &block); end

  # Skip a previously set callback. Like +set_callback+, <tt>:if</tt> or
  # <tt>:unless</tt> options may be passed in order to control when the
  # callback is skipped.
  #
  # class Writer < PersonRecord
  # attr_accessor :age
  # skip_callback :save, :before, :saving_message, if: -> { age > 18 }
  # end
  #
  # When if option returns true, callback is skipped.
  #
  # writer = Writer.new
  # writer.age = 20
  # writer.save
  #
  # Output:
  # - save
  # saved
  #
  # When if option returns false, callback is NOT skipped.
  #
  # young_writer = Writer.new
  # young_writer.age = 17
  # young_writer.save
  #
  # Output:
  # saving...
  # - save
  # saved
  #
  # An <tt>ArgumentError</tt> will be raised if the callback has not
  # already been set (unless the <tt>:raise</tt> option is set to <tt>false</tt>).
  def skip_callback(name, *filter_list, &block); end

  protected

  def get_callbacks(name); end
  def set_callbacks(name, callbacks); end
end

module ActiveSupport::Callbacks::Conditionals
end

class ActiveSupport::Callbacks::Conditionals::Value
  def initialize(&block); end

  def call(target, value); end
end

module ActiveSupport::Callbacks::Filters
end

class ActiveSupport::Callbacks::Filters::After
  class << self
    def build(
      callback_sequence,
      user_callback,
      user_conditions,
      chain_config
    ); end

    private

    def conditional(callback_sequence, user_callback, user_conditions); end
    def halting(callback_sequence, user_callback); end
    def halting_and_conditional(
      callback_sequence,
      user_callback,
      user_conditions
    ); end
    def simple(callback_sequence, user_callback); end
  end
end

class ActiveSupport::Callbacks::Filters::Before
  class << self
    def build(
      callback_sequence,
      user_callback,
      user_conditions,
      chain_config,
      filter,
      name
    ); end

    private

    def halting(
      callback_sequence,
      user_callback,
      halted_lambda,
      filter,
      name
    ); end
    def halting_and_conditional(
      callback_sequence,
      user_callback,
      user_conditions,
      halted_lambda,
      filter,
      name
    ); end
  end
end

class ActiveSupport::Callbacks::Filters::Environment < ::Struct
  # Returns the value of attribute halted
  def halted; end

  # Sets the attribute halted
  def halted=(_); end

  # Returns the value of attribute target
  def target; end

  # Sets the attribute target
  def target=(_); end

  # Returns the value of attribute value
  def value; end

  # Sets the attribute value
  def value=(_); end

  class << self
    def [](*_arg0); end
    def inspect; end
    def members; end
    def new(*_arg0); end
  end
end

class ActiveSupport::CodeGenerator
  def initialize(owner, path, line); end

  def define_cached_method(name, namespace:, as: T.unsafe(nil), &block); end
  def execute; end

  class << self
    def batch(owner, path, line); end
  end
end

class ActiveSupport::CodeGenerator::MethodSet
  def initialize(namespace); end

  def apply(owner, path, line); end
  def define_cached_method(name, as: T.unsafe(nil)); end
end

ActiveSupport::CodeGenerator::MethodSet::METHOD_CACHES =
  T.let(T.unsafe(nil), Hash)

module ActiveSupport::CompareWithRange
  # Extends the default Range#=== to support range comparisons.
  # (1..5) === (1..5)  # => true
  # (1..5) === (2..3)  # => true
  # (1..5) === (1...6) # => true
  # (1..5) === (2..6)  # => false
  #
  # The native Range#=== behavior is untouched.
  # ('a'..'f') === ('c') # => true
  # (5..9) === (11) # => false
  #
  # The given range must be fully bounded, with both start and end.
  def ===(value); end

  # Extends the default Range#include? to support range comparisons.
  # (1..5).include?(1..5)  # => true
  # (1..5).include?(2..3)  # => true
  # (1..5).include?(1...6) # => true
  # (1..5).include?(2..6)  # => false
  #
  # The native Range#include? behavior is untouched.
  # ('a'..'f').include?('c') # => true
  # (5..9).include?(11) # => false
  #
  # The given range must be fully bounded, with both start and end.
  def include?(value); end
end

# A typical module looks like this:
#
# module M
# def self.included(base)
# base.extend ClassMethods
# base.class_eval do
# scope :disabled, -> { where(disabled: true) }
# end
# end
#
# module ClassMethods
# ...
# end
# end
#
# By using <tt>ActiveSupport::Concern</tt> the above module could instead be
# written as:
#
# require "active_support/concern"
#
# module M
# extend ActiveSupport::Concern
#
# included do
# scope :disabled, -> { where(disabled: true) }
# end
#
# class_methods do
# ...
# end
# end
#
# Moreover, it gracefully handles module dependencies. Given a +Foo+ module
# and a +Bar+ module which depends on the former, we would typically write the
# following:
#
# module Foo
# def self.included(base)
# base.class_eval do
# def self.method_injected_by_foo
# ...
# end
# end
# end
# end
#
# module Bar
# def self.included(base)
# base.method_injected_by_foo
# end
# end
#
# class Host
# include Foo # We need to include this dependency for Bar
# include Bar # Bar is the module that Host really needs
# end
#
# But why should +Host+ care about +Bar+'s dependencies, namely +Foo+? We
# could try to hide these from +Host+ directly including +Foo+ in +Bar+:
#
# module Bar
# include Foo
# def self.included(base)
# base.method_injected_by_foo
# end
# end
#
# class Host
# include Bar
# end
#
# Unfortunately this won't work, since when +Foo+ is included, its <tt>base</tt>
# is the +Bar+ module, not the +Host+ class. With <tt>ActiveSupport::Concern</tt>,
# module dependencies are properly resolved:
#
# require "active_support/concern"
#
# module Foo
# extend ActiveSupport::Concern
# included do
# def self.method_injected_by_foo
# ...
# end
# end
# end
#
# module Bar
# extend ActiveSupport::Concern
# include Foo
#
# included do
# self.method_injected_by_foo
# end
# end
#
# class Host
# include Bar # It works, now Bar takes care of its dependencies
# end
#
# === Prepending concerns
#
# Just like <tt>include</tt>, concerns also support <tt>prepend</tt> with a corresponding
# <tt>prepended do</tt> callback. <tt>module ClassMethods</tt> or <tt>class_methods do</tt> are
# prepended as well.
#
# <tt>prepend</tt> is also used for any dependencies.
module ActiveSupport::Concern
  def append_features(base); end

  # Define class methods from given block.
  # You can define private class methods as well.
  #
  # module Example
  # extend ActiveSupport::Concern
  #
  # class_methods do
  # def foo; puts 'foo'; end
  #
  # private
  # def bar; puts 'bar'; end
  # end
  # end
  #
  # class Buzz
  # include Example
  # end
  #
  # Buzz.foo # => "foo"
  # Buzz.bar # => private method 'bar' called for Buzz:Class(NoMethodError)
  def class_methods(&class_methods_module_definition); end

  # Evaluate given block in context of base class,
  # so that you can write class macros here.
  # When you define more than one +included+ block, it raises an exception.
  # sig { params(base:T.untyped, block: T.self_type).void}
  def included(base = T.unsafe(nil), &block); end

  def prepend_features(base); end

  # Evaluate given block in context of base class,
  # so that you can write class macros here.
  # When you define more than one +prepended+ block, it raises an exception.
  def prepended(base = T.unsafe(nil), &block); end

  class << self
    def extended(base); end
  end
end

class ActiveSupport::Concern::MultipleIncludedBlocks < ::StandardError
  def initialize; end
end

class ActiveSupport::Concern::MultiplePrependBlocks < ::StandardError
  def initialize; end
end

module ActiveSupport::Concurrency
end

# A monitor that will permit dependency loading while blocked waiting for
# the lock.
class ActiveSupport::Concurrency::LoadInterlockAwareMonitor < ::Monitor
  # Enters an exclusive section, but allows dependency loading while blocked
  def mon_enter; end

  def synchronize(&block); end
end

ActiveSupport::Concurrency::LoadInterlockAwareMonitor::EXCEPTION_IMMEDIATE =
  T.let(T.unsafe(nil), Hash)
ActiveSupport::Concurrency::LoadInterlockAwareMonitor::EXCEPTION_NEVER =
  T.let(T.unsafe(nil), Hash)

# A share/exclusive lock, otherwise known as a read/write lock.
#
# https://en.wikipedia.org/wiki/Readers%E2%80%93writer_lock
class ActiveSupport::Concurrency::ShareLock
  include ::MonitorMixin

  def initialize; end

  # Execute the supplied block while holding the Exclusive lock. If
  # +no_wait+ is set and the lock is not immediately available,
  # returns +nil+ without yielding. Otherwise, returns the result of
  # the block.
  #
  # See +start_exclusive+ for other options.
  def exclusive(
    purpose: T.unsafe(nil),
    compatible: T.unsafe(nil),
    after_compatible: T.unsafe(nil),
    no_wait: T.unsafe(nil)
  ); end

  # We track Thread objects, instead of just using counters, because
  # we need exclusive locks to be reentrant, and we need to be able
  # to upgrade share locks to exclusive.
  def raw_state; end

  # Execute the supplied block while holding the Share lock.
  def sharing; end

  # Returns false if +no_wait+ is set and the lock is not
  # immediately available. Otherwise, returns true after the lock
  # has been acquired.
  #
  # +purpose+ and +compatible+ work together; while this thread is
  # waiting for the exclusive lock, it will yield its share (if any)
  # to any other attempt whose +purpose+ appears in this attempt's
  # +compatible+ list. This allows a "loose" upgrade, which, being
  # less strict, prevents some classes of deadlocks.
  #
  # For many resources, loose upgrades are sufficient: if a thread
  # is awaiting a lock, it is not running any other code. With
  # +purpose+ matching, it is possible to yield only to other
  # threads whose activity will not interfere.
  def start_exclusive(
    purpose: T.unsafe(nil),
    compatible: T.unsafe(nil),
    no_wait: T.unsafe(nil)
  ); end

  def start_sharing; end

  # Relinquish the exclusive lock. Must only be called by the thread
  # that called start_exclusive (and currently holds the lock).
  def stop_exclusive(compatible: T.unsafe(nil)); end

  def stop_sharing; end

  # Temporarily give up all held Share locks while executing the
  # supplied block, allowing any +compatible+ exclusive lock request
  # to proceed.
  def yield_shares(
    purpose: T.unsafe(nil),
    compatible: T.unsafe(nil),
    block_share: T.unsafe(nil)
  ); end

  private

  # Must be called within synchronize
  def busy_for_exclusive?(purpose); end

  def busy_for_sharing?(purpose); end
  def eligible_waiters?(compatible); end
  def wait_for(method, &block); end
end

# Configurable provides a <tt>config</tt> method to store and retrieve
# configuration options as an <tt>OrderedOptions</tt>.
module ActiveSupport::Configurable
  extend ::ActiveSupport::Concern

  mixes_in_class_methods ::ActiveSupport::Configurable::ClassMethods

  # Reads and writes attributes from a configuration <tt>OrderedOptions</tt>.
  #
  # require "active_support/configurable"
  #
  # class User
  # include ActiveSupport::Configurable
  # end
  #
  # user = User.new
  #
  # user.config.allowed_access = true
  # user.config.level = 1
  #
  # user.config.allowed_access # => true
  # user.config.level          # => 1
  def config; end
end

module ActiveSupport::Configurable::ClassMethods
  def config; end
  def configure; end

  private

  # Allows you to add shortcut so that you don't have to refer to attribute
  # through config. Also look at the example for config to contrast.
  #
  # Defines both class and instance config accessors.
  #
  # class User
  # include ActiveSupport::Configurable
  # config_accessor :allowed_access
  # end
  #
  # User.allowed_access # => nil
  # User.allowed_access = false
  # User.allowed_access # => false
  #
  # user = User.new
  # user.allowed_access # => false
  # user.allowed_access = true
  # user.allowed_access # => true
  #
  # User.allowed_access # => false
  #
  # The attribute name must be a valid method name in Ruby.
  #
  # class User
  # include ActiveSupport::Configurable
  # config_accessor :"1_Badname"
  # end
  # # => NameError: invalid config attribute name
  #
  # To omit the instance writer method, pass <tt>instance_writer: false</tt>.
  # To omit the instance reader method, pass <tt>instance_reader: false</tt>.
  #
  # class User
  # include ActiveSupport::Configurable
  # config_accessor :allowed_access, instance_reader: false, instance_writer: false
  # end
  #
  # User.allowed_access = false
  # User.allowed_access # => false
  #
  # User.new.allowed_access = true # => NoMethodError
  # User.new.allowed_access        # => NoMethodError
  #
  # Or pass <tt>instance_accessor: false</tt>, to omit both instance methods.
  #
  # class User
  # include ActiveSupport::Configurable
  # config_accessor :allowed_access, instance_accessor: false
  # end
  #
  # User.allowed_access = false
  # User.allowed_access # => false
  #
  # User.new.allowed_access = true # => NoMethodError
  # User.new.allowed_access        # => NoMethodError
  #
  # Also you can pass <tt>default</tt> or a block to set up the attribute with a default value.
  #
  # class User
  # include ActiveSupport::Configurable
  # config_accessor :allowed_access, default: false
  # config_accessor :hair_colors do
  # [:brown, :black, :blonde, :red]
  # end
  # end
  #
  # User.allowed_access # => false
  # User.hair_colors # => [:brown, :black, :blonde, :red]
  def config_accessor(
    *names,
    instance_reader: T.unsafe(nil),
    instance_writer: T.unsafe(nil),
    instance_accessor: T.unsafe(nil),
    default: T.unsafe(nil)
  ); end
end

class ActiveSupport::Configurable::Configuration < ::ActiveSupport::InheritableOptions
  def compile_methods!; end

  class << self
    # Compiles reader methods so we don't have to go through method_missing.
    def compile_methods!(keys); end
  end
end

# Reads a YAML configuration file, evaluating any ERB, then
# parsing the resulting YAML.
#
# Warns in case of YAML confusing characters, like invisible
# non-breaking spaces.
class ActiveSupport::ConfigurationFile
  def initialize(content_path); end

  def parse(context: T.unsafe(nil), **options); end

  private

  def read(content_path); end
  def render(context); end

  class << self
    def parse(content_path, **options); end
  end
end

class ActiveSupport::ConfigurationFile::FormatError < ::StandardError
end

# Abstract super class that provides a thread-isolated attributes singleton, which resets automatically
# before and after each request. This allows you to keep all the per-request attributes easily
# available to the whole system.
#
# The following full app-like example demonstrates how to use a Current class to
# facilitate easy access to the global, per-request attributes without passing them deeply
# around everywhere:
#
# # app/models/current.rb
# class Current < ActiveSupport::CurrentAttributes
# attribute :account, :user
# attribute :request_id, :user_agent, :ip_address
#
# resets { Time.zone = nil }
#
# def user=(user)
# super
# self.account = user.account
# Time.zone    = user.time_zone
# end
# end
#
# # app/controllers/concerns/authentication.rb
# module Authentication
# extend ActiveSupport::Concern
#
# included do
# before_action :authenticate
# end
#
# private
# def authenticate
# if authenticated_user = User.find_by(id: cookies.encrypted[:user_id])
# Current.user = authenticated_user
# else
# redirect_to new_session_url
# end
# end
# end
#
# # app/controllers/concerns/set_current_request_details.rb
# module SetCurrentRequestDetails
# extend ActiveSupport::Concern
#
# included do
# before_action do
# Current.request_id = request.uuid
# Current.user_agent = request.user_agent
# Current.ip_address = request.ip
# end
# end
# end
#
# class ApplicationController < ActionController::Base
# include Authentication
# include SetCurrentRequestDetails
# end
#
# class MessagesController < ApplicationController
# def create
# Current.account.messages.create(message_params)
# end
# end
#
# class Message < ApplicationRecord
# belongs_to :creator, default: -> { Current.user }
# after_create { |message| Event.create(record: message) }
# end
#
# class Event < ApplicationRecord
# before_create do
# self.request_id = Current.request_id
# self.user_agent = Current.user_agent
# self.ip_address = Current.ip_address
# end
# end
#
# A word of caution: It's easy to overdo a global singleton like Current and tangle your model as a result.
# Current should only be used for a few, top-level globals, like account, user, and request details.
# The attributes stuck in Current should be used by more or less all actions on all requests. If you start
# sticking controller-specific attributes in there, you're going to create a mess.
class ActiveSupport::CurrentAttributes
  include ::ActiveSupport::Callbacks
  extend ::ActiveSupport::Callbacks::ClassMethods
  extend ::ActiveSupport::DescendantsTracker

  def initialize; end

  def __callbacks; end
  def __callbacks?; end
  def _reset_callbacks; end
  def _run_reset_callbacks(&block); end

  # Returns the value of attribute attributes.
  def attributes; end

  # Sets the attribute attributes
  def attributes=(_arg0); end

  # Reset all attributes. Should be called before and after actions, when used as a per-request singleton.
  def reset; end

  # Expose one or more attributes within a block. Old values are returned after the block concludes.
  # Example demonstrating the common use of needing to set Current attributes outside the request-cycle:
  #
  # class Chat::PublicationJob < ApplicationJob
  # def perform(attributes, room_number, creator)
  # Current.set(person: creator) do
  # Chat::Publisher.publish(attributes: attributes, room_number: room_number)
  # end
  # end
  # end
  def set(set_attributes); end

  private

  def assign_attributes(new_attributes); end
  def compute_attributes(keys); end

  class << self
    def __callbacks; end
    def __callbacks=(value); end
    def __callbacks?; end
    def _reset_callbacks; end
    def _reset_callbacks=(value); end

    # Calls this block after #reset is called on the instance. Used for resetting external collaborators, like Time.zone.
    def after_reset(&block); end

    # Declares one or more attributes that will be given both class and instance accessor methods.
    def attribute(*names); end

    # Calls this block before #reset is called on the instance. Used for resetting external collaborators that depend on current values.
    def before_reset(&block); end

    def clear_all; end

    # Returns singleton instance for this class in this thread. If none exists, one is created.
    def instance; end

    def reset(*_arg0, &_arg1); end
    def reset_all; end

    # Calls this block after #reset is called on the instance. Used for resetting external collaborators, like Time.zone.
    def resets(&block); end

    def set(*_arg0, &_arg1); end

    private

    def current_instances; end
    def current_instances_key; end
    def generated_attribute_methods; end
    def method_missing(name, *args, &block); end
    def respond_to_missing?(name, _); end
  end
end

module ActiveSupport::Dependencies
  class << self
    def _autoloaded_tracked_classes; end
    def _autoloaded_tracked_classes=(_arg0); end
    def _eager_load_paths; end
    def _eager_load_paths=(_arg0); end
    def autoload_once_paths; end
    def autoload_once_paths=(_arg0); end
    def autoload_paths; end
    def autoload_paths=(_arg0); end
    def autoloader; end
    def autoloader=(_arg0); end

    # Private method that reloads constants autoloaded by the main autoloader.
    #
    # Rails.application.reloader.reload! is the public interface for application
    # reload. That involves more things, like deleting unloaded classes from the
    # internal state of the descendants tracker, or reloading routes.
    def clear; end

    # Private method that helps configuring the autoloaders.
    def eager_load?(path); end

    def interlock; end
    def interlock=(_arg0); end

    # Execute the supplied block while holding an exclusive lock,
    # preventing any other thread from being inside a #run_interlock
    # block at the same time.
    def load_interlock(&block); end

    # Execute the supplied block without interference from any
    # concurrent loads.
    def run_interlock(&block); end

    # Private method used by require_dependency.
    def search_for_file(relpath); end

    # Execute the supplied block while holding an exclusive lock,
    # preventing any other thread from being inside a #run_interlock
    # block at the same time.
    def unload_interlock(&block); end
  end
end

class ActiveSupport::Dependencies::Interlock
  def initialize; end

  def done_running; end
  def done_unloading; end
  def loading(&block); end
  def permit_concurrent_loads(&block); end
  def raw_state(&block); end
  def running(&block); end
  def start_running; end
  def start_unloading; end
  def unloading(&block); end
end

module ActiveSupport::Dependencies::RequireDependency
  # <b>Warning:</b> This method is obsolete. The semantics of the autoloader
  # match Ruby's and you do not need to be defensive with load order anymore.
  # Just refer to classes and modules normally.
  #
  # Engines that do not control the mode in which their parent application runs
  # should call +require_dependency+ where needed in case the runtime mode is
  # +:classic+.
  def require_dependency(filename); end
end

module ActiveSupport::DeprecatedNumericWithFormat
  def to_s(format = T.unsafe(nil), options = T.unsafe(nil)); end
end

module ActiveSupport::DeprecatedRangeWithFormat
  def to_default_s(*args, &block); end
  def to_s(format = T.unsafe(nil)); end
end

ActiveSupport::DeprecatedRangeWithFormat::NOT_SET = T.let(T.unsafe(nil), Object)

# \Deprecation specifies the API used by Rails to deprecate methods, instance
# variables, objects and constants.
class ActiveSupport::Deprecation
  include ::Singleton
  include ::ActiveSupport::Deprecation::InstanceDelegator
  include ::ActiveSupport::Deprecation::Behavior
  include ::ActiveSupport::Deprecation::Reporting
  include ::ActiveSupport::Deprecation::Disallowed
  include ::ActiveSupport::Deprecation::MethodWrapper
  extend ::Singleton::SingletonClassMethods
  extend ::ActiveSupport::Deprecation::InstanceDelegator::ClassMethods
  extend ::ActiveSupport::Deprecation::InstanceDelegator::OverrideDelegators

  # It accepts two parameters on initialization. The first is a version of library
  # and the second is a library name.
  #
  # ActiveSupport::Deprecation.new('2.0', 'MyLibrary')
  def initialize(
    deprecation_horizon = T.unsafe(nil),
    gem_name = T.unsafe(nil)
  ); end

  # The version number in which the deprecated behavior will be removed, by default.
  def deprecation_horizon; end

  # The version number in which the deprecated behavior will be removed, by default.
  def deprecation_horizon=(_arg0); end

  class << self
    def allow(*_arg0, &_arg1); end
    def behavior(*_arg0, &_arg1); end
    def behavior=(arg); end
    def debug(*_arg0, &_arg1); end
    def debug=(arg); end
    def deprecate_methods(*_arg0, &_arg1); end
    def deprecation_horizon(*_arg0, &_arg1); end
    def deprecation_horizon=(arg); end
    def disallowed_behavior(*_arg0, &_arg1); end
    def disallowed_behavior=(arg); end
    def disallowed_warnings(*_arg0, &_arg1); end
    def disallowed_warnings=(arg); end
    def gem_name(*_arg0, &_arg1); end
    def gem_name=(arg); end
    def silence(*_arg0, &_arg1); end
    def silenced(*_arg0, &_arg1); end
    def silenced=(arg); end
  end
end

# Behavior module allows to determine how to display deprecation messages.
# You can create a custom behavior or set any from the +DEFAULT_BEHAVIORS+
# constant. Available behaviors are:
#
# [+raise+]   Raise <tt>ActiveSupport::DeprecationException</tt>.
# [+stderr+]  Log all deprecation warnings to <tt>$stderr</tt>.
# [+log+]     Log all deprecation warnings to +Rails.logger+.
# [+notify+]  Use +ActiveSupport::Notifications+ to notify +deprecation.rails+.
# [+silence+] Do nothing. On Rails, set <tt>config.active_support.report_deprecations = false</tt> to disable all behaviors.
#
# Setting behaviors only affects deprecations that happen after boot time.
# For more information you can read the documentation of the +behavior=+ method.
module ActiveSupport::Deprecation::Behavior
  # Returns the current behavior or if one isn't set, defaults to +:stderr+.
  def behavior; end

  # Sets the behavior to the specified value. Can be a single value, array,
  # or an object that responds to +call+.
  #
  # Available behaviors:
  #
  # [+raise+]   Raise <tt>ActiveSupport::DeprecationException</tt>.
  # [+stderr+]  Log all deprecation warnings to <tt>$stderr</tt>.
  # [+log+]     Log all deprecation warnings to +Rails.logger+.
  # [+notify+]  Use +ActiveSupport::Notifications+ to notify +deprecation.rails+.
  # [+silence+] Do nothing.
  #
  # Setting behaviors only affects deprecations that happen after boot time.
  # Deprecation warnings raised by gems are not affected by this setting
  # because they happen before Rails boots up.
  #
  # ActiveSupport::Deprecation.behavior = :stderr
  # ActiveSupport::Deprecation.behavior = [:stderr, :log]
  # ActiveSupport::Deprecation.behavior = MyCustomHandler
  # ActiveSupport::Deprecation.behavior = ->(message, callstack, deprecation_horizon, gem_name) {
  # # custom stuff
  # }
  #
  # If you are using Rails, you can set <tt>config.active_support.report_deprecations = false</tt> to disable
  # all deprecation behaviors. This is similar to the +silence+ option but more performant.
  def behavior=(behavior); end

  # Whether to print a backtrace along with the warning.
  def debug; end

  # Whether to print a backtrace along with the warning.
  def debug=(_arg0); end

  # Returns the current behavior for disallowed deprecations or if one isn't set, defaults to +:raise+.
  def disallowed_behavior; end

  # Sets the behavior for disallowed deprecations (those configured by
  # ActiveSupport::Deprecation.disallowed_warnings=) to the specified
  # value. As with +behavior=+, this can be a single value, array, or an
  # object that responds to +call+.
  def disallowed_behavior=(behavior); end

  private

  def arity_coerce(behavior); end
end

# Default warning behaviors per Rails.env.
ActiveSupport::Deprecation::DEFAULT_BEHAVIORS = T.let(T.unsafe(nil), Hash)

# DeprecatedConstantAccessor transforms a constant into a deprecated one by
# hooking +const_missing+.
#
# It takes the names of an old (deprecated) constant and of a new constant
# (both in string form) and optionally a deprecator. The deprecator defaults
# to +ActiveSupport::Deprecator+ if none is specified.
#
# The deprecated constant now returns the same object as the new one rather
# than a proxy object, so it can be used transparently in +rescue+ blocks
# etc.
#
# PLANETS = %w(mercury venus earth mars jupiter saturn uranus neptune pluto)
#
# # (In a later update, the original implementation of `PLANETS` has been removed.)
#
# PLANETS_POST_2006 = %w(mercury venus earth mars jupiter saturn uranus neptune)
# include ActiveSupport::Deprecation::DeprecatedConstantAccessor
# deprecate_constant 'PLANETS', 'PLANETS_POST_2006'
#
# PLANETS.map { |planet| planet.capitalize }
# # => DEPRECATION WARNING: PLANETS is deprecated! Use PLANETS_POST_2006 instead.
# (Backtrace information…)
# ["Mercury", "Venus", "Earth", "Mars", "Jupiter", "Saturn", "Uranus", "Neptune"]
module ActiveSupport::Deprecation::DeprecatedConstantAccessor
  class << self
    def included(base); end
  end
end

# DeprecatedConstantProxy transforms a constant into a deprecated one. It
# takes the names of an old (deprecated) constant and of a new constant
# (both in string form) and optionally a deprecator. The deprecator defaults
# to +ActiveSupport::Deprecator+ if none is specified. The deprecated constant
# now returns the value of the new one.
#
# PLANETS = %w(mercury venus earth mars jupiter saturn uranus neptune pluto)
#
# # (In a later update, the original implementation of `PLANETS` has been removed.)
#
# PLANETS_POST_2006 = %w(mercury venus earth mars jupiter saturn uranus neptune)
# PLANETS = ActiveSupport::Deprecation::DeprecatedConstantProxy.new('PLANETS', 'PLANETS_POST_2006')
#
# PLANETS.map { |planet| planet.capitalize }
# # => DEPRECATION WARNING: PLANETS is deprecated! Use PLANETS_POST_2006 instead.
# (Backtrace information…)
# ["Mercury", "Venus", "Earth", "Mars", "Jupiter", "Saturn", "Uranus", "Neptune"]
class ActiveSupport::Deprecation::DeprecatedConstantProxy < ::Module
  def initialize(
    old_const,
    new_const,
    deprecator = T.unsafe(nil),
    message: T.unsafe(nil)
  ); end

  # Returns the class of the new constant.
  #
  # PLANETS_POST_2006 = %w(mercury venus earth mars jupiter saturn uranus neptune)
  # PLANETS = ActiveSupport::Deprecation::DeprecatedConstantProxy.new('PLANETS', 'PLANETS_POST_2006')
  # PLANETS.class # => Array
  def class; end

  def hash(*_arg0, &_arg1); end

  # Don't give a deprecation warning on inspect since test/unit and error
  # logs rely on it for diagnostics.
  def inspect; end

  def instance_methods(*_arg0, &_arg1); end
  def name(*_arg0, &_arg1); end
  def respond_to?(*_arg0, &_arg1); end

  private

  def const_missing(name); end
  def method_missing(called, *args, &block); end
  def target; end

  class << self
    def new(*args, **options, &block); end
  end
end

# DeprecatedInstanceVariableProxy transforms an instance variable into a
# deprecated one. It takes an instance of a class, a method on that class
# and an instance variable. It optionally takes a deprecator as the last
# argument. The deprecator defaults to +ActiveSupport::Deprecator+ if none
# is specified.
#
# class Example
# def initialize
# @request = ActiveSupport::Deprecation::DeprecatedInstanceVariableProxy.new(self, :request, :@request)
# @_request = :special_request
# end
#
# def request
# @_request
# end
#
# def old_request
# @request
# end
# end
#
# example = Example.new
# # => #<Example:0x007fb9b31090b8 @_request=:special_request, @request=:special_request>
#
# example.old_request.to_s
# # => DEPRECATION WARNING: @request is deprecated! Call request.to_s instead of
# @request.to_s
# (Backtrace information…)
# "special_request"
#
# example.request.to_s
# # => "special_request"
class ActiveSupport::Deprecation::DeprecatedInstanceVariableProxy < ::ActiveSupport::Deprecation::DeprecationProxy
  def initialize(
    instance,
    method,
    var = T.unsafe(nil),
    deprecator = T.unsafe(nil)
  ); end

  private

  def target; end
  def warn(callstack, called, args); end
end

# DeprecatedObjectProxy transforms an object into a deprecated one. It
# takes an object, a deprecation message and optionally a deprecator. The
# deprecator defaults to +ActiveSupport::Deprecator+ if none is specified.
#
# deprecated_object = ActiveSupport::Deprecation::DeprecatedObjectProxy.new(Object.new, "This object is now deprecated")
# # => #<Object:0x007fb9b34c34b0>
#
# deprecated_object.to_s
# DEPRECATION WARNING: This object is now deprecated.
# (Backtrace)
# # => "#<Object:0x007fb9b34c34b0>"
class ActiveSupport::Deprecation::DeprecatedObjectProxy < ::ActiveSupport::Deprecation::DeprecationProxy
  def initialize(object, message, deprecator = T.unsafe(nil)); end

  private

  def target; end
  def warn(callstack, called, args); end
end

class ActiveSupport::Deprecation::DeprecationProxy
  # Don't give a deprecation warning on inspect since test/unit and error
  # logs rely on it for diagnostics.
  def inspect; end

  private

  def method_missing(called, *args, &block); end

  class << self
    def new(*args, &block); end
  end
end

module ActiveSupport::Deprecation::Disallowed
  # Returns the configured criteria used to identify deprecation messages
  # which should be treated as disallowed.
  def disallowed_warnings; end

  # Sets the criteria used to identify deprecation messages which should be
  # disallowed. Can be an array containing strings, symbols, or regular
  # expressions. (Symbols are treated as strings). These are compared against
  # the text of the generated deprecation warning.
  #
  # Additionally the scalar symbol +:all+ may be used to treat all
  # deprecations as disallowed.
  #
  # Deprecations matching a substring or regular expression will be handled
  # using the configured +ActiveSupport::Deprecation.disallowed_behavior+
  # rather than +ActiveSupport::Deprecation.behavior+
  def disallowed_warnings=(_arg0); end

  private

  def deprecation_disallowed?(message); end
  def explicitly_allowed?(message); end
end

module ActiveSupport::Deprecation::InstanceDelegator
  mixes_in_class_methods ::ActiveSupport::Deprecation::InstanceDelegator::ClassMethods
  mixes_in_class_methods ::ActiveSupport::Deprecation::InstanceDelegator::OverrideDelegators

  class << self
    def included(base); end
  end
end

module ActiveSupport::Deprecation::InstanceDelegator::ClassMethods
  def include(included_module); end
  def method_added(method_name); end
end

module ActiveSupport::Deprecation::InstanceDelegator::OverrideDelegators
  def deprecation_warning(
    deprecated_method_name,
    message = T.unsafe(nil),
    caller_backtrace = T.unsafe(nil)
  ); end
  def warn(message = T.unsafe(nil), callstack = T.unsafe(nil)); end
end

module ActiveSupport::Deprecation::MethodWrapper
  # Declare that a method has been deprecated.
  #
  # class Fred
  # def aaa; end
  # def bbb; end
  # def ccc; end
  # def ddd; end
  # def eee; end
  # end
  #
  # Using the default deprecator:
  # ActiveSupport::Deprecation.deprecate_methods(Fred, :aaa, bbb: :zzz, ccc: 'use Bar#ccc instead')
  # # => Fred
  #
  # Fred.new.aaa
  # # DEPRECATION WARNING: aaa is deprecated and will be removed from Rails 5.1. (called from irb_binding at (irb):10)
  # # => nil
  #
  # Fred.new.bbb
  # # DEPRECATION WARNING: bbb is deprecated and will be removed from Rails 5.1 (use zzz instead). (called from irb_binding at (irb):11)
  # # => nil
  #
  # Fred.new.ccc
  # # DEPRECATION WARNING: ccc is deprecated and will be removed from Rails 5.1 (use Bar#ccc instead). (called from irb_binding at (irb):12)
  # # => nil
  #
  # Passing in a custom deprecator:
  # custom_deprecator = ActiveSupport::Deprecation.new('next-release', 'MyGem')
  # ActiveSupport::Deprecation.deprecate_methods(Fred, ddd: :zzz, deprecator: custom_deprecator)
  # # => [:ddd]
  #
  # Fred.new.ddd
  # DEPRECATION WARNING: ddd is deprecated and will be removed from MyGem next-release (use zzz instead). (called from irb_binding at (irb):15)
  # # => nil
  #
  # Using a custom deprecator directly:
  # custom_deprecator = ActiveSupport::Deprecation.new('next-release', 'MyGem')
  # custom_deprecator.deprecate_methods(Fred, eee: :zzz)
  # # => [:eee]
  #
  # Fred.new.eee
  # DEPRECATION WARNING: eee is deprecated and will be removed from MyGem next-release (use zzz instead). (called from irb_binding at (irb):18)
  # # => nil
  def deprecate_methods(target_module, *method_names); end
end

module ActiveSupport::Deprecation::Reporting
  # Allow previously disallowed deprecation warnings within the block.
  # <tt>allowed_warnings</tt> can be an array containing strings, symbols, or regular
  # expressions. (Symbols are treated as strings). These are compared against
  # the text of deprecation warning messages generated within the block.
  # Matching warnings will be exempt from the rules set by
  # +ActiveSupport::Deprecation.disallowed_warnings+
  #
  # The optional <tt>if:</tt> argument accepts a truthy/falsy value or an object that
  # responds to <tt>.call</tt>. If truthy, then matching warnings will be allowed.
  # If falsey then the method yields to the block without allowing the warning.
  #
  # ActiveSupport::Deprecation.disallowed_behavior = :raise
  # ActiveSupport::Deprecation.disallowed_warnings = [
  # "something broke"
  # ]
  #
  # ActiveSupport::Deprecation.warn('something broke!')
  # # => ActiveSupport::DeprecationException
  #
  # ActiveSupport::Deprecation.allow ['something broke'] do
  # ActiveSupport::Deprecation.warn('something broke!')
  # end
  # # => nil
  #
  # ActiveSupport::Deprecation.allow ['something broke'], if: Rails.env.production? do
  # ActiveSupport::Deprecation.warn('something broke!')
  # end
  # # => ActiveSupport::DeprecationException for dev/test, nil for production
  def allow(allowed_warnings = T.unsafe(nil), if: T.unsafe(nil), &block); end

  def deprecation_warning(
    deprecated_method_name,
    message = T.unsafe(nil),
    caller_backtrace = T.unsafe(nil)
  ); end

  # Name of gem where method is deprecated
  def gem_name; end

  # Name of gem where method is deprecated
  def gem_name=(_arg0); end

  # Silence deprecation warnings within the block.
  #
  # ActiveSupport::Deprecation.warn('something broke!')
  # # => "DEPRECATION WARNING: something broke! (called from your_code.rb:1)"
  #
  # ActiveSupport::Deprecation.silence do
  # ActiveSupport::Deprecation.warn('something broke!')
  # end
  # # => nil
  def silence(&block); end

  def silenced; end

  # Whether to print a message (silent mode)
  def silenced=(_arg0); end

  # Outputs a deprecation warning to the output configured by
  # <tt>ActiveSupport::Deprecation.behavior</tt>.
  #
  # ActiveSupport::Deprecation.warn('something broke!')
  # # => "DEPRECATION WARNING: something broke! (called from your_code.rb:1)"
  def warn(message = T.unsafe(nil), callstack = T.unsafe(nil)); end

  private

  def _extract_callstack(callstack); end

  # Outputs a deprecation warning message
  #
  # deprecated_method_warning(:method_name)
  # # => "method_name is deprecated and will be removed from Rails #{deprecation_horizon}"
  # deprecated_method_warning(:method_name, :another_method)
  # # => "method_name is deprecated and will be removed from Rails #{deprecation_horizon} (use another_method instead)"
  # deprecated_method_warning(:method_name, "Optional message")
  # # => "method_name is deprecated and will be removed from Rails #{deprecation_horizon} (Optional message)"
  def deprecated_method_warning(method_name, message = T.unsafe(nil)); end

  def deprecation_caller_message(callstack); end
  def deprecation_message(callstack, message = T.unsafe(nil)); end
  def extract_callstack(callstack); end
  def ignored_callstack(path); end
end

ActiveSupport::Deprecation::Reporting::RAILS_GEM_ROOT =
  T.let(T.unsafe(nil), String)

# Raised when <tt>ActiveSupport::Deprecation::Behavior#behavior</tt> is set with <tt>:raise</tt>.
# You would set <tt>:raise</tt>, as a behavior to raise errors and proactively report exceptions from deprecations.
class ActiveSupport::DeprecationException < ::StandardError
end

# This module provides an internal implementation to track descendants
# which is faster than iterating through ObjectSpace.
module ActiveSupport::DescendantsTracker
  def descendants; end
  def direct_descendants; end
  def inherited(base); end
  def subclasses; end

  class << self
    def clear(classes); end
    def descendants(klass); end
    def direct_descendants(klass); end
    def disable_clear!; end
    def native?; end

    # This is the only method that is not thread safe, but is only ever called
    # during the eager loading phase.
    def store_inherited(klass, descendant); end

    def subclasses(klass); end

    private

    def accumulate_descendants(klass, acc); end
  end
end

# DescendantsArray is an array that contains weak references to classes.
class ActiveSupport::DescendantsTracker::DescendantsArray
  include ::Enumerable

  def initialize; end

  def <<(klass); end
  def cleanup!; end
  def each; end
  def refs_size; end
  def reject!; end

  private

  def initialize_copy(orig); end
end

class ActiveSupport::Digest
  class << self
    def hash_digest_class; end
    def hash_digest_class=(klass); end
    def hexdigest(arg); end
  end
end

# Provides accurate date and time measurements using Date#advance and
# Time#advance, respectively. It mainly supports the methods on Numeric.
#
# 1.month.ago       # equivalent to Time.now.advance(months: -1)
class ActiveSupport::Duration
  def initialize(value, parts, variable = T.unsafe(nil)); end

  # Returns the modulo of this Duration by another Duration or Numeric.
  # Numeric values are treated as seconds.
  def %(other); end

  # Multiplies this Duration by a Numeric and returns a new Duration.
  def *(other); end

  # Adds another Duration or a Numeric to this Duration. Numeric values
  # are treated as seconds.
  def +(other); end

  def +@; end

  # Subtracts another Duration or a Numeric from this Duration. Numeric
  # values are treated as seconds.
  def -(other); end

  def -@; end

  # Divides this Duration by a Numeric and returns a new Duration.
  def /(other); end

  # Compares one Duration with another or a Numeric to this Duration.
  # Numeric values are treated as seconds.
  def <=>(other); end

  # Returns +true+ if +other+ is also a Duration instance with the
  # same +value+, or if <tt>other == value</tt>.
  def ==(other); end

  def _parts; end

  # Calculates a new Time or Date that is as far in the future
  # as this Duration represents.
  def after(time = T.unsafe(nil)); end

  # Calculates a new Time or Date that is as far in the past
  # as this Duration represents.
  def ago(time = T.unsafe(nil)); end

  def as_json(options = T.unsafe(nil)); end

  # Calculates a new Time or Date that is as far in the past
  # as this Duration represents.
  def before(time = T.unsafe(nil)); end

  def coerce(other); end
  def encode_with(coder); end

  # Returns +true+ if +other+ is also a Duration instance, which has the
  # same parts as this one.
  def eql?(other); end

  # Calculates a new Time or Date that is as far in the future
  # as this Duration represents.
  def from_now(time = T.unsafe(nil)); end

  def hash; end

  # Returns the amount of days a duration covers as a float
  #
  # 12.hours.in_days # => 0.5
  def in_days; end

  # Returns the amount of hours a duration covers as a float
  #
  # 1.day.in_hours # => 24.0
  def in_hours; end

  # Returns the amount of minutes a duration covers as a float
  #
  # 1.day.in_minutes # => 1440.0
  def in_minutes; end

  # Returns the amount of months a duration covers as a float
  #
  # 9.weeks.in_months # => 2.07
  def in_months; end

  # Returns the number of seconds that this Duration represents.
  #
  # 1.minute.to_i   # => 60
  # 1.hour.to_i     # => 3600
  # 1.day.to_i      # => 86400
  #
  # Note that this conversion makes some assumptions about the
  # duration of some periods, e.g. months are always 1/12 of year
  # and years are 365.2425 days:
  #
  # # equivalent to (1.year / 12).to_i
  # 1.month.to_i    # => 2629746
  #
  # # equivalent to 365.2425.days.to_i
  # 1.year.to_i     # => 31556952
  #
  # In such cases, Ruby's core
  # Date[https://ruby-doc.org/stdlib/libdoc/date/rdoc/Date.html] and
  # Time[https://ruby-doc.org/stdlib/libdoc/time/rdoc/Time.html] should be used for precision
  # date and time arithmetic.
  def in_seconds; end

  # Returns the amount of weeks a duration covers as a float
  #
  # 2.months.in_weeks # => 8.696
  def in_weeks; end

  # Returns the amount of years a duration covers as a float
  #
  # 30.days.in_years # => 0.082
  def in_years; end

  def init_with(coder); end
  def inspect; end
  def instance_of?(klass); end
  def is_a?(klass); end

  # Build ISO 8601 Duration string for this duration.
  # The +precision+ parameter can be used to limit seconds' precision of duration.
  def iso8601(precision: T.unsafe(nil)); end

  def kind_of?(klass); end

  # Returns a copy of the parts hash that defines the duration
  def parts; end

  # Calculates a new Time or Date that is as far in the future
  # as this Duration represents.
  def since(time = T.unsafe(nil)); end

  # Returns the number of seconds that this Duration represents.
  #
  # 1.minute.to_i   # => 60
  # 1.hour.to_i     # => 3600
  # 1.day.to_i      # => 86400
  #
  # Note that this conversion makes some assumptions about the
  # duration of some periods, e.g. months are always 1/12 of year
  # and years are 365.2425 days:
  #
  # # equivalent to (1.year / 12).to_i
  # 1.month.to_i    # => 2629746
  #
  # # equivalent to 365.2425.days.to_i
  # 1.year.to_i     # => 31556952
  #
  # In such cases, Ruby's core
  # Date[https://ruby-doc.org/stdlib/libdoc/date/rdoc/Date.html] and
  # Time[https://ruby-doc.org/stdlib/libdoc/time/rdoc/Time.html] should be used for precision
  # date and time arithmetic.
  def to_i; end

  # Returns the amount of seconds a duration covers as a string.
  # For more information check to_i method.
  #
  # 1.day.to_s # => "86400"
  def to_s; end

  # Calculates a new Time or Date that is as far in the past
  # as this Duration represents.
  def until(time = T.unsafe(nil)); end

  # Returns the value of attribute value.
  def value; end

  def variable?; end

  private

  def method_missing(method, *args, &block); end
  def raise_type_error(other); end
  def respond_to_missing?(method, _); end
  def sum(sign, time = T.unsafe(nil)); end

  class << self
    def ===(other); end

    # Creates a new Duration from a seconds value that is converted
    # to the individual parts:
    #
    # ActiveSupport::Duration.build(31556952).parts # => {:years=>1}
    # ActiveSupport::Duration.build(2716146).parts  # => {:months=>1, :days=>1}
    def build(value); end

    def days(value); end
    def hours(value); end
    def minutes(value); end
    def months(value); end

    # Creates a new Duration from string formatted according to ISO 8601 Duration.
    #
    # See {ISO 8601}[https://en.wikipedia.org/wiki/ISO_8601#Durations] for more information.
    # This method allows negative parts to be present in pattern.
    # If invalid string is provided, it will raise +ActiveSupport::Duration::ISO8601Parser::ParsingError+.
    def parse(iso8601duration); end

    def seconds(value); end
    def weeks(value); end
    def years(value); end

    private

    def calculate_total_seconds(parts); end
  end
end

# Parses a string formatted according to ISO 8601 Duration into the hash.
#
# See {ISO 8601}[https://en.wikipedia.org/wiki/ISO_8601#Durations] for more information.
#
# This parser allows negative parts to be present in pattern.
class ActiveSupport::Duration::ISO8601Parser
  def initialize(string); end

  # Returns the value of attribute mode.
  def mode; end

  # Sets the attribute mode
  def mode=(_arg0); end

  def parse!; end

  # Returns the value of attribute parts.
  def parts; end

  # Returns the value of attribute scanner.
  def scanner; end

  # Returns the value of attribute sign.
  def sign; end

  # Sets the attribute sign
  def sign=(_arg0); end

  private

  def finished?; end

  # Parses number which can be a float with either comma or period.
  def number; end

  def raise_parsing_error(reason = T.unsafe(nil)); end
  def scan(pattern); end

  # Checks for various semantic errors as stated in ISO 8601 standard.
  def validate!; end
end

ActiveSupport::Duration::ISO8601Parser::COMMA = T.let(T.unsafe(nil), String)
ActiveSupport::Duration::ISO8601Parser::DATE_COMPONENT =
  T.let(T.unsafe(nil), Regexp)
ActiveSupport::Duration::ISO8601Parser::DATE_COMPONENTS =
  T.let(T.unsafe(nil), Array)
ActiveSupport::Duration::ISO8601Parser::DATE_MARKER =
  T.let(T.unsafe(nil), Regexp)
ActiveSupport::Duration::ISO8601Parser::DATE_TO_PART =
  T.let(T.unsafe(nil), Hash)
ActiveSupport::Duration::ISO8601Parser::PERIOD = T.let(T.unsafe(nil), String)
ActiveSupport::Duration::ISO8601Parser::PERIOD_OR_COMMA =
  T.let(T.unsafe(nil), Regexp)
class ActiveSupport::Duration::ISO8601Parser::ParsingError < ::ArgumentError
end
ActiveSupport::Duration::ISO8601Parser::SIGN_MARKER =
  T.let(T.unsafe(nil), Regexp)
ActiveSupport::Duration::ISO8601Parser::TIME_COMPONENT =
  T.let(T.unsafe(nil), Regexp)
ActiveSupport::Duration::ISO8601Parser::TIME_COMPONENTS =
  T.let(T.unsafe(nil), Array)
ActiveSupport::Duration::ISO8601Parser::TIME_MARKER =
  T.let(T.unsafe(nil), Regexp)
ActiveSupport::Duration::ISO8601Parser::TIME_TO_PART =
  T.let(T.unsafe(nil), Hash)

# Serializes duration to string according to ISO 8601 Duration format.
class ActiveSupport::Duration::ISO8601Serializer
  def initialize(duration, precision: T.unsafe(nil)); end

  # Builds and returns output string.
  def serialize; end

  private

  def format_seconds(seconds); end

  # Return pair of duration's parts and whole duration sign.
  # Parts are summarized (as they can become repetitive due to addition, etc).
  # Zero parts are removed as not significant.
  # If all parts are negative it will negate all of them and return minus as a sign.
  def normalize; end

  def week_mixed_with_date?(parts); end
end

ActiveSupport::Duration::ISO8601Serializer::DATE_COMPONENTS =
  T.let(T.unsafe(nil), Array)
ActiveSupport::Duration::PARTS = T.let(T.unsafe(nil), Array)
ActiveSupport::Duration::PARTS_IN_SECONDS = T.let(T.unsafe(nil), Hash)
ActiveSupport::Duration::SECONDS_PER_DAY = T.let(T.unsafe(nil), Integer)
ActiveSupport::Duration::SECONDS_PER_HOUR = T.let(T.unsafe(nil), Integer)
ActiveSupport::Duration::SECONDS_PER_MINUTE = T.let(T.unsafe(nil), Integer)

# 1/12 of a gregorian year
ActiveSupport::Duration::SECONDS_PER_MONTH = T.let(T.unsafe(nil), Integer)

ActiveSupport::Duration::SECONDS_PER_WEEK = T.let(T.unsafe(nil), Integer)

# length of a gregorian year (365.2425 days)
ActiveSupport::Duration::SECONDS_PER_YEAR = T.let(T.unsafe(nil), Integer)

class ActiveSupport::Duration::Scalar < ::Numeric
  def initialize(value); end

  def %(other); end
  def *(other); end
  def +(other); end
  def -(other); end
  def -@; end
  def /(other); end
  def <=>(other); end
  def coerce(other); end
  def to_f(*_arg0, &_arg1); end
  def to_i(*_arg0, &_arg1); end
  def to_s(*_arg0, &_arg1); end

  # Returns the value of attribute value.
  def value; end

  def variable?; end

  private

  def calculate(op, other); end
  def raise_type_error(other); end
end

ActiveSupport::Duration::VARIABLE_PARTS = T.let(T.unsafe(nil), Array)

module ActiveSupport::EachTimeWithZone
  def each(&block); end
  def step(n = T.unsafe(nil), &block); end

  private

  def ensure_iteration_allowed; end
end

class ActiveSupport::EncryptedConfiguration < ::ActiveSupport::EncryptedFile
  def initialize(config_path:, key_path:, env_key:, raise_if_missing_key:); end

  def [](*_arg0, &_arg1); end
  def config; end
  def fetch(*_arg0, &_arg1); end
  def method_missing(method, *args, &block); end

  # Allow a config to be started without a file present
  def read; end

  def write(contents); end

  private

  def deep_transform(hash); end
  def deserialize(config); end
  def options; end
  def respond_to_missing?(name, include_private = T.unsafe(nil)); end
end

class ActiveSupport::EncryptedFile
  def initialize(content_path:, key_path:, env_key:, raise_if_missing_key:); end

  def change(&block); end

  # Returns the value of attribute content_path.
  def content_path; end

  # Returns the value of attribute env_key.
  def env_key; end

  def key; end

  # Returns the value of attribute key_path.
  def key_path; end

  # Returns the value of attribute raise_if_missing_key.
  def raise_if_missing_key; end

  def read; end
  def write(contents); end

  private

  def check_key_length; end
  def decrypt(contents); end
  def encrypt(contents); end
  def encryptor; end
  def handle_missing_key; end
  def read_env_key; end
  def read_key_file; end
  def writing(contents); end

  class << self
    def expected_key_length; end
    def generate_key; end
  end
end

ActiveSupport::EncryptedFile::CIPHER = T.let(T.unsafe(nil), String)

class ActiveSupport::EncryptedFile::InvalidKeyLengthError < ::RuntimeError
  def initialize; end
end

class ActiveSupport::EncryptedFile::MissingContentError < ::RuntimeError
  def initialize(content_path); end
end

class ActiveSupport::EncryptedFile::MissingKeyError < ::RuntimeError
  def initialize(key_path:, env_key:); end
end

class ActiveSupport::EnvironmentInquirer < ::ActiveSupport::StringInquirer
  def initialize(env); end

  def development?; end
  def production?; end
  def test?; end
end

ActiveSupport::EnvironmentInquirer::DEFAULT_ENVIRONMENTS =
  T.let(T.unsafe(nil), Array)

# +ActiveSupport::ErrorReporter+ is a common interface for error reporting services.
#
# To rescue and report any unhandled error, you can use the +handle+ method:
#
# Rails.error.handle do
# do_something!
# end
#
# If an error is raised, it will be reported and swallowed.
#
# Alternatively if you want to report the error but not swallow it, you can use +record+
#
# Rails.error.record do
# do_something!
# end
#
# Both methods can be restricted to only handle a specific exception class
#
# maybe_tags = Rails.error.handle(Redis::BaseError) { redis.get("tags") }
#
# You can also pass some extra context information that may be used by the error subscribers:
#
# Rails.error.handle(context: { section: "admin" }) do
# # ...
# end
#
# Additionally a +severity+ can be passed along to communicate how important the error report is.
# +severity+ can be one of +:error+, +:warning+ or +:info+. Handled errors default to the +:warning+
# severity, and unhandled ones to +error+.
#
# Both +handle+ and +record+ pass through the return value from the block. In the case of +handle+
# rescuing an error, a fallback can be provided. The fallback must be a callable whose result will
# be returned when the block raises and is handled:
#
# user = Rails.error.handle(fallback: -> { User.anonymous }) do
# User.find_by(params)
# end
class ActiveSupport::ErrorReporter
  def initialize(*subscribers, logger: T.unsafe(nil)); end

  # Report any unhandled exception, and swallow it.
  #
  # Rails.error.handle do
  # 1 + '1'
  # end
  def handle(
    error_class = T.unsafe(nil),
    severity: T.unsafe(nil),
    context: T.unsafe(nil),
    fallback: T.unsafe(nil)
  ); end

  # Returns the value of attribute logger.
  def logger; end

  # Sets the attribute logger
  def logger=(_arg0); end

  def record(
    error_class = T.unsafe(nil),
    severity: T.unsafe(nil),
    context: T.unsafe(nil)
  ); end

  # When the block based +handle+ and +record+ methods are not suitable, you can directly use +report+
  #
  # Rails.error.report(error, handled: true)
  def report(
    error,
    handled:,
    severity: T.unsafe(nil),
    context: T.unsafe(nil)
  ); end

  # Update the execution context that is accessible to error subscribers
  #
  # Rails.error.set_context(section: "checkout", user_id: @user.id)
  #
  # See +ActiveSupport::ExecutionContext.set+
  def set_context(*_arg0, &_arg1); end

  # Register a new error subscriber. The subscriber must respond to
  #
  # report(Exception, handled: Boolean, context: Hash)
  #
  # The +report+ method +should+ never raise an error.
  def subscribe(subscriber); end
end

ActiveSupport::ErrorReporter::SEVERITIES = T.let(T.unsafe(nil), Array)

module ActiveSupport::ExecutionContext
  class << self
    def []=(key, value); end
    def after_change(&block); end
    def clear; end

    # Updates the execution context. If a block is given, it resets the provided keys to their
    # previous value once the block exits.
    def set(**options); end

    def to_h; end

    private

    def store; end
  end
end

class ActiveSupport::ExecutionWrapper
  include ::ActiveSupport::Callbacks
  extend ::ActiveSupport::Callbacks::ClassMethods
  extend ::ActiveSupport::DescendantsTracker

  def __callbacks; end
  def __callbacks?; end
  def _complete_callbacks; end
  def _run_callbacks; end
  def _run_complete_callbacks(&block); end
  def _run_run_callbacks(&block); end
  def complete; end

  # Complete this in-flight execution. This method *must* be called
  # exactly once on the result of any call to +run!+.
  #
  # Where possible, prefer +wrap+.
  def complete!; end

  def run; end
  def run!; end

  private

  def hook_state; end

  class << self
    def __callbacks; end
    def __callbacks=(value); end
    def __callbacks?; end
    def _complete_callbacks; end
    def _complete_callbacks=(value); end
    def _run_callbacks; end
    def _run_callbacks=(value); end

    # Returns the value of attribute active.
    def active; end

    # Sets the attribute active
    def active=(_arg0); end

    def active?; end
    def error_reporter; end
    def inherited(other); end
    def perform; end

    # Register an object to be invoked during both the +run+ and
    # +complete+ steps.
    #
    # +hook.complete+ will be passed the value returned from +hook.run+,
    # and will only be invoked if +run+ has previously been called.
    # (Mostly, this means it won't be invoked if an exception occurs in
    # a preceding +to_run+ block; all ordinary +to_complete+ blocks are
    # invoked in that situation.)
    def register_hook(hook, outer: T.unsafe(nil)); end

    # Run this execution.
    #
    # Returns an instance, whose +complete!+ method *must* be invoked
    # after the work has been performed.
    #
    # Where possible, prefer +wrap+.
    def run!; end

    def to_complete(*args, &block); end
    def to_run(*args, &block); end

    # Perform the work in the supplied block as an execution.
    def wrap; end
  end
end

class ActiveSupport::ExecutionWrapper::CompleteHook < ::Struct
  def after(target); end
  def before(target); end

  # Returns the value of attribute hook
  def hook; end

  # Sets the attribute hook
  def hook=(_); end

  class << self
    def [](*_arg0); end
    def inspect; end
    def members; end
    def new(*_arg0); end
  end
end

ActiveSupport::ExecutionWrapper::Null = T.let(T.unsafe(nil), Object)

class ActiveSupport::ExecutionWrapper::RunHook < ::Struct
  def before(target); end

  # Returns the value of attribute hook
  def hook; end

  # Sets the attribute hook
  def hook=(_); end

  class << self
    def [](*_arg0); end
    def inspect; end
    def members; end
    def new(*_arg0); end
  end
end

class ActiveSupport::Executor < ::ActiveSupport::ExecutionWrapper
end

# FileUpdateChecker specifies the API used by Rails to watch files
# and control reloading. The API depends on four methods:
#
# * +initialize+ which expects two parameters and one block as
# described below.
#
# * +updated?+ which returns a boolean if there were updates in
# the filesystem or not.
#
# * +execute+ which executes the given block on initialization
# and updates the latest watched files and timestamp.
#
# * +execute_if_updated+ which just executes the block if it was updated.
#
# After initialization, a call to +execute_if_updated+ must execute
# the block only if there was really a change in the filesystem.
#
# This class is used by Rails to reload the I18n framework whenever
# they are changed upon a new request.
#
# i18n_reloader = ActiveSupport::FileUpdateChecker.new(paths) do
# I18n.reload!
# end
#
# ActiveSupport::Reloader.to_prepare do
# i18n_reloader.execute_if_updated
# end
class ActiveSupport::FileUpdateChecker
  # It accepts two parameters on initialization. The first is an array
  # of files and the second is an optional hash of directories. The hash must
  # have directories as keys and the value is an array of extensions to be
  # watched under that directory.
  #
  # This method must also receive a block that will be called once a path
  # changes. The array of files and list of directories cannot be changed
  # after FileUpdateChecker has been initialized.
  def initialize(files, dirs = T.unsafe(nil), &block); end

  # Executes the given block and updates the latest watched files and
  # timestamp.
  def execute; end

  # Execute the block given if updated.
  def execute_if_updated; end

  # Check if any of the entries were updated. If so, the watched and/or
  # updated_at values are cached until the block is executed via +execute+
  # or +execute_if_updated+.
  def updated?; end

  private

  def compile_ext(array); end
  def compile_glob(hash); end
  def escape(key); end

  # This method returns the maximum mtime of the files in +paths+, or +nil+
  # if the array is empty.
  #
  # Files with a mtime in the future are ignored. Such abnormal situation
  # can happen for example if the user changes the clock by hand. It is
  # healthy to consider this edge case because with mtimes in the future
  # reloading is not triggered.
  def max_mtime(paths); end

  def updated_at(paths); end
  def watched; end
end

module ActiveSupport::ForkTracker
  class << self
    def after_fork(&block); end
    def check!; end
    def hook!; end
    def unregister(callback); end
  end
end

module ActiveSupport::ForkTracker::CoreExt
  def fork(*_arg0, &_arg1); end
end

module ActiveSupport::ForkTracker::CoreExtPrivate
end

module ActiveSupport::ForkTracker::ModernCoreExt
  def _fork; end
end

# A convenient wrapper for the zlib standard library that allows
# compression/decompression of strings with gzip.
#
# gzip = ActiveSupport::Gzip.compress('compress me!')
# # => "\x1F\x8B\b\x00o\x8D\xCDO\x00\x03K\xCE\xCF-(J-.V\xC8MU\x04\x00R>n\x83\f\x00\x00\x00"
#
# ActiveSupport::Gzip.decompress(gzip)
# # => "compress me!"
module ActiveSupport::Gzip
  class << self
    # Compresses a string using gzip.
    def compress(source, level = T.unsafe(nil), strategy = T.unsafe(nil)); end

    # Decompresses a gzipped string.
    def decompress(source); end
  end
end

class ActiveSupport::Gzip::Stream < ::StringIO
  def initialize(*_arg0); end

  def close; end
end

# Implements a hash where keys <tt>:foo</tt> and <tt>"foo"</tt> are considered
# to be the same.
#
# rgb = ActiveSupport::HashWithIndifferentAccess.new
#
# rgb[:black] = '#000000'
# rgb[:black]  # => '#000000'
# rgb['black'] # => '#000000'
#
# rgb['white'] = '#FFFFFF'
# rgb[:white]  # => '#FFFFFF'
# rgb['white'] # => '#FFFFFF'
#
# Internally symbols are mapped to strings when used as keys in the entire
# writing interface (calling <tt>[]=</tt>, <tt>merge</tt>, etc). This
# mapping belongs to the public interface. For example, given:
#
# hash = ActiveSupport::HashWithIndifferentAccess.new(a: 1)
#
# You are guaranteed that the key is returned as a string:
#
# hash.keys # => ["a"]
#
# Technically other types of keys are accepted:
#
# hash = ActiveSupport::HashWithIndifferentAccess.new(a: 1)
# hash[0] = 0
# hash # => {"a"=>1, 0=>0}
#
# but this class is intended for use cases where strings or symbols are the
# expected keys and it is convenient to understand both as the same. For
# example the +params+ hash in Ruby on Rails.
#
# Note that core extensions define <tt>Hash#with_indifferent_access</tt>:
#
# rgb = { black: '#000000', white: '#FFFFFF' }.with_indifferent_access
#
# which may be handy.
#
# To access this class outside of Rails, require the core extension with:
#
# require "active_support/core_ext/hash/indifferent_access"
#
# which will, in turn, require this file.
class ActiveSupport::HashWithIndifferentAccess < ::Hash
  def initialize(constructor = T.unsafe(nil)); end

  # Same as <tt>Hash#[]</tt> where the key passed as argument can be
  # either a string or a symbol:
  #
  # counters = ActiveSupport::HashWithIndifferentAccess.new
  # counters[:foo] = 1
  #
  # counters['foo'] # => 1
  # counters[:foo]  # => 1
  # counters[:zoo]  # => nil
  def [](key); end

  # Assigns a new value to the hash:
  #
  # hash = ActiveSupport::HashWithIndifferentAccess.new
  # hash[:key] = 'value'
  #
  # This value can be later fetched using either +:key+ or <tt>'key'</tt>.
  def []=(key, value); end

  # Same as <tt>Hash#assoc</tt> where the key passed as argument can be
  # either a string or a symbol:
  #
  # counters = ActiveSupport::HashWithIndifferentAccess.new
  # counters[:foo] = 1
  #
  # counters.assoc('foo') # => ["foo", 1]
  # counters.assoc(:foo)  # => ["foo", 1]
  # counters.assoc(:zoo)  # => nil
  def assoc(key); end

  def compact; end
  def deep_stringify_keys; end
  def deep_stringify_keys!; end
  def deep_symbolize_keys; end

  # Same as <tt>Hash#default</tt> where the key passed as argument can be
  # either a string or a symbol:
  #
  # hash = ActiveSupport::HashWithIndifferentAccess.new(1)
  # hash.default                   # => 1
  #
  # hash = ActiveSupport::HashWithIndifferentAccess.new { |hash, key| key }
  # hash.default                   # => nil
  # hash.default('foo')            # => 'foo'
  # hash.default(:foo)             # => 'foo'
  def default(*args); end

  # Removes the specified key from the hash.
  def delete(key); end

  # Same as <tt>Hash#dig</tt> where the key passed as argument can be
  # either a string or a symbol:
  #
  # counters = ActiveSupport::HashWithIndifferentAccess.new
  # counters[:foo] = { bar: 1 }
  #
  # counters.dig('foo', 'bar')     # => 1
  # counters.dig(:foo, :bar)       # => 1
  # counters.dig(:zoo)             # => nil
  def dig(*args); end

  # Returns a shallow copy of the hash.
  #
  # hash = ActiveSupport::HashWithIndifferentAccess.new({ a: { b: 'b' } })
  # dup  = hash.dup
  # dup[:a][:c] = 'c'
  #
  # hash[:a][:c] # => "c"
  # dup[:a][:c]  # => "c"
  def dup; end

  # Returns a hash with indifferent access that includes everything except given keys.
  # hash = { a: "x", b: "y", c: 10 }.with_indifferent_access
  # hash.except(:a, "b") # => {c: 10}.with_indifferent_access
  # hash                 # => { a: "x", b: "y", c: 10 }.with_indifferent_access
  def except(*keys); end

  # Returns +true+ so that <tt>Array#extract_options!</tt> finds members of
  # this class.
  def extractable_options?; end

  # Same as <tt>Hash#fetch</tt> where the key passed as argument can be
  # either a string or a symbol:
  #
  # counters = ActiveSupport::HashWithIndifferentAccess.new
  # counters[:foo] = 1
  #
  # counters.fetch('foo')          # => 1
  # counters.fetch(:bar, 0)        # => 0
  # counters.fetch(:bar) { |key| 0 } # => 0
  # counters.fetch(:zoo)           # => KeyError: key not found: "zoo"
  def fetch(key, *extras); end

  # Returns an array of the values at the specified indices, but also
  # raises an exception when one of the keys can't be found.
  #
  # hash = ActiveSupport::HashWithIndifferentAccess.new
  # hash[:a] = 'x'
  # hash[:b] = 'y'
  # hash.fetch_values('a', 'b') # => ["x", "y"]
  # hash.fetch_values('a', 'c') { |key| 'z' } # => ["x", "z"]
  # hash.fetch_values('a', 'c') # => KeyError: key not found: "c"
  def fetch_values(*indices, &block); end

  # Checks the hash for a key matching the argument passed in:
  #
  # hash = ActiveSupport::HashWithIndifferentAccess.new
  # hash['key'] = 'value'
  # hash.key?(:key)  # => true
  # hash.key?('key') # => true
  def has_key?(key); end

  # Checks the hash for a key matching the argument passed in:
  #
  # hash = ActiveSupport::HashWithIndifferentAccess.new
  # hash['key'] = 'value'
  # hash.key?(:key)  # => true
  # hash.key?('key') # => true
  def include?(key); end

  # Checks the hash for a key matching the argument passed in:
  #
  # hash = ActiveSupport::HashWithIndifferentAccess.new
  # hash['key'] = 'value'
  # hash.key?(:key)  # => true
  # hash.key?('key') # => true
  def key?(key); end

  # Checks the hash for a key matching the argument passed in:
  #
  # hash = ActiveSupport::HashWithIndifferentAccess.new
  # hash['key'] = 'value'
  # hash.key?(:key)  # => true
  # hash.key?('key') # => true
  def member?(key); end

  # This method has the same semantics of +update+, except it does not
  # modify the receiver but rather returns a new hash with indifferent
  # access with the result of the merge.
  def merge(*hashes, &block); end

  # Updates the receiver in-place, merging in the hashes passed as arguments:
  #
  # hash_1 = ActiveSupport::HashWithIndifferentAccess.new
  # hash_1[:key] = 'value'
  #
  # hash_2 = ActiveSupport::HashWithIndifferentAccess.new
  # hash_2[:key] = 'New Value!'
  #
  # hash_1.update(hash_2) # => {"key"=>"New Value!"}
  #
  # hash = ActiveSupport::HashWithIndifferentAccess.new
  # hash.update({ "a" => 1 }, { "b" => 2 }) # => { "a" => 1, "b" => 2 }
  #
  # The arguments can be either an
  # <tt>ActiveSupport::HashWithIndifferentAccess</tt> or a regular +Hash+.
  # In either case the merge respects the semantics of indifferent access.
  #
  # If the argument is a regular hash with keys +:key+ and <tt>"key"</tt> only one
  # of the values end up in the receiver, but which one is unspecified.
  #
  # When given a block, the value for duplicated keys will be determined
  # by the result of invoking the block with the duplicated key, the value
  # in the receiver, and the value in +other_hash+. The rules for duplicated
  # keys follow the semantics of indifferent access:
  #
  # hash_1[:key] = 10
  # hash_2['key'] = 12
  # hash_1.update(hash_2) { |key, old, new| old + new } # => {"key"=>22}
  def merge!(*other_hashes, &block); end

  def nested_under_indifferent_access; end
  def regular_update(*_arg0); end
  def regular_writer(_arg0, _arg1); end
  def reject(*args, &block); end

  # Replaces the contents of this hash with other_hash.
  #
  # h = { "a" => 100, "b" => 200 }
  # h.replace({ "c" => 300, "d" => 400 }) # => {"c"=>300, "d"=>400}
  def replace(other_hash); end

  # Like +merge+ but the other way around: Merges the receiver into the
  # argument and returns a new hash with indifferent access as result:
  #
  # hash = ActiveSupport::HashWithIndifferentAccess.new
  # hash['a'] = nil
  # hash.reverse_merge(a: 0, b: 1) # => {"a"=>nil, "b"=>1}
  def reverse_merge(other_hash); end

  # Same semantics as +reverse_merge+ but modifies the receiver in-place.
  def reverse_merge!(other_hash); end

  def select(*args, &block); end
  def slice(*keys); end
  def slice!(*keys); end

  # Assigns a new value to the hash:
  #
  # hash = ActiveSupport::HashWithIndifferentAccess.new
  # hash[:key] = 'value'
  #
  # This value can be later fetched using either +:key+ or <tt>'key'</tt>.
  def store(key, value); end

  def stringify_keys; end
  def stringify_keys!; end
  def symbolize_keys; end

  # Convert to a regular hash with string keys.
  def to_hash; end

  def to_options; end
  def to_options!; end
  def transform_keys(*args, &block); end
  def transform_keys!; end
  def transform_values(*args, &block); end

  # Updates the receiver in-place, merging in the hashes passed as arguments:
  #
  # hash_1 = ActiveSupport::HashWithIndifferentAccess.new
  # hash_1[:key] = 'value'
  #
  # hash_2 = ActiveSupport::HashWithIndifferentAccess.new
  # hash_2[:key] = 'New Value!'
  #
  # hash_1.update(hash_2) # => {"key"=>"New Value!"}
  #
  # hash = ActiveSupport::HashWithIndifferentAccess.new
  # hash.update({ "a" => 1 }, { "b" => 2 }) # => { "a" => 1, "b" => 2 }
  #
  # The arguments can be either an
  # <tt>ActiveSupport::HashWithIndifferentAccess</tt> or a regular +Hash+.
  # In either case the merge respects the semantics of indifferent access.
  #
  # If the argument is a regular hash with keys +:key+ and <tt>"key"</tt> only one
  # of the values end up in the receiver, but which one is unspecified.
  #
  # When given a block, the value for duplicated keys will be determined
  # by the result of invoking the block with the duplicated key, the value
  # in the receiver, and the value in +other_hash+. The rules for duplicated
  # keys follow the semantics of indifferent access:
  #
  # hash_1[:key] = 10
  # hash_2['key'] = 12
  # hash_1.update(hash_2) { |key, old, new| old + new } # => {"key"=>22}
  def update(*other_hashes, &block); end

  # Returns an array of the values at the specified indices:
  #
  # hash = ActiveSupport::HashWithIndifferentAccess.new
  # hash[:a] = 'x'
  # hash[:b] = 'y'
  # hash.values_at('a', 'b') # => ["x", "y"]
  def values_at(*keys); end

  # Like +merge+ but the other way around: Merges the receiver into the
  # argument and returns a new hash with indifferent access as result:
  #
  # hash = ActiveSupport::HashWithIndifferentAccess.new
  # hash['a'] = nil
  # hash.reverse_merge(a: 0, b: 1) # => {"a"=>nil, "b"=>1}
  def with_defaults(other_hash); end

  # Same semantics as +reverse_merge+ but modifies the receiver in-place.
  def with_defaults!(other_hash); end

  def with_indifferent_access; end

  # Returns a hash with indifferent access that includes everything except given keys.
  # hash = { a: "x", b: "y", c: 10 }.with_indifferent_access
  # hash.except(:a, "b") # => {c: 10}.with_indifferent_access
  # hash                 # => { a: "x", b: "y", c: 10 }.with_indifferent_access
  def without(*keys); end

  private

  def convert_key(key); end
  def convert_value(value, conversion: T.unsafe(nil)); end
  def set_defaults(target); end
  def update_with_single_argument(other_hash, block); end

  class << self
    def [](*args); end
  end
end

module ActiveSupport::HtmlSafeTranslation
  extend ::ActiveSupport::HtmlSafeTranslation

  def translate(key, **options); end

  private

  def html_escape_translation_options(options); end
  def html_safe_translation(translation); end
  def html_safe_translation_key?(key); end
  def i18n_option?(name); end
end

# The Inflector transforms words from singular to plural, class names to table
# names, modularized class names to ones without, and class names to foreign
# keys. The default inflections for pluralization, singularization, and
# uncountable words are kept in inflections.rb.
#
# The Rails core team has stated patches for the inflections library will not
# be accepted in order to avoid breaking legacy applications which may be
# relying on errant inflections. If you discover an incorrect inflection and
# require it for your application or wish to define rules for languages other
# than English, please correct or add them yourself (explained below).
module ActiveSupport::Inflector
  extend ::ActiveSupport::Inflector

  # Converts strings to UpperCamelCase.
  # If the +uppercase_first_letter+ parameter is set to false, then produces
  # lowerCamelCase.
  #
  # Also converts '/' to '::' which is useful for converting
  # paths to namespaces.
  #
  # camelize('active_model')                # => "ActiveModel"
  # camelize('active_model', false)         # => "activeModel"
  # camelize('active_model/errors')         # => "ActiveModel::Errors"
  # camelize('active_model/errors', false)  # => "activeModel::Errors"
  #
  # As a rule of thumb you can think of +camelize+ as the inverse of
  # #underscore, though there are cases where that does not hold:
  #
  # camelize(underscore('SSLError'))        # => "SslError"
  def camelize(term, uppercase_first_letter = T.unsafe(nil)); end

  # Creates a class name from a plural table name like Rails does for table
  # names to models. Note that this returns a string and not a Class (To
  # convert to an actual class follow +classify+ with #constantize).
  #
  # classify('ham_and_eggs') # => "HamAndEgg"
  # classify('posts')        # => "Post"
  #
  # Singular names are not handled correctly:
  #
  # classify('calculus')     # => "Calculu"
  def classify(table_name); end

  # Tries to find a constant with the name specified in the argument string.
  #
  # constantize('Module')   # => Module
  # constantize('Foo::Bar') # => Foo::Bar
  #
  # The name is assumed to be the one of a top-level constant, no matter
  # whether it starts with "::" or not. No lexical context is taken into
  # account:
  #
  # C = 'outside'
  # module M
  # C = 'inside'
  # C                # => 'inside'
  # constantize('C') # => 'outside', same as ::C
  # end
  #
  # NameError is raised when the name is not in CamelCase or the constant is
  # unknown.
  def constantize(camel_cased_word); end

  # Replaces underscores with dashes in the string.
  #
  # dasherize('puni_puni') # => "puni-puni"
  def dasherize(underscored_word); end

  # Removes the rightmost segment from the constant expression in the string.
  #
  # deconstantize('Net::HTTP')   # => "Net"
  # deconstantize('::Net::HTTP') # => "::Net"
  # deconstantize('String')      # => ""
  # deconstantize('::String')    # => ""
  # deconstantize('')            # => ""
  #
  # See also #demodulize.
  def deconstantize(path); end

  # Removes the module part from the expression in the string.
  #
  # demodulize('ActiveSupport::Inflector::Inflections') # => "Inflections"
  # demodulize('Inflections')                           # => "Inflections"
  # demodulize('::Inflections')                         # => "Inflections"
  # demodulize('')                                      # => ""
  #
  # See also #deconstantize.
  def demodulize(path); end

  # Creates a foreign key name from a class name.
  # +separate_class_name_and_id_with_underscore+ sets whether
  # the method should put '_' between the name and 'id'.
  #
  # foreign_key('Message')        # => "message_id"
  # foreign_key('Message', false) # => "messageid"
  # foreign_key('Admin::Post')    # => "post_id"
  def foreign_key(
    class_name,
    separate_class_name_and_id_with_underscore = T.unsafe(nil)
  ); end

  # Tweaks an attribute name for display to end users.
  #
  # Specifically, performs these transformations:
  #
  # * Applies human inflection rules to the argument.
  # * Deletes leading underscores, if any.
  # * Removes an "_id" suffix if present.
  # * Replaces underscores with spaces, if any.
  # * Downcases all words except acronyms.
  # * Capitalizes the first word.
  # The capitalization of the first word can be turned off by setting the
  # +:capitalize+ option to false (default is true).
  #
  # The trailing '_id' can be kept and capitalized by setting the
  # optional parameter +keep_id_suffix+ to true (default is false).
  #
  # humanize('employee_salary')                  # => "Employee salary"
  # humanize('author_id')                        # => "Author"
  # humanize('author_id', capitalize: false)     # => "author"
  # humanize('_id')                              # => "Id"
  # humanize('author_id', keep_id_suffix: true)  # => "Author id"
  #
  # If "SSL" was defined to be an acronym:
  #
  # humanize('ssl_error') # => "SSL error"
  def humanize(
    lower_case_and_underscored_word,
    capitalize: T.unsafe(nil),
    keep_id_suffix: T.unsafe(nil)
  ); end

  # Yields a singleton instance of Inflector::Inflections so you can specify
  # additional inflector rules. If passed an optional locale, rules for other
  # languages can be specified. If not specified, defaults to <tt>:en</tt>.
  # Only rules for English are provided.
  #
  # ActiveSupport::Inflector.inflections(:en) do |inflect|
  # inflect.uncountable 'rails'
  # end
  def inflections(locale = T.unsafe(nil)); end

  # Returns the suffix that should be added to a number to denote the position
  # in an ordered sequence such as 1st, 2nd, 3rd, 4th.
  #
  # ordinal(1)     # => "st"
  # ordinal(2)     # => "nd"
  # ordinal(1002)  # => "nd"
  # ordinal(1003)  # => "rd"
  # ordinal(-11)   # => "th"
  # ordinal(-1021) # => "st"
  def ordinal(number); end

  # Turns a number into an ordinal string used to denote the position in an
  # ordered sequence such as 1st, 2nd, 3rd, 4th.
  #
  # ordinalize(1)     # => "1st"
  # ordinalize(2)     # => "2nd"
  # ordinalize(1002)  # => "1002nd"
  # ordinalize(1003)  # => "1003rd"
  # ordinalize(-11)   # => "-11th"
  # ordinalize(-1021) # => "-1021st"
  def ordinalize(number); end

  # Replaces special characters in a string so that it may be used as part of
  # a 'pretty' URL.
  #
  # parameterize("Donald E. Knuth") # => "donald-e-knuth"
  # parameterize("^très|Jolie-- ")  # => "tres-jolie"
  #
  # To use a custom separator, override the +separator+ argument.
  #
  # parameterize("Donald E. Knuth", separator: '_') # => "donald_e_knuth"
  # parameterize("^très|Jolie__ ", separator: '_')  # => "tres_jolie"
  #
  # To preserve the case of the characters in a string, use the +preserve_case+ argument.
  #
  # parameterize("Donald E. Knuth", preserve_case: true) # => "Donald-E-Knuth"
  # parameterize("^très|Jolie-- ", preserve_case: true) # => "tres-Jolie"
  #
  # It preserves dashes and underscores unless they are used as separators:
  #
  # parameterize("^très|Jolie__ ")                 # => "tres-jolie__"
  # parameterize("^très|Jolie-- ", separator: "_") # => "tres_jolie--"
  # parameterize("^très_Jolie-- ", separator: ".") # => "tres_jolie--"
  #
  # If the optional parameter +locale+ is specified,
  # the word will be parameterized as a word of that language.
  # By default, this parameter is set to <tt>nil</tt> and it will use
  # the configured <tt>I18n.locale</tt>.
  def parameterize(
    string,
    separator: T.unsafe(nil),
    preserve_case: T.unsafe(nil),
    locale: T.unsafe(nil)
  ); end

  # Returns the plural form of the word in the string.
  #
  # If passed an optional +locale+ parameter, the word will be
  # pluralized using rules defined for that language. By default,
  # this parameter is set to <tt>:en</tt>.
  #
  # pluralize('post')             # => "posts"
  # pluralize('octopus')          # => "octopi"
  # pluralize('sheep')            # => "sheep"
  # pluralize('words')            # => "words"
  # pluralize('CamelOctopus')     # => "CamelOctopi"
  # pluralize('ley', :es)         # => "leyes"
  def pluralize(word, locale = T.unsafe(nil)); end

  # Tries to find a constant with the name specified in the argument string.
  #
  # safe_constantize('Module')   # => Module
  # safe_constantize('Foo::Bar') # => Foo::Bar
  #
  # The name is assumed to be the one of a top-level constant, no matter
  # whether it starts with "::" or not. No lexical context is taken into
  # account:
  #
  # C = 'outside'
  # module M
  # C = 'inside'
  # C                     # => 'inside'
  # safe_constantize('C') # => 'outside', same as ::C
  # end
  #
  # +nil+ is returned when the name is not in CamelCase or the constant (or
  # part of it) is unknown.
  #
  # safe_constantize('blargle')                  # => nil
  # safe_constantize('UnknownModule')            # => nil
  # safe_constantize('UnknownModule::Foo::Bar')  # => nil
  def safe_constantize(camel_cased_word); end

  # The reverse of #pluralize, returns the singular form of a word in a
  # string.
  #
  # If passed an optional +locale+ parameter, the word will be
  # singularized using rules defined for that language. By default,
  # this parameter is set to <tt>:en</tt>.
  #
  # singularize('posts')            # => "post"
  # singularize('octopi')           # => "octopus"
  # singularize('sheep')            # => "sheep"
  # singularize('word')             # => "word"
  # singularize('CamelOctopi')      # => "CamelOctopus"
  # singularize('leyes', :es)       # => "ley"
  def singularize(word, locale = T.unsafe(nil)); end

  # Creates the name of a table like Rails does for models to table names.
  # This method uses the #pluralize method on the last word in the string.
  #
  # tableize('RawScaledScorer') # => "raw_scaled_scorers"
  # tableize('ham_and_egg')     # => "ham_and_eggs"
  # tableize('fancyCategory')   # => "fancy_categories"
  def tableize(class_name); end

  # Capitalizes all the words and replaces some characters in the string to
  # create a nicer looking title. +titleize+ is meant for creating pretty
  # output. It is not used in the Rails internals.
  #
  # The trailing '_id','Id'.. can be kept and capitalized by setting the
  # optional parameter +keep_id_suffix+ to true.
  # By default, this parameter is false.
  #
  # +titleize+ is also aliased as +titlecase+.
  #
  # titleize('man from the boondocks')                       # => "Man From The Boondocks"
  # titleize('x-men: the last stand')                        # => "X Men: The Last Stand"
  # titleize('TheManWithoutAPast')                           # => "The Man Without A Past"
  # titleize('raiders_of_the_lost_ark')                      # => "Raiders Of The Lost Ark"
  # titleize('string_ending_with_id', keep_id_suffix: true)  # => "String Ending With Id"
  def titleize(word, keep_id_suffix: T.unsafe(nil)); end

  # Replaces non-ASCII characters with an ASCII approximation, or if none
  # exists, a replacement character which defaults to "?".
  #
  # transliterate('Ærøskøbing')
  # # => "AEroskobing"
  #
  # Default approximations are provided for Western/Latin characters,
  # e.g, "ø", "ñ", "é", "ß", etc.
  #
  # This method is I18n aware, so you can set up custom approximations for a
  # locale. This can be useful, for example, to transliterate German's "ü"
  # and "ö" to "ue" and "oe", or to add support for transliterating Russian
  # to ASCII.
  #
  # In order to make your custom transliterations available, you must set
  # them as the <tt>i18n.transliterate.rule</tt> i18n key:
  #
  # # Store the transliterations in locales/de.yml
  # i18n:
  # transliterate:
  # rule:
  # ü: "ue"
  # ö: "oe"
  #
  # # Or set them using Ruby
  # I18n.backend.store_translations(:de, i18n: {
  # transliterate: {
  # rule: {
  # 'ü' => 'ue',
  # 'ö' => 'oe'
  # }
  # }
  # })
  #
  # The value for <tt>i18n.transliterate.rule</tt> can be a simple Hash that
  # maps characters to ASCII approximations as shown above, or, for more
  # complex requirements, a Proc:
  #
  # I18n.backend.store_translations(:de, i18n: {
  # transliterate: {
  # rule: ->(string) { MyTransliterator.transliterate(string) }
  # }
  # })
  #
  # Now you can have different transliterations for each locale:
  #
  # transliterate('Jürgen', locale: :en)
  # # => "Jurgen"
  #
  # transliterate('Jürgen', locale: :de)
  # # => "Juergen"
  #
  # Transliteration is restricted to UTF-8, US-ASCII and GB18030 strings
  # Other encodings will raise an ArgumentError.
  def transliterate(
    string,
    replacement = T.unsafe(nil),
    locale: T.unsafe(nil)
  ); end

  # Makes an underscored, lowercase form from the expression in the string.
  #
  # Changes '::' to '/' to convert namespaces to paths.
  #
  # underscore('ActiveModel')         # => "active_model"
  # underscore('ActiveModel::Errors') # => "active_model/errors"
  #
  # As a rule of thumb you can think of +underscore+ as the inverse of
  # #camelize, though there are cases where that does not hold:
  #
  # camelize(underscore('SSLError'))  # => "SslError"
  def underscore(camel_cased_word); end

  # Converts just the first character to uppercase.
  #
  # upcase_first('what a Lovely Day') # => "What a Lovely Day"
  # upcase_first('w')                 # => "W"
  # upcase_first('')                  # => ""
  def upcase_first(string); end

  private

  # Applies inflection rules for +singularize+ and +pluralize+.
  #
  # If passed an optional +locale+ parameter, the uncountables will be
  # found for that locale.
  #
  # apply_inflections('post', inflections.plurals, :en)    # => "posts"
  # apply_inflections('posts', inflections.singulars, :en) # => "post"
  def apply_inflections(word, rules, locale = T.unsafe(nil)); end

  # Mounts a regular expression, returned as a string to ease interpolation,
  # that will match part by part the given constant.
  #
  # const_regexp("Foo::Bar::Baz") # => "Foo(::Bar(::Baz)?)?"
  # const_regexp("::")            # => "::"
  def const_regexp(camel_cased_word); end
end

ActiveSupport::Inflector::ALLOWED_ENCODINGS_FOR_TRANSLITERATE =
  T.let(T.unsafe(nil), Array)

# A singleton instance of this class is yielded by Inflector.inflections,
# which can then be used to specify additional inflection rules. If passed
# an optional locale, rules for other languages can be specified. The
# default locale is <tt>:en</tt>. Only rules for English are provided.
#
# ActiveSupport::Inflector.inflections(:en) do |inflect|
# inflect.plural /^(ox)$/i, '\1\2en'
# inflect.singular /^(ox)en/i, '\1'
#
# inflect.irregular 'cactus', 'cacti'
#
# inflect.uncountable 'equipment'
# end
#
# New rules are added at the top. So in the example above, the irregular
# rule for cactus will now be the first of the pluralization and
# singularization rules that is runs. This guarantees that your rules run
# before any of the rules that may already have been loaded.
class ActiveSupport::Inflector::Inflections
  def initialize; end

  # Specifies a new acronym. An acronym must be specified as it will appear
  # in a camelized string. An underscore string that contains the acronym
  # will retain the acronym when passed to +camelize+, +humanize+, or
  # +titleize+. A camelized string that contains the acronym will maintain
  # the acronym when titleized or humanized, and will convert the acronym
  # into a non-delimited single lowercase word when passed to +underscore+.
  #
  # acronym 'HTML'
  # titleize 'html'     # => 'HTML'
  # camelize 'html'     # => 'HTML'
  # underscore 'MyHTML' # => 'my_html'
  #
  # The acronym, however, must occur as a delimited unit and not be part of
  # another word for conversions to recognize it:
  #
  # acronym 'HTTP'
  # camelize 'my_http_delimited' # => 'MyHTTPDelimited'
  # camelize 'https'             # => 'Https', not 'HTTPs'
  # underscore 'HTTPS'           # => 'http_s', not 'https'
  #
  # acronym 'HTTPS'
  # camelize 'https'   # => 'HTTPS'
  # underscore 'HTTPS' # => 'https'
  #
  # Note: Acronyms that are passed to +pluralize+ will no longer be
  # recognized, since the acronym will not occur as a delimited unit in the
  # pluralized result. To work around this, you must specify the pluralized
  # form as an acronym as well:
  #
  # acronym 'API'
  # camelize(pluralize('api')) # => 'Apis'
  #
  # acronym 'APIs'
  # camelize(pluralize('api')) # => 'APIs'
  #
  # +acronym+ may be used to specify any word that contains an acronym or
  # otherwise needs to maintain a non-standard capitalization. The only
  # restriction is that the word must begin with a capital letter.
  #
  # acronym 'RESTful'
  # underscore 'RESTful'           # => 'restful'
  # underscore 'RESTfulController' # => 'restful_controller'
  # titleize 'RESTfulController'   # => 'RESTful Controller'
  # camelize 'restful'             # => 'RESTful'
  # camelize 'restful_controller'  # => 'RESTfulController'
  #
  # acronym 'McDonald'
  # underscore 'McDonald' # => 'mcdonald'
  # camelize 'mcdonald'   # => 'McDonald'
  def acronym(word); end

  # Returns the value of attribute acronyms.
  def acronyms; end

  def acronyms_camelize_regex; end
  def acronyms_underscore_regex; end

  # Clears the loaded inflections within a given scope (default is
  # <tt>:all</tt>). Give the scope as a symbol of the inflection type, the
  # options are: <tt>:plurals</tt>, <tt>:singulars</tt>, <tt>:uncountables</tt>,
  # <tt>:humans</tt>, <tt>:acronyms</tt>.
  #
  # clear :all
  # clear :plurals
  def clear(scope = T.unsafe(nil)); end

  # Specifies a humanized form of a string by a regular expression rule or
  # by a string mapping. When using a regular expression based replacement,
  # the normal humanize formatting is called after the replacement. When a
  # string is used, the human form should be specified as desired (example:
  # 'The name', not 'the_name').
  #
  # human /_cnt$/i, '\1_count'
  # human 'legacy_col_person_name', 'Name'
  def human(rule, replacement); end

  # Returns the value of attribute humans.
  def humans; end

  # Specifies a new irregular that applies to both pluralization and
  # singularization at the same time. This can only be used for strings, not
  # regular expressions. You simply pass the irregular in singular and
  # plural form.
  #
  # irregular 'cactus', 'cacti'
  # irregular 'person', 'people'
  def irregular(singular, plural); end

  # Specifies a new pluralization rule and its replacement. The rule can
  # either be a string or a regular expression. The replacement should
  # always be a string that may include references to the matched data from
  # the rule.
  def plural(rule, replacement); end

  # Returns the value of attribute plurals.
  def plurals; end

  # Specifies a new singularization rule and its replacement. The rule can
  # either be a string or a regular expression. The replacement should
  # always be a string that may include references to the matched data from
  # the rule.
  def singular(rule, replacement); end

  # Returns the value of attribute singulars.
  def singulars; end

  # Specifies words that are uncountable and should not be inflected.
  #
  # uncountable 'money'
  # uncountable 'money', 'information'
  # uncountable %w( money information rice )
  def uncountable(*words); end

  # Returns the value of attribute uncountables.
  def uncountables; end

  private

  def define_acronym_regex_patterns; end

  # Private, for the test suite.
  def initialize_dup(orig); end

  class << self
    def instance(locale = T.unsafe(nil)); end
    def instance_or_fallback(locale); end
  end
end

class ActiveSupport::Inflector::Inflections::Uncountables < ::Array
  def initialize; end

  def <<(*word); end
  def add(words); end
  def delete(entry); end
  def uncountable?(str); end

  private

  def to_regex(string); end
end

# +InheritableOptions+ provides a constructor to build an +OrderedOptions+
# hash inherited from another hash.
#
# Use this if you already have some hash and you want to create a new one based on it.
#
# h = ActiveSupport::InheritableOptions.new({ girl: 'Mary', boy: 'John' })
# h.girl # => 'Mary'
# h.boy  # => 'John'
class ActiveSupport::InheritableOptions < ::ActiveSupport::OrderedOptions
  def initialize(parent = T.unsafe(nil)); end

  def inheritable_copy; end
end

module ActiveSupport::IsolatedExecutionState
  class << self
    def [](key); end
    def []=(key, value); end
    def clear; end

    # Returns the value of attribute isolation_level.
    def isolation_level; end

    def isolation_level=(level); end
    def unique_id; end

    private

    def current; end
    def current_fiber; end
    def current_thread; end
  end
end

module ActiveSupport::JSON
  class << self
    # Parses a JSON string (JavaScript Object Notation) into a hash.
    # See http://www.json.org for more info.
    #
    # ActiveSupport::JSON.decode("{\"team\":\"rails\",\"players\":\"36\"}")
    # => {"team" => "rails", "players" => "36"}
    def decode(json); end

    # Dumps objects in JSON (JavaScript Object Notation).
    # See http://www.json.org for more info.
    #
    # ActiveSupport::JSON.encode({ team: 'rails', players: '36' })
    # # => "{\"team\":\"rails\",\"players\":\"36\"}"
    def encode(value, options = T.unsafe(nil)); end

    # Returns the class of the error that will be raised when there is an
    # error in decoding JSON. Using this method means you won't directly
    # depend on the ActiveSupport's JSON implementation, in case it changes
    # in the future.
    #
    # begin
    # obj = ActiveSupport::JSON.decode(some_string)
    # rescue ActiveSupport::JSON.parse_error
    # Rails.logger.warn("Attempted to decode invalid JSON: #{some_string}")
    # end
    def parse_error; end

    private

    def convert_dates_from(data); end
  end
end

ActiveSupport::JSON::DATETIME_REGEX = T.let(T.unsafe(nil), Regexp)

# matches YAML-formatted dates
ActiveSupport::JSON::DATE_REGEX = T.let(T.unsafe(nil), Regexp)

module ActiveSupport::JSON::Encoding
  class << self
    # If true, encode >, <, & as escaped unicode sequences (e.g. > as \u003e)
    # as a safety measure.
    def escape_html_entities_in_json; end

    # If true, encode >, <, & as escaped unicode sequences (e.g. > as \u003e)
    # as a safety measure.
    def escape_html_entities_in_json=(_arg0); end

    # Sets the encoder used by Rails to encode Ruby objects into JSON strings
    # in +Object#to_json+ and +ActiveSupport::JSON.encode+.
    def json_encoder; end

    # Sets the encoder used by Rails to encode Ruby objects into JSON strings
    # in +Object#to_json+ and +ActiveSupport::JSON.encode+.
    def json_encoder=(_arg0); end

    # Sets the precision of encoded time values.
    # Defaults to 3 (equivalent to millisecond precision)
    def time_precision; end

    # Sets the precision of encoded time values.
    # Defaults to 3 (equivalent to millisecond precision)
    def time_precision=(_arg0); end

    # If true, use ISO 8601 format for dates and times. Otherwise, fall back
    # to the Active Support legacy format.
    def use_standard_json_time_format; end

    # If true, use ISO 8601 format for dates and times. Otherwise, fall back
    # to the Active Support legacy format.
    def use_standard_json_time_format=(_arg0); end
  end
end

class ActiveSupport::JSON::Encoding::JSONGemEncoder
  def initialize(options = T.unsafe(nil)); end

  # Encode the given object into a JSON string
  def encode(value); end

  # Returns the value of attribute options.
  def options; end

  private

  # Convert an object into a "JSON-ready" representation composed of
  # primitives like Hash, Array, String, Numeric,
  # and +true+/+false+/+nil+.
  # Recursively calls #as_json to the object to recursively build a
  # fully JSON-ready object.
  #
  # This allows developers to implement #as_json without having to
  # worry about what base types of objects they are allowed to return
  # or having to remember to call #as_json recursively.
  #
  # Note: the +options+ hash passed to +object.to_json+ is only passed
  # to +object.as_json+, not any of this method's recursive +#as_json+
  # calls.
  def jsonify(value); end

  # Encode a "jsonified" Ruby data structure using the JSON gem
  def stringify(jsonified); end
end

# Rails does more escaping than the JSON gem natively does (we
# escape \u2028 and \u2029 and optionally >, <, & to work around
# certain browser problems).
ActiveSupport::JSON::Encoding::JSONGemEncoder::ESCAPED_CHARS =
  T.let(T.unsafe(nil), Hash)

ActiveSupport::JSON::Encoding::JSONGemEncoder::ESCAPE_REGEX_WITHOUT_HTML_ENTITIES =
  T.let(T.unsafe(nil), Regexp)
ActiveSupport::JSON::Encoding::JSONGemEncoder::ESCAPE_REGEX_WITH_HTML_ENTITIES =
  T.let(T.unsafe(nil), Regexp)

# This class wraps all the strings we see and does the extra escaping
class ActiveSupport::JSON::Encoding::JSONGemEncoder::EscapedString < ::String
  def to_json(*_arg0); end
  def to_s; end
end

# KeyGenerator is a simple wrapper around OpenSSL's implementation of PBKDF2.
# It can be used to derive a number of keys for various purposes from a given secret.
# This lets Rails applications have a single secure secret, but avoid reusing that
# key in multiple incompatible contexts.
class ActiveSupport::KeyGenerator
  def initialize(secret, options = T.unsafe(nil)); end

  # Returns a derived key suitable for use.  The default key_size is chosen
  # to be compatible with the default settings of ActiveSupport::MessageVerifier.
  # i.e. OpenSSL::Digest::SHA1#block_length
  def generate_key(salt, key_size = T.unsafe(nil)); end

  class << self
    def hash_digest_class; end
    def hash_digest_class=(klass); end
  end
end

# lazy_load_hooks allows Rails to lazily load a lot of components and thus
# making the app boot faster. Because of this feature now there is no need to
# require <tt>ActiveRecord::Base</tt> at boot time purely to apply
# configuration. Instead a hook is registered that applies configuration once
# <tt>ActiveRecord::Base</tt> is loaded. Here <tt>ActiveRecord::Base</tt> is
# used as example but this feature can be applied elsewhere too.
#
# Here is an example where +on_load+ method is called to register a hook.
#
# initializer 'active_record.initialize_timezone' do
# ActiveSupport.on_load(:active_record) do
# self.time_zone_aware_attributes = true
# self.default_timezone = :utc
# end
# end
#
# When the entirety of +ActiveRecord::Base+ has been
# evaluated then +run_load_hooks+ is invoked. The very last line of
# +ActiveRecord::Base+ is:
#
# ActiveSupport.run_load_hooks(:active_record, ActiveRecord::Base)
module ActiveSupport::LazyLoadHooks
  # Declares a block that will be executed when a Rails component is fully
  # loaded.
  #
  # Options:
  #
  # * <tt>:yield</tt> - Yields the object that run_load_hooks to +block+.
  # * <tt>:run_once</tt> - Given +block+ will run only once.
  def on_load(name, options = T.unsafe(nil), &block); end

  def run_load_hooks(name, base = T.unsafe(nil)); end

  private

  def execute_hook(name, base, options, block); end
  def with_execution_control(name, block, once); end

  class << self
    def extended(base); end
  end
end

# <tt>ActiveSupport::LogSubscriber</tt> is an object set to consume
# <tt>ActiveSupport::Notifications</tt> with the sole purpose of logging them.
# The log subscriber dispatches notifications to a registered object based
# on its given namespace.
#
# An example would be Active Record log subscriber responsible for logging
# queries:
#
# module ActiveRecord
# class LogSubscriber < ActiveSupport::LogSubscriber
# def sql(event)
# info "#{event.payload[:name]} (#{event.duration}) #{event.payload[:sql]}"
# end
# end
# end
#
# And it's finally registered as:
#
# ActiveRecord::LogSubscriber.attach_to :active_record
#
# Since we need to know all instance methods before attaching the log
# subscriber, the line above should be called after your
# <tt>ActiveRecord::LogSubscriber</tt> definition.
#
# A logger also needs to be set with <tt>ActiveRecord::LogSubscriber.logger=</tt>.
# This is assigned automatically in a Rails environment.
#
# After configured, whenever a <tt>"sql.active_record"</tt> notification is published,
# it will properly dispatch the event
# (<tt>ActiveSupport::Notifications::Event</tt>) to the sql method.
#
# Being an <tt>ActiveSupport::Notifications</tt> consumer,
# <tt>ActiveSupport::LogSubscriber</tt> exposes a simple interface to check if
# instrumented code raises an exception. It is common to log a different
# message in case of an error, and this can be achieved by extending
# the previous example:
#
# module ActiveRecord
# class LogSubscriber < ActiveSupport::LogSubscriber
# def sql(event)
# exception = event.payload[:exception]
#
# if exception
# exception_object = event.payload[:exception_object]
#
# error "[ERROR] #{event.payload[:name]}: #{exception.join(', ')} " \
# "(#{exception_object.backtrace.first})"
# else
# # standard logger code
# end
# end
# end
# end
#
# Log subscriber also has some helpers to deal with logging and automatically
# flushes all logs when the request finishes
# (via <tt>action_dispatch.callback</tt> notification) in a Rails environment.
class ActiveSupport::LogSubscriber < ::ActiveSupport::Subscriber
  def colorize_logging; end
  def colorize_logging=(val); end
  def debug(progname = T.unsafe(nil), &block); end
  def error(progname = T.unsafe(nil), &block); end
  def fatal(progname = T.unsafe(nil), &block); end
  def finish(name, id, payload); end
  def info(progname = T.unsafe(nil), &block); end
  def logger; end
  def publish_event(event); end
  def start(name, id, payload); end
  def unknown(progname = T.unsafe(nil), &block); end
  def warn(progname = T.unsafe(nil), &block); end

  private

  # Set color by using a symbol or one of the defined constants. If a third
  # option is set to +true+, it also adds bold to the string. This is based
  # on the Highline implementation and will automatically append CLEAR to the
  # end of the returned String.
  def color(text, color, bold = T.unsafe(nil)); end

  def log_exception(name, e); end

  class << self
    def colorize_logging; end
    def colorize_logging=(val); end

    # Flush all log_subscribers' logger.
    def flush_all!; end

    def log_subscribers; end
    def logger; end

    # Sets the attribute logger
    def logger=(_arg0); end

    private

    def fetch_public_methods(subscriber, inherit_all); end
  end
end

# Colors
ActiveSupport::LogSubscriber::BLACK = T.let(T.unsafe(nil), String)

ActiveSupport::LogSubscriber::BLUE = T.let(T.unsafe(nil), String)
ActiveSupport::LogSubscriber::BOLD = T.let(T.unsafe(nil), String)

# Embed in a String to clear all previous ANSI sequences.
ActiveSupport::LogSubscriber::CLEAR = T.let(T.unsafe(nil), String)

ActiveSupport::LogSubscriber::CYAN = T.let(T.unsafe(nil), String)
ActiveSupport::LogSubscriber::GREEN = T.let(T.unsafe(nil), String)
ActiveSupport::LogSubscriber::MAGENTA = T.let(T.unsafe(nil), String)
ActiveSupport::LogSubscriber::RED = T.let(T.unsafe(nil), String)
ActiveSupport::LogSubscriber::WHITE = T.let(T.unsafe(nil), String)
ActiveSupport::LogSubscriber::YELLOW = T.let(T.unsafe(nil), String)

class ActiveSupport::Logger < ::Logger
  include ::ActiveSupport::LoggerSilence
  include ::ActiveSupport::LoggerThreadSafeLevel

  def initialize(*args, **kwargs); end

  def silencer; end
  def silencer=(val); end

  class << self
    # Broadcasts logs to multiple loggers.
    def broadcast(logger); end

    # Returns true if the logger destination matches one of the sources
    #
    # logger = Logger.new(STDOUT)
    # ActiveSupport::Logger.logger_outputs_to?(logger, STDOUT)
    # # => true
    def logger_outputs_to?(logger, *sources); end

    def silencer; end
    def silencer=(val); end
  end
end

# Simple formatter which only displays the message.
class ActiveSupport::Logger::SimpleFormatter < ::Logger::Formatter
  # This method is invoked when a log event occurs
  def call(severity, timestamp, progname, msg); end
end

module ActiveSupport::LoggerSilence
  extend ::ActiveSupport::Concern
  include ::ActiveSupport::LoggerThreadSafeLevel

  # Silences the logger for the duration of the block.
  def silence(severity = T.unsafe(nil)); end
end

module ActiveSupport::LoggerThreadSafeLevel
  extend ::ActiveSupport::Concern

  # Redefined to check severity against #level, and thus the thread-local level, rather than +@level+.
  # FIXME: Remove when the minimum Ruby version supports overriding Logger#level.
  def add(
    severity,
    message = T.unsafe(nil),
    progname = T.unsafe(nil),
    &block
  ); end

  def debug?; end
  def error?; end
  def fatal?; end
  def info?; end
  def level; end
  def local_level; end
  def local_level=(level); end

  # Change the thread-local level for the duration of the given block.
  def log_at(level); end

  def unknown?; end
  def warn?; end
end

# MessageEncryptor is a simple way to encrypt values which get stored
# somewhere you don't trust.
#
# The cipher text and initialization vector are base64 encoded and returned
# to you.
#
# This can be used in situations similar to the <tt>MessageVerifier</tt>, but
# where you don't want users to be able to determine the value of the payload.
#
# len   = ActiveSupport::MessageEncryptor.key_len
# salt  = SecureRandom.random_bytes(len)
# key   = ActiveSupport::KeyGenerator.new('password').generate_key(salt, len) # => "\x89\xE0\x156\xAC..."
# crypt = ActiveSupport::MessageEncryptor.new(key)                            # => #<ActiveSupport::MessageEncryptor ...>
# encrypted_data = crypt.encrypt_and_sign('my secret data')                   # => "NlFBTTMwOUV5UlA1QlNEN2xkY2d6eThYWWh..."
# crypt.decrypt_and_verify(encrypted_data)                                    # => "my secret data"
# The +decrypt_and_verify+ method will raise an
# <tt>ActiveSupport::MessageEncryptor::InvalidMessage</tt> exception if the data
# provided cannot be decrypted or verified.
#
# crypt.decrypt_and_verify('not encrypted data') # => ActiveSupport::MessageEncryptor::InvalidMessage
#
# === Confining messages to a specific purpose
#
# By default any message can be used throughout your app. But they can also be
# confined to a specific +:purpose+.
#
# token = crypt.encrypt_and_sign("this is the chair", purpose: :login)
#
# Then that same purpose must be passed when verifying to get the data back out:
#
# crypt.decrypt_and_verify(token, purpose: :login)    # => "this is the chair"
# crypt.decrypt_and_verify(token, purpose: :shipping) # => nil
# crypt.decrypt_and_verify(token)                     # => nil
#
# Likewise, if a message has no purpose it won't be returned when verifying with
# a specific purpose.
#
# token = crypt.encrypt_and_sign("the conversation is lively")
# crypt.decrypt_and_verify(token, purpose: :scare_tactics) # => nil
# crypt.decrypt_and_verify(token)                          # => "the conversation is lively"
#
# === Making messages expire
#
# By default messages last forever and verifying one year from now will still
# return the original value. But messages can be set to expire at a given
# time with +:expires_in+ or +:expires_at+.
#
# crypt.encrypt_and_sign(parcel, expires_in: 1.month)
# crypt.encrypt_and_sign(doowad, expires_at: Time.now.end_of_year)
#
# Then the messages can be verified and returned up to the expire time.
# Thereafter, verifying returns +nil+.
#
# === Rotating keys
#
# MessageEncryptor also supports rotating out old configurations by falling
# back to a stack of encryptors. Call +rotate+ to build and add an encryptor
# so +decrypt_and_verify+ will also try the fallback.
#
# By default any rotated encryptors use the values of the primary
# encryptor unless specified otherwise.
#
# You'd give your encryptor the new defaults:
#
# crypt = ActiveSupport::MessageEncryptor.new(@secret, cipher: "aes-256-gcm")
#
# Then gradually rotate the old values out by adding them as fallbacks. Any message
# generated with the old values will then work until the rotation is removed.
#
# crypt.rotate old_secret            # Fallback to an old secret instead of @secret.
# crypt.rotate cipher: "aes-256-cbc" # Fallback to an old cipher instead of aes-256-gcm.
#
# Though if both the secret and the cipher was changed at the same time,
# the above should be combined into:
#
# crypt.rotate old_secret, cipher: "aes-256-cbc"
class ActiveSupport::MessageEncryptor
  include ::ActiveSupport::Messages::Rotator
  include ::ActiveSupport::Messages::Rotator::Encryptor

  # Encrypt and sign a message. We need to sign the message in order to avoid
  # padding attacks. Reference: https://www.limited-entropy.com/padding-oracle-attacks/.
  def encrypt_and_sign(
    value,
    expires_at: T.unsafe(nil),
    expires_in: T.unsafe(nil),
    purpose: T.unsafe(nil)
  ); end

  private

  def _decrypt(encrypted_message, purpose); end
  def _encrypt(value, **metadata_options); end
  def aead_mode?; end
  def new_cipher; end
  def resolve_verifier; end

  # Returns the value of attribute verifier.
  def verifier; end

  class << self
    def default_cipher; end

    # Given a cipher, returns the key length of the cipher to help generate the key of desired size
    def key_len(cipher = T.unsafe(nil)); end

    def use_authenticated_message_encryption; end
    def use_authenticated_message_encryption=(val); end
  end
end

class ActiveSupport::MessageEncryptor::InvalidMessage < ::StandardError
end

module ActiveSupport::MessageEncryptor::NullSerializer
  class << self
    def dump(value); end
    def load(value); end
  end
end

module ActiveSupport::MessageEncryptor::NullVerifier
  class << self
    def generate(value); end
    def verify(value); end
  end
end

ActiveSupport::MessageEncryptor::OpenSSLCipherError =
  OpenSSL::Cipher::CipherError

# +MessageVerifier+ makes it easy to generate and verify messages which are
# signed to prevent tampering.
#
# This is useful for cases like remember-me tokens and auto-unsubscribe links
# where the session store isn't suitable or available.
#
# Remember Me:
# cookies[:remember_me] = @verifier.generate([@user.id, 2.weeks.from_now])
#
# In the authentication filter:
#
# id, time = @verifier.verify(cookies[:remember_me])
# if Time.now < time
# self.current_user = User.find(id)
# end
#
# By default it uses Marshal to serialize the message. If you want to use
# another serialization method, you can set the serializer in the options
# hash upon initialization:
#
# @verifier = ActiveSupport::MessageVerifier.new('s3Krit', serializer: YAML)
#
# +MessageVerifier+ creates HMAC signatures using SHA1 hash algorithm by default.
# If you want to use a different hash algorithm, you can change it by providing
# +:digest+ key as an option while initializing the verifier:
#
# @verifier = ActiveSupport::MessageVerifier.new('s3Krit', digest: 'SHA256')
#
# === Confining messages to a specific purpose
#
# By default any message can be used throughout your app. But they can also be
# confined to a specific +:purpose+.
#
# token = @verifier.generate("this is the chair", purpose: :login)
#
# Then that same purpose must be passed when verifying to get the data back out:
#
# @verifier.verified(token, purpose: :login)    # => "this is the chair"
# @verifier.verified(token, purpose: :shipping) # => nil
# @verifier.verified(token)                     # => nil
#
# @verifier.verify(token, purpose: :login)      # => "this is the chair"
# @verifier.verify(token, purpose: :shipping)   # => ActiveSupport::MessageVerifier::InvalidSignature
# @verifier.verify(token)                       # => ActiveSupport::MessageVerifier::InvalidSignature
#
# Likewise, if a message has no purpose it won't be returned when verifying with
# a specific purpose.
#
# token = @verifier.generate("the conversation is lively")
# @verifier.verified(token, purpose: :scare_tactics) # => nil
# @verifier.verified(token)                          # => "the conversation is lively"
#
# @verifier.verify(token, purpose: :scare_tactics)   # => ActiveSupport::MessageVerifier::InvalidSignature
# @verifier.verify(token)                            # => "the conversation is lively"
#
# === Making messages expire
#
# By default messages last forever and verifying one year from now will still
# return the original value. But messages can be set to expire at a given
# time with +:expires_in+ or +:expires_at+.
#
# @verifier.generate("parcel", expires_in: 1.month)
# @verifier.generate("doowad", expires_at: Time.now.end_of_year)
#
# Then the messages can be verified and returned up to the expire time.
# Thereafter, the +verified+ method returns +nil+ while +verify+ raises
# <tt>ActiveSupport::MessageVerifier::InvalidSignature</tt>.
#
# === Rotating keys
#
# MessageVerifier also supports rotating out old configurations by falling
# back to a stack of verifiers. Call +rotate+ to build and add a verifier so
# either +verified+ or +verify+ will also try verifying with the fallback.
#
# By default any rotated verifiers use the values of the primary
# verifier unless specified otherwise.
#
# You'd give your verifier the new defaults:
#
# verifier = ActiveSupport::MessageVerifier.new(@secret, digest: "SHA512", serializer: JSON)
#
# Then gradually rotate the old values out by adding them as fallbacks. Any message
# generated with the old values will then work until the rotation is removed.
#
# verifier.rotate old_secret          # Fallback to an old secret instead of @secret.
# verifier.rotate digest: "SHA256"    # Fallback to an old digest instead of SHA512.
# verifier.rotate serializer: Marshal # Fallback to an old serializer instead of JSON.
#
# Though the above would most likely be combined into one rotation:
#
# verifier.rotate old_secret, digest: "SHA256", serializer: Marshal
class ActiveSupport::MessageVerifier
  include ::ActiveSupport::Messages::Rotator
  include ::ActiveSupport::Messages::Rotator::Verifier

  # Generates a signed message for the provided value.
  #
  # The message is signed with the +MessageVerifier+'s secret.
  # Returns Base64-encoded message joined with the generated signature.
  #
  # verifier = ActiveSupport::MessageVerifier.new 's3Krit'
  # verifier.generate 'a private message' # => "BAhJIhRwcml2YXRlLW1lc3NhZ2UGOgZFVA==--e2d724331ebdee96a10fb99b089508d1c72bd772"
  def generate(
    value,
    expires_at: T.unsafe(nil),
    expires_in: T.unsafe(nil),
    purpose: T.unsafe(nil)
  ); end

  # Checks if a signed message could have been generated by signing an object
  # with the +MessageVerifier+'s secret.
  #
  # verifier = ActiveSupport::MessageVerifier.new 's3Krit'
  # signed_message = verifier.generate 'a private message'
  # verifier.valid_message?(signed_message) # => true
  #
  # tampered_message = signed_message.chop # editing the message invalidates the signature
  # verifier.valid_message?(tampered_message) # => false
  def valid_message?(signed_message); end

  # Decodes the signed message using the +MessageVerifier+'s secret.
  #
  # verifier = ActiveSupport::MessageVerifier.new 's3Krit'
  # signed_message = verifier.generate 'a private message'
  #
  # verifier.verify(signed_message) # => 'a private message'
  #
  # Raises +InvalidSignature+ if the message was not signed with the same
  # secret or was not Base64-encoded.
  #
  # other_verifier = ActiveSupport::MessageVerifier.new 'd1ff3r3nt-s3Krit'
  # other_verifier.verify(signed_message) # => ActiveSupport::MessageVerifier::InvalidSignature
  def verify(*args, **options); end

  private

  def decode(data); end
  def digest_length_in_hex; end
  def digest_matches_data?(digest, data); end
  def encode(data); end
  def generate_digest(data); end
  def get_data_and_digest_from(signed_message); end
  def separator_index_for(signed_message); end
end

class ActiveSupport::MessageVerifier::InvalidSignature < ::StandardError
end
ActiveSupport::MessageVerifier::SEPARATOR = T.let(T.unsafe(nil), String)
ActiveSupport::MessageVerifier::SEPARATOR_LENGTH = T.let(T.unsafe(nil), Integer)
module ActiveSupport::Messages
end

class ActiveSupport::Messages::Metadata
  def initialize(
    message,
    expires_at = T.unsafe(nil),
    purpose = T.unsafe(nil)
  ); end

  def as_json(options = T.unsafe(nil)); end
  def verify(purpose); end

  private

  def fresh?; end
  def match?(purpose); end
  def parse_expires_at(expires_at); end

  class << self
    def verify(message, purpose); end
    def wrap(
      message,
      expires_at: T.unsafe(nil),
      expires_in: T.unsafe(nil),
      purpose: T.unsafe(nil)
    ); end

    private

    def decode(message); end
    def encode(message); end
    def extract_metadata(message); end
    def pick_expiry(expires_at, expires_in); end
  end
end

class ActiveSupport::Messages::RotationConfiguration
  def initialize; end

  # Returns the value of attribute encrypted.
  def encrypted; end

  def rotate(kind, *args, **options); end

  # Returns the value of attribute signed.
  def signed; end
end

module ActiveSupport::Messages::Rotator
  def initialize(*secrets, on_rotation: T.unsafe(nil), **options); end

  def rotate(*secrets, **options); end

  private

  def run_rotations(on_rotation); end
end

module ActiveSupport::Messages::Rotator::Encryptor
  include ::ActiveSupport::Messages::Rotator

  def decrypt_and_verify(*args, on_rotation: T.unsafe(nil), **options); end

  private

  def build_rotation(
    secret = T.unsafe(nil),
    sign_secret = T.unsafe(nil),
    options
  ); end
end

module ActiveSupport::Messages::Rotator::Verifier
  include ::ActiveSupport::Messages::Rotator

  def verified(*args, on_rotation: T.unsafe(nil), **options); end

  private

  def build_rotation(secret = T.unsafe(nil), options); end
end

module ActiveSupport::Multibyte
  class << self
    # Returns the current proxy class.
    def proxy_class; end

    # The proxy class returned when calling mb_chars. You can use this accessor
    # to configure your own proxy class so you can support other encodings. See
    # the ActiveSupport::Multibyte::Chars implementation for an example how to
    # do this.
    #
    # ActiveSupport::Multibyte.proxy_class = CharsForUTF32
    def proxy_class=(klass); end
  end
end

# Chars enables you to work transparently with UTF-8 encoding in the Ruby
# String class without having extensive knowledge about the encoding. A
# Chars object accepts a string upon initialization and proxies String
# methods in an encoding safe manner. All the normal String methods are also
# implemented on the proxy.
#
# String methods are proxied through the Chars object, and can be accessed
# through the +mb_chars+ method. Methods which would normally return a
# String object now return a Chars object so methods can be chained.
#
# 'The Perfect String  '.mb_chars.downcase.strip
# # => #<ActiveSupport::Multibyte::Chars:0x007fdc434ccc10 @wrapped_string="the perfect string">
#
# Chars objects are perfectly interchangeable with String objects as long as
# no explicit class checks are made. If certain methods do explicitly check
# the class, call +to_s+ before you pass chars objects to them.
#
# bad.explicit_checking_method 'T'.mb_chars.downcase.to_s
#
# The default Chars implementation assumes that the encoding of the string
# is UTF-8, if you want to handle different encodings you can write your own
# multibyte string handler and configure it through
# ActiveSupport::Multibyte.proxy_class.
#
# class CharsForUTF32
# def size
# @wrapped_string.size / 4
# end
#
# def self.accepts?(string)
# string.length % 4 == 0
# end
# end
#
# ActiveSupport::Multibyte.proxy_class = CharsForUTF32
class ActiveSupport::Multibyte::Chars
  include ::Comparable

  # Creates a new Chars instance by wrapping _string_.
  def initialize(string); end

  def <=>(*_arg0, &_arg1); end
  def =~(*_arg0, &_arg1); end
  def acts_like_string?(*_arg0, &_arg1); end
  def as_json(options = T.unsafe(nil)); end

  # Performs composition on all the characters.
  #
  # 'é'.length                       # => 1
  # 'é'.mb_chars.compose.to_s.length # => 1
  def compose; end

  # Performs canonical decomposition on all the characters.
  #
  # 'é'.length                         # => 1
  # 'é'.mb_chars.decompose.to_s.length # => 2
  def decompose; end

  # Returns the number of grapheme clusters in the string.
  #
  # 'क्षि'.mb_chars.length   # => 4
  # 'क्षि'.mb_chars.grapheme_length # => 2
  def grapheme_length; end

  # Limits the byte size of the string to a number of bytes without breaking
  # characters. Usable when the storage for a string is limited for some
  # reason.
  #
  # 'こんにちは'.mb_chars.limit(7).to_s # => "こん"
  def limit(limit); end

  def match?(*_arg0, &_arg1); end

  # Forward all undefined methods to the wrapped string.
  def method_missing(method, *args, &block); end

  # Reverses all characters in the string.
  #
  # 'Café'.mb_chars.reverse.to_s # => 'éfaC'
  def reverse; end

  def reverse!(*args); end

  # Works like <tt>String#slice!</tt>, but returns an instance of
  # Chars, or +nil+ if the string was not modified. The string will not be
  # modified if the range given is out of bounds
  #
  # string = 'Welcome'
  # string.mb_chars.slice!(3)    # => #<ActiveSupport::Multibyte::Chars:0x000000038109b8 @wrapped_string="c">
  # string # => 'Welome'
  # string.mb_chars.slice!(0..3) # => #<ActiveSupport::Multibyte::Chars:0x00000002eb80a0 @wrapped_string="Welo">
  # string # => 'me'
  def slice!(*args); end

  # Works just like <tt>String#split</tt>, with the exception that the items
  # in the resulting list are Chars instances instead of String. This makes
  # chaining methods easier.
  #
  # 'Café périferôl'.mb_chars.split(/é/).map { |part| part.upcase.to_s } # => ["CAF", " P", "RIFERÔL"]
  def split(*args); end

  # Replaces all ISO-8859-1 or CP1252 characters by their UTF-8 equivalent
  # resulting in a valid UTF-8 string.
  #
  # Passing +true+ will forcibly tidy all bytes, assuming that the string's
  # encoding is entirely CP1252 or ISO-8859-1.
  def tidy_bytes(force = T.unsafe(nil)); end

  def tidy_bytes!(*args); end

  # Capitalizes the first letter of every word, when possible.
  #
  # "ÉL QUE SE ENTERÓ".mb_chars.titleize.to_s    # => "Él Que Se Enteró"
  # "日本語".mb_chars.titleize.to_s               # => "日本語"
  def titlecase; end

  # Capitalizes the first letter of every word, when possible.
  #
  # "ÉL QUE SE ENTERÓ".mb_chars.titleize.to_s    # => "Él Que Se Enteró"
  # "日本語".mb_chars.titleize.to_s               # => "日本語"
  def titleize; end

  # Returns the value of attribute wrapped_string.
  def to_s; end

  # Returns the value of attribute wrapped_string.
  def to_str; end

  # Returns the value of attribute wrapped_string.
  def wrapped_string; end

  private

  def chars(string); end

  # Returns +true+ if _obj_ responds to the given method. Private methods
  # are included in the search only if the optional second parameter
  # evaluates to +true+.
  def respond_to_missing?(method, include_private); end
end

module ActiveSupport::Multibyte::Unicode
  extend ::ActiveSupport::Multibyte::Unicode

  # Compose decomposed characters to the composed form.
  def compose(codepoints); end

  # Decompose composed characters to the decomposed form.
  def decompose(type, codepoints); end

  # Replaces all ISO-8859-1 or CP1252 characters by their UTF-8 equivalent
  # resulting in a valid UTF-8 string.
  #
  # Passing +true+ will forcibly tidy all bytes, assuming that the string's
  # encoding is entirely CP1252 or ISO-8859-1.
  def tidy_bytes(string, force = T.unsafe(nil)); end

  private

  def recode_windows1252_chars(string); end
end

# The Unicode version that is supported by the implementation
ActiveSupport::Multibyte::Unicode::UNICODE_VERSION =
  T.let(T.unsafe(nil), String)

# = Notifications
#
# <tt>ActiveSupport::Notifications</tt> provides an instrumentation API for
# Ruby.
#
# == Instrumenters
#
# To instrument an event you just need to do:
#
# ActiveSupport::Notifications.instrument('render', extra: :information) do
# render plain: 'Foo'
# end
#
# That first executes the block and then notifies all subscribers once done.
#
# In the example above +render+ is the name of the event, and the rest is called
# the _payload_. The payload is a mechanism that allows instrumenters to pass
# extra information to subscribers. Payloads consist of a hash whose contents
# are arbitrary and generally depend on the event.
#
# == Subscribers
#
# You can consume those events and the information they provide by registering
# a subscriber.
#
# ActiveSupport::Notifications.subscribe('render') do |name, start, finish, id, payload|
# name    # => String, name of the event (such as 'render' from above)
# start   # => Time, when the instrumented block started execution
# finish  # => Time, when the instrumented block ended execution
# id      # => String, unique ID for the instrumenter that fired the event
# payload # => Hash, the payload
# end
#
# Here, the +start+ and +finish+ values represent wall-clock time. If you are
# concerned about accuracy, you can register a monotonic subscriber.
#
# ActiveSupport::Notifications.monotonic_subscribe('render') do |name, start, finish, id, payload|
# name    # => String, name of the event (such as 'render' from above)
# start   # => Monotonic time, when the instrumented block started execution
# finish  # => Monotonic time, when the instrumented block ended execution
# id      # => String, unique ID for the instrumenter that fired the event
# payload # => Hash, the payload
# end
#
# The +start+ and +finish+ values above represent monotonic time.
#
# For instance, let's store all "render" events in an array:
#
# events = []
#
# ActiveSupport::Notifications.subscribe('render') do |*args|
# events << ActiveSupport::Notifications::Event.new(*args)
# end
#
# That code returns right away, you are just subscribing to "render" events.
# The block is saved and will be called whenever someone instruments "render":
#
# ActiveSupport::Notifications.instrument('render', extra: :information) do
# render plain: 'Foo'
# end
#
# event = events.first
# event.name      # => "render"
# event.duration  # => 10 (in milliseconds)
# event.payload   # => { extra: :information }
#
# The block in the <tt>subscribe</tt> call gets the name of the event, start
# timestamp, end timestamp, a string with a unique identifier for that event's instrumenter
# (something like "535801666f04d0298cd6"), and a hash with the payload, in
# that order.
#
# If an exception happens during that particular instrumentation the payload will
# have a key <tt>:exception</tt> with an array of two elements as value: a string with
# the name of the exception class, and the exception message.
# The <tt>:exception_object</tt> key of the payload will have the exception
# itself as the value:
#
# event.payload[:exception]         # => ["ArgumentError", "Invalid value"]
# event.payload[:exception_object]  # => #<ArgumentError: Invalid value>
#
# As the earlier example depicts, the class <tt>ActiveSupport::Notifications::Event</tt>
# is able to take the arguments as they come and provide an object-oriented
# interface to that data.
#
# It is also possible to pass an object which responds to <tt>call</tt> method
# as the second parameter to the <tt>subscribe</tt> method instead of a block:
#
# module ActionController
# class PageRequest
# def call(name, started, finished, unique_id, payload)
# Rails.logger.debug ['notification:', name, started, finished, unique_id, payload].join(' ')
# end
# end
# end
#
# ActiveSupport::Notifications.subscribe('process_action.action_controller', ActionController::PageRequest.new)
#
# resulting in the following output within the logs including a hash with the payload:
#
# notification: process_action.action_controller 2012-04-13 01:08:35 +0300 2012-04-13 01:08:35 +0300 af358ed7fab884532ec7 {
# controller: "Devise::SessionsController",
# action: "new",
# params: {"action"=>"new", "controller"=>"devise/sessions"},
# format: :html,
# method: "GET",
# path: "/login/sign_in",
# status: 200,
# view_runtime: 279.3080806732178,
# db_runtime: 40.053
# }
#
# You can also subscribe to all events whose name matches a certain regexp:
#
# ActiveSupport::Notifications.subscribe(/render/) do |*args|
# ...
# end
#
# and even pass no argument to <tt>subscribe</tt>, in which case you are subscribing
# to all events.
#
# == Temporary Subscriptions
#
# Sometimes you do not want to subscribe to an event for the entire life of
# the application. There are two ways to unsubscribe.
#
# WARNING: The instrumentation framework is designed for long-running subscribers,
# use this feature sparingly because it wipes some internal caches and that has
# a negative impact on performance.
#
# === Subscribe While a Block Runs
#
# You can subscribe to some event temporarily while some block runs. For
# example, in
#
# callback = lambda {|*args| ... }
# ActiveSupport::Notifications.subscribed(callback, "sql.active_record") do
# ...
# end
#
# the callback will be called for all "sql.active_record" events instrumented
# during the execution of the block. The callback is unsubscribed automatically
# after that.
#
# To record +started+ and +finished+ values with monotonic time,
# specify the optional <tt>:monotonic</tt> option to the
# <tt>subscribed</tt> method. The <tt>:monotonic</tt> option is set
# to +false+ by default.
#
# callback = lambda {|name, started, finished, unique_id, payload| ... }
# ActiveSupport::Notifications.subscribed(callback, "sql.active_record", monotonic: true) do
# ...
# end
#
# === Manual Unsubscription
#
# The +subscribe+ method returns a subscriber object:
#
# subscriber = ActiveSupport::Notifications.subscribe("render") do |*args|
# ...
# end
#
# To prevent that block from being called anymore, just unsubscribe passing
# that reference:
#
# ActiveSupport::Notifications.unsubscribe(subscriber)
#
# You can also unsubscribe by passing the name of the subscriber object. Note
# that this will unsubscribe all subscriptions with the given name:
#
# ActiveSupport::Notifications.unsubscribe("render")
#
# Subscribers using a regexp or other pattern-matching object will remain subscribed
# to all events that match their original pattern, unless those events match a string
# passed to +unsubscribe+:
#
# subscriber = ActiveSupport::Notifications.subscribe(/render/) { }
# ActiveSupport::Notifications.unsubscribe('render_template.action_view')
# subscriber.matches?('render_template.action_view') # => false
# subscriber.matches?('render_partial.action_view') # => true
#
# == Default Queue
#
# Notifications ships with a queue implementation that consumes and publishes events
# to all log subscribers. You can use any queue implementation you want.
module ActiveSupport::Notifications
  class << self
    def instrument(name, payload = T.unsafe(nil)); end
    def instrumenter; end
    def monotonic_subscribe(
      pattern = T.unsafe(nil),
      callback = T.unsafe(nil),
      &block
    ); end

    # Returns the value of attribute notifier.
    def notifier; end

    # Sets the attribute notifier
    def notifier=(_arg0); end

    def publish(name, *args); end
    def publish_event(event); end

    # Subscribe to a given event name with the passed +block+.
    #
    # You can subscribe to events by passing a String to match exact event
    # names, or by passing a Regexp to match all events that match a pattern.
    #
    # ActiveSupport::Notifications.subscribe(/render/) do |*args|
    # @event = ActiveSupport::Notifications::Event.new(*args)
    # end
    #
    # The +block+ will receive five parameters with information about the event:
    #
    # ActiveSupport::Notifications.subscribe('render') do |name, start, finish, id, payload|
    # name    # => String, name of the event (such as 'render' from above)
    # start   # => Time, when the instrumented block started execution
    # finish  # => Time, when the instrumented block ended execution
    # id      # => String, unique ID for the instrumenter that fired the event
    # payload # => Hash, the payload
    # end
    #
    # If the block passed to the method only takes one parameter,
    # it will yield an event object to the block:
    #
    # ActiveSupport::Notifications.subscribe(/render/) do |event|
    # @event = event
    # end
    #
    # Raises an error if invalid event name type is passed:
    #
    # ActiveSupport::Notifications.subscribe(:render) {|*args| ...}
    # #=> ArgumentError (pattern must be specified as a String, Regexp or empty)
    def subscribe(
      pattern = T.unsafe(nil),
      callback = T.unsafe(nil),
      &block
    ); end

    def subscribed(
      callback,
      pattern = T.unsafe(nil),
      monotonic: T.unsafe(nil),
      &block
    ); end
    def unsubscribe(subscriber_or_name); end

    private

    def registry; end
  end
end

class ActiveSupport::Notifications::Event
  def initialize(name, start, ending, transaction_id, payload); end

  def <<(event); end

  # Returns the number of allocations made since the call to +start!+ and
  # the call to +finish!+
  def allocations; end

  # Returns the value of attribute children.
  def children; end

  # Returns the CPU time (in milliseconds) passed since the call to
  # +start!+ and the call to +finish!+
  def cpu_time; end

  # Returns the difference in milliseconds between when the execution of the
  # event started and when it ended.
  #
  # ActiveSupport::Notifications.subscribe('wait') do |*args|
  # @event = ActiveSupport::Notifications::Event.new(*args)
  # end
  #
  # ActiveSupport::Notifications.instrument('wait') do
  # sleep 1
  # end
  #
  # @event.duration # => 1000.138
  def duration; end

  # Returns the value of attribute end.
  def end; end

  # Record information at the time this event finishes
  def finish!; end

  # Returns the idle time time (in milliseconds) passed since the call to
  # +start!+ and the call to +finish!+
  def idle_time; end

  # Returns the value of attribute name.
  def name; end

  def parent_of?(event); end

  # Returns the value of attribute payload.
  def payload; end

  # Sets the attribute payload
  def payload=(_arg0); end

  def record; end

  # Record information at the time this event starts
  def start!; end

  # Returns the value of attribute time.
  def time; end

  # Returns the value of attribute transaction_id.
  def transaction_id; end

  private

  def now; end

  # Likely on JRuby, TruffleRuby
  def now_allocations; end

  def now_cpu; end
end

# This is a default queue implementation that ships with Notifications.
# It just pushes events to all registered log subscribers.
#
# This class is thread safe. All methods are reentrant.
class ActiveSupport::Notifications::Fanout
  include ::Mutex_m

  def initialize; end

  def finish(name, id, payload, listeners = T.unsafe(nil)); end
  def iterate_guarding_exceptions(listeners); end
  def listeners_for(name); end
  def listening?(name); end
  def lock; end
  def locked?; end
  def publish(name, *args); end
  def publish_event(event); end
  def start(name, id, payload); end
  def subscribe(
    pattern = T.unsafe(nil),
    callable = T.unsafe(nil),
    monotonic: T.unsafe(nil),
    &block
  ); end
  def synchronize(&block); end
  def try_lock; end
  def unlock; end
  def unsubscribe(subscriber_or_name); end

  # This is a sync queue, so there is no waiting.
  def wait; end
end

module ActiveSupport::Notifications::Fanout::Subscribers
  class << self
    def new(pattern, listener, monotonic); end
  end
end

class ActiveSupport::Notifications::Fanout::Subscribers::EventObject < ::ActiveSupport::Notifications::Fanout::Subscribers::Evented
  def finish(name, id, payload); end
  def publish_event(event); end
  def start(name, id, payload); end

  private

  def build_event(name, id, payload); end
end

class ActiveSupport::Notifications::Fanout::Subscribers::Evented
  def initialize(pattern, delegate); end

  def finish(name, id, payload); end

  # Returns the value of attribute pattern.
  def pattern; end

  def publish(name, *args); end
  def publish_event(event); end
  def start(name, id, payload); end
  def subscribed_to?(name); end
  def unsubscribe!(name); end
end

class ActiveSupport::Notifications::Fanout::Subscribers::Matcher
  def initialize(pattern); end

  def ===(name); end

  # Returns the value of attribute exclusions.
  def exclusions; end

  # Returns the value of attribute pattern.
  def pattern; end

  def unsubscribe!(name); end

  class << self
    def wrap(pattern); end
  end
end

class ActiveSupport::Notifications::Fanout::Subscribers::Matcher::AllMessages
  def ===(name); end
  def unsubscribe!(*_arg0); end
end

class ActiveSupport::Notifications::Fanout::Subscribers::MonotonicTimed < ::ActiveSupport::Notifications::Fanout::Subscribers::Evented
  def finish(name, id, payload); end
  def publish(name, *args); end
  def start(name, id, payload); end
end

class ActiveSupport::Notifications::Fanout::Subscribers::Timed < ::ActiveSupport::Notifications::Fanout::Subscribers::Evented
  def finish(name, id, payload); end
  def publish(name, *args); end
  def start(name, id, payload); end
end

class ActiveSupport::Notifications::InstrumentationSubscriberError < ::RuntimeError
  def initialize(exceptions); end

  # Returns the value of attribute exceptions.
  def exceptions; end
end

# Instrumenters are stored in a thread local.
class ActiveSupport::Notifications::Instrumenter
  def initialize(notifier); end

  # Send a finish notification with +name+ and +payload+.
  def finish(name, payload); end

  def finish_with_state(listeners_state, name, payload); end

  # Returns the value of attribute id.
  def id; end

  # Given a block, instrument it by measuring the time taken to execute
  # and publish it. Without a block, simply send a message via the
  # notifier. Notice that events get sent even if an error occurs in the
  # passed-in block.
  def instrument(name, payload = T.unsafe(nil)); end

  def new_event(name, payload = T.unsafe(nil)); end

  # Send a start notification with +name+ and +payload+.
  def start(name, payload); end

  private

  def unique_id; end
end

module ActiveSupport::NumberHelper
  extend ::ActiveSupport::Autoload
  extend ::ActiveSupport::NumberHelper

  # Formats a +number+ into a currency string (e.g., $13.65). You
  # can customize the format in the +options+ hash.
  #
  # The currency unit and number formatting of the current locale will be used
  # unless otherwise specified in the provided options. No currency conversion
  # is performed. If the user is given a way to change their locale, they will
  # also be able to change the relative value of the currency displayed with
  # this helper. If your application will ever support multiple locales, you
  # may want to specify a constant <tt>:locale</tt> option or consider
  # using a library capable of currency conversion.
  #
  # ==== Options
  #
  # * <tt>:locale</tt> - Sets the locale to be used for formatting
  # (defaults to current locale).
  # * <tt>:precision</tt> - Sets the level of precision (defaults
  # to 2).
  # * <tt>:round_mode</tt> - Determine how rounding is performed
  # (defaults to :default. See BigDecimal::mode)
  # * <tt>:unit</tt> - Sets the denomination of the currency
  # (defaults to "$").
  # * <tt>:separator</tt> - Sets the separator between the units
  # (defaults to ".").
  # * <tt>:delimiter</tt> - Sets the thousands delimiter (defaults
  # to ",").
  # * <tt>:format</tt> - Sets the format for non-negative numbers
  # (defaults to "%u%n").  Fields are <tt>%u</tt> for the
  # currency, and <tt>%n</tt> for the number.
  # * <tt>:negative_format</tt> - Sets the format for negative
  # numbers (defaults to prepending a hyphen to the formatted
  # number given by <tt>:format</tt>).  Accepts the same fields
  # than <tt>:format</tt>, except <tt>%n</tt> is here the
  # absolute value of the number.
  # * <tt>:strip_insignificant_zeros</tt> - If +true+ removes
  # insignificant zeros after the decimal separator (defaults to
  # +false+).
  #
  # ==== Examples
  #
  # number_to_currency(1234567890.50)                # => "$1,234,567,890.50"
  # number_to_currency(1234567890.506)               # => "$1,234,567,890.51"
  # number_to_currency(1234567890.506, precision: 3) # => "$1,234,567,890.506"
  # number_to_currency(1234567890.506, locale: :fr)  # => "1 234 567 890,51 €"
  # number_to_currency('123a456')                    # => "$123a456"
  #
  # number_to_currency(-0.456789, precision: 0)
  # # => "$0"
  # number_to_currency(-1234567890.50, negative_format: '(%u%n)')
  # # => "($1,234,567,890.50)"
  # number_to_currency(1234567890.50, unit: '&pound;', separator: ',', delimiter: '')
  # # => "&pound;1234567890,50"
  # number_to_currency(1234567890.50, unit: '&pound;', separator: ',', delimiter: '', format: '%n %u')
  # # => "1234567890,50 &pound;"
  # number_to_currency(1234567890.50, strip_insignificant_zeros: true)
  # # => "$1,234,567,890.5"
  # number_to_currency(1234567890.50, precision: 0, round_mode: :up)
  # # => "$1,234,567,891"
  def number_to_currency(number, options = T.unsafe(nil)); end

  # Formats a +number+ with grouped thousands using +delimiter+
  # (e.g., 12,324). You can customize the format in the +options+
  # hash.
  #
  # ==== Options
  #
  # * <tt>:locale</tt> - Sets the locale to be used for formatting
  # (defaults to current locale).
  # * <tt>:delimiter</tt> - Sets the thousands delimiter (defaults
  # to ",").
  # * <tt>:separator</tt> - Sets the separator between the
  # fractional and integer digits (defaults to ".").
  # * <tt>:delimiter_pattern</tt> - Sets a custom regular expression used for
  # deriving the placement of delimiter. Helpful when using currency formats
  # like INR.
  #
  # ==== Examples
  #
  # number_to_delimited(12345678)                    # => "12,345,678"
  # number_to_delimited('123456')                    # => "123,456"
  # number_to_delimited(12345678.05)                 # => "12,345,678.05"
  # number_to_delimited(12345678, delimiter: '.')    # => "12.345.678"
  # number_to_delimited(12345678, delimiter: ',')    # => "12,345,678"
  # number_to_delimited(12345678.05, separator: ' ') # => "12,345,678 05"
  # number_to_delimited(12345678.05, locale: :fr)    # => "12 345 678,05"
  # number_to_delimited('112a')                      # => "112a"
  # number_to_delimited(98765432.98, delimiter: ' ', separator: ',')
  # # => "98 765 432,98"
  # number_to_delimited("123456.78",
  # delimiter_pattern: /(\d+?)(?=(\d\d)+(\d)(?!\d))/)
  # # => "1,23,456.78"
  def number_to_delimited(number, options = T.unsafe(nil)); end

  # Pretty prints (formats and approximates) a number in a way it
  # is more readable by humans (e.g.: 1200000000 becomes "1.2
  # Billion"). This is useful for numbers that can get very large
  # (and too hard to read).
  #
  # See <tt>number_to_human_size</tt> if you want to print a file
  # size.
  #
  # You can also define your own unit-quantifier names if you want
  # to use other decimal units (e.g.: 1500 becomes "1.5
  # kilometers", 0.150 becomes "150 milliliters", etc). You may
  # define a wide range of unit quantifiers, even fractional ones
  # (centi, deci, mili, etc).
  #
  # ==== Options
  #
  # * <tt>:locale</tt> - Sets the locale to be used for formatting
  # (defaults to current locale).
  # * <tt>:precision</tt> - Sets the precision of the number
  # (defaults to 3).
  # * <tt>:round_mode</tt> - Determine how rounding is performed
  # (defaults to :default. See BigDecimal::mode)
  # * <tt>:significant</tt> - If +true+, precision will be the number
  # of significant_digits. If +false+, the number of fractional
  # digits (defaults to +true+)
  # * <tt>:separator</tt> - Sets the separator between the
  # fractional and integer digits (defaults to ".").
  # * <tt>:delimiter</tt> - Sets the thousands delimiter (defaults
  # to "").
  # * <tt>:strip_insignificant_zeros</tt> - If +true+ removes
  # insignificant zeros after the decimal separator (defaults to
  # +true+)
  # * <tt>:units</tt> - A Hash of unit quantifier names. Or a
  # string containing an i18n scope where to find this hash. It
  # might have the following keys:
  # * *integers*: <tt>:unit</tt>, <tt>:ten</tt>,
  # <tt>:hundred</tt>, <tt>:thousand</tt>, <tt>:million</tt>,
  # <tt>:billion</tt>, <tt>:trillion</tt>,
  # <tt>:quadrillion</tt>
  # * *fractionals*: <tt>:deci</tt>, <tt>:centi</tt>,
  # <tt>:mili</tt>, <tt>:micro</tt>, <tt>:nano</tt>,
  # <tt>:pico</tt>, <tt>:femto</tt>
  # * <tt>:format</tt> - Sets the format of the output string
  # (defaults to "%n %u"). The field types are:
  # * %u - The quantifier (ex.: 'thousand')
  # * %n - The number
  #
  # ==== Examples
  #
  # number_to_human(123)                         # => "123"
  # number_to_human(1234)                        # => "1.23 Thousand"
  # number_to_human(12345)                       # => "12.3 Thousand"
  # number_to_human(1234567)                     # => "1.23 Million"
  # number_to_human(1234567890)                  # => "1.23 Billion"
  # number_to_human(1234567890123)               # => "1.23 Trillion"
  # number_to_human(1234567890123456)            # => "1.23 Quadrillion"
  # number_to_human(1234567890123456789)         # => "1230 Quadrillion"
  # number_to_human(489939, precision: 2)        # => "490 Thousand"
  # number_to_human(489939, precision: 4)        # => "489.9 Thousand"
  # number_to_human(489939, precision: 2
  # , round_mode: :down)   # => "480 Thousand"
  # number_to_human(1234567, precision: 4,
  # significant: false) # => "1.2346 Million"
  # number_to_human(1234567, precision: 1,
  # separator: ',',
  # significant: false) # => "1,2 Million"
  #
  # number_to_human(500000000, precision: 5)           # => "500 Million"
  # number_to_human(12345012345, significant: false)   # => "12.345 Billion"
  #
  # Non-significant zeros after the decimal separator are stripped
  # out by default (set <tt>:strip_insignificant_zeros</tt> to
  # +false+ to change that):
  #
  # number_to_human(12.00001)                                       # => "12"
  # number_to_human(12.00001, strip_insignificant_zeros: false)     # => "12.0"
  #
  # ==== Custom Unit Quantifiers
  #
  # You can also use your own custom unit quantifiers:
  # number_to_human(500000, units: { unit: 'ml', thousand: 'lt' })  # => "500 lt"
  #
  # If in your I18n locale you have:
  #
  # distance:
  # centi:
  # one: "centimeter"
  # other: "centimeters"
  # unit:
  # one: "meter"
  # other: "meters"
  # thousand:
  # one: "kilometer"
  # other: "kilometers"
  # billion: "gazillion-distance"
  #
  # Then you could do:
  #
  # number_to_human(543934, units: :distance)            # => "544 kilometers"
  # number_to_human(54393498, units: :distance)          # => "54400 kilometers"
  # number_to_human(54393498000, units: :distance)       # => "54.4 gazillion-distance"
  # number_to_human(343, units: :distance, precision: 1) # => "300 meters"
  # number_to_human(1, units: :distance)                 # => "1 meter"
  # number_to_human(0.34, units: :distance)              # => "34 centimeters"
  def number_to_human(number, options = T.unsafe(nil)); end

  # Formats the bytes in +number+ into a more understandable
  # representation (e.g., giving it 1500 yields 1.46 KB). This
  # method is useful for reporting file sizes to users. You can
  # customize the format in the +options+ hash.
  #
  # See <tt>number_to_human</tt> if you want to pretty-print a
  # generic number.
  #
  # ==== Options
  #
  # * <tt>:locale</tt> - Sets the locale to be used for formatting
  # (defaults to current locale).
  # * <tt>:precision</tt> - Sets the precision of the number
  # (defaults to 3).
  # * <tt>:round_mode</tt> - Determine how rounding is performed
  # (defaults to :default. See BigDecimal::mode)
  # * <tt>:significant</tt> - If +true+, precision will be the number
  # of significant_digits. If +false+, the number of fractional
  # digits (defaults to +true+)
  # * <tt>:separator</tt> - Sets the separator between the
  # fractional and integer digits (defaults to ".").
  # * <tt>:delimiter</tt> - Sets the thousands delimiter (defaults
  # to "").
  # * <tt>:strip_insignificant_zeros</tt> - If +true+ removes
  # insignificant zeros after the decimal separator (defaults to
  # +true+)
  #
  # ==== Examples
  #
  # number_to_human_size(123)                                    # => "123 Bytes"
  # number_to_human_size(1234)                                   # => "1.21 KB"
  # number_to_human_size(12345)                                  # => "12.1 KB"
  # number_to_human_size(1234567)                                # => "1.18 MB"
  # number_to_human_size(1234567890)                             # => "1.15 GB"
  # number_to_human_size(1234567890123)                          # => "1.12 TB"
  # number_to_human_size(1234567890123456)                       # => "1.1 PB"
  # number_to_human_size(1234567890123456789)                    # => "1.07 EB"
  # number_to_human_size(1234567, precision: 2)                  # => "1.2 MB"
  # number_to_human_size(483989, precision: 2)                   # => "470 KB"
  # number_to_human_size(483989, precision: 2, round_mode: :up)  # => "480 KB"
  # number_to_human_size(1234567, precision: 2, separator: ',')  # => "1,2 MB"
  # number_to_human_size(1234567890123, precision: 5)            # => "1.1228 TB"
  # number_to_human_size(524288000, precision: 5)                # => "500 MB"
  def number_to_human_size(number, options = T.unsafe(nil)); end

  # Formats a +number+ as a percentage string (e.g., 65%). You can
  # customize the format in the +options+ hash.
  #
  # ==== Options
  #
  # * <tt>:locale</tt> - Sets the locale to be used for formatting
  # (defaults to current locale).
  # * <tt>:precision</tt> - Sets the precision of the number
  # (defaults to 3). Keeps the number's precision if +nil+.
  # * <tt>:round_mode</tt> - Determine how rounding is performed
  # (defaults to :default. See BigDecimal::mode)
  # * <tt>:significant</tt> - If +true+, precision will be the number
  # of significant_digits. If +false+, the number of fractional
  # digits (defaults to +false+).
  # * <tt>:separator</tt> - Sets the separator between the
  # fractional and integer digits (defaults to ".").
  # * <tt>:delimiter</tt> - Sets the thousands delimiter (defaults
  # to "").
  # * <tt>:strip_insignificant_zeros</tt> - If +true+ removes
  # insignificant zeros after the decimal separator (defaults to
  # +false+).
  # * <tt>:format</tt> - Specifies the format of the percentage
  # string The number field is <tt>%n</tt> (defaults to "%n%").
  #
  # ==== Examples
  #
  # number_to_percentage(100)                                              # => "100.000%"
  # number_to_percentage('98')                                             # => "98.000%"
  # number_to_percentage(100, precision: 0)                                # => "100%"
  # number_to_percentage(1000, delimiter: '.', separator: ',')             # => "1.000,000%"
  # number_to_percentage(302.24398923423, precision: 5)                    # => "302.24399%"
  # number_to_percentage(1000, locale: :fr)                                # => "1000,000%"
  # number_to_percentage(1000, precision: nil)                             # => "1000%"
  # number_to_percentage('98a')                                            # => "98a%"
  # number_to_percentage(100, format: '%n  %')                             # => "100.000  %"
  # number_to_percentage(302.24398923423, precision: 5, round_mode: :down) # => "302.24398%"
  def number_to_percentage(number, options = T.unsafe(nil)); end

  # Formats a +number+ into a phone number (US by default e.g., (555)
  # 123-9876). You can customize the format in the +options+ hash.
  #
  # ==== Options
  #
  # * <tt>:area_code</tt> - Adds parentheses around the area code.
  # * <tt>:delimiter</tt> - Specifies the delimiter to use
  # (defaults to "-").
  # * <tt>:extension</tt> - Specifies an extension to add to the
  # end of the generated number.
  # * <tt>:country_code</tt> - Sets the country code for the phone
  # number.
  # * <tt>:pattern</tt> - Specifies how the number is divided into three
  # groups with the custom regexp to override the default format.
  # ==== Examples
  #
  # number_to_phone(5551234)                                     # => "555-1234"
  # number_to_phone('5551234')                                   # => "555-1234"
  # number_to_phone(1235551234)                                  # => "123-555-1234"
  # number_to_phone(1235551234, area_code: true)                 # => "(123) 555-1234"
  # number_to_phone(1235551234, delimiter: ' ')                  # => "123 555 1234"
  # number_to_phone(1235551234, area_code: true, extension: 555) # => "(123) 555-1234 x 555"
  # number_to_phone(1235551234, country_code: 1)                 # => "+1-123-555-1234"
  # number_to_phone('123a456')                                   # => "123a456"
  #
  # number_to_phone(1235551234, country_code: 1, extension: 1343, delimiter: '.')
  # # => "+1.123.555.1234 x 1343"
  #
  # number_to_phone(75561234567, pattern: /(\d{1,4})(\d{4})(\d{4})$/, area_code: true)
  # # => "(755) 6123-4567"
  # number_to_phone(13312345678, pattern: /(\d{3})(\d{4})(\d{4})$/)
  # # => "133-1234-5678"
  def number_to_phone(number, options = T.unsafe(nil)); end

  # Formats a +number+ with the specified level of
  # <tt>:precision</tt> (e.g., 112.32 has a precision of 2 if
  # +:significant+ is +false+, and 5 if +:significant+ is +true+).
  # You can customize the format in the +options+ hash.
  #
  # ==== Options
  #
  # * <tt>:locale</tt> - Sets the locale to be used for formatting
  # (defaults to current locale).
  # * <tt>:precision</tt> - Sets the precision of the number
  # (defaults to 3). Keeps the number's precision if +nil+.
  # * <tt>:round_mode</tt> - Determine how rounding is performed
  # (defaults to :default. See BigDecimal::mode)
  # * <tt>:significant</tt> - If +true+, precision will be the number
  # of significant_digits. If +false+, the number of fractional
  # digits (defaults to +false+).
  # * <tt>:separator</tt> - Sets the separator between the
  # fractional and integer digits (defaults to ".").
  # * <tt>:delimiter</tt> - Sets the thousands delimiter (defaults
  # to "").
  # * <tt>:strip_insignificant_zeros</tt> - If +true+ removes
  # insignificant zeros after the decimal separator (defaults to
  # +false+).
  #
  # ==== Examples
  #
  # number_to_rounded(111.2345)                                  # => "111.235"
  # number_to_rounded(111.2345, precision: 2)                    # => "111.23"
  # number_to_rounded(13, precision: 5)                          # => "13.00000"
  # number_to_rounded(389.32314, precision: 0)                   # => "389"
  # number_to_rounded(111.2345, significant: true)               # => "111"
  # number_to_rounded(111.2345, precision: 1, significant: true) # => "100"
  # number_to_rounded(13, precision: 5, significant: true)       # => "13.000"
  # number_to_rounded(13, precision: nil)                        # => "13"
  # number_to_rounded(389.32314, precision: 0, round_mode: :up)  # => "390"
  # number_to_rounded(111.234, locale: :fr)                      # => "111,234"
  #
  # number_to_rounded(13, precision: 5, significant: true, strip_insignificant_zeros: true)
  # # => "13"
  #
  # number_to_rounded(389.32314, precision: 4, significant: true) # => "389.3"
  # number_to_rounded(1111.2345, precision: 2, separator: ',', delimiter: '.')
  # # => "1.111,23"
  def number_to_rounded(number, options = T.unsafe(nil)); end
end

class ActiveSupport::NumberHelper::NumberConverter
  def initialize(number, options); end

  def execute; end
  def namespace; end
  def namespace=(_arg0); end
  def namespace?; end

  # Returns the value of attribute number.
  def number; end

  # Returns the value of attribute opts.
  def opts; end

  def validate_float; end
  def validate_float=(_arg0); end
  def validate_float?; end

  private

  def default_format_options; end
  def default_value(key); end
  def format_options; end
  def i18n_format_options; end
  def options; end
  def translate_in_locale(key, **i18n_options); end
  def translate_number_value_with_default(key, **i18n_options); end
  def valid_float?; end

  class << self
    def convert(number, options); end
    def namespace; end
    def namespace=(value); end
    def namespace?; end
    def validate_float; end
    def validate_float=(value); end
    def validate_float?; end
  end
end

ActiveSupport::NumberHelper::NumberConverter::DEFAULTS =
  T.let(T.unsafe(nil), Hash)

class ActiveSupport::NumberHelper::NumberToCurrencyConverter < ::ActiveSupport::NumberHelper::NumberConverter
  def convert; end

  private

  def i18n_opts; end
  def options; end

  class << self
    def namespace; end
  end
end

class ActiveSupport::NumberHelper::NumberToDelimitedConverter < ::ActiveSupport::NumberHelper::NumberConverter
  def convert; end

  private

  def delimiter_pattern; end
  def parts; end

  class << self
    def validate_float; end
  end
end

ActiveSupport::NumberHelper::NumberToDelimitedConverter::DEFAULT_DELIMITER_REGEX =
  T.let(T.unsafe(nil), Regexp)

class ActiveSupport::NumberHelper::NumberToHumanConverter < ::ActiveSupport::NumberHelper::NumberConverter
  def convert; end

  private

  def calculate_exponent(units); end
  def determine_unit(units, exponent); end
  def format; end
  def unit_exponents(units); end

  class << self
    def namespace; end
    def validate_float; end
  end
end

ActiveSupport::NumberHelper::NumberToHumanConverter::DECIMAL_UNITS =
  T.let(T.unsafe(nil), Hash)
ActiveSupport::NumberHelper::NumberToHumanConverter::INVERTED_DECIMAL_UNITS =
  T.let(T.unsafe(nil), Hash)

class ActiveSupport::NumberHelper::NumberToHumanSizeConverter < ::ActiveSupport::NumberHelper::NumberConverter
  def convert; end

  private

  def base; end
  def conversion_format; end
  def exponent; end
  def smaller_than_base?; end
  def storage_unit_key; end
  def unit; end

  class << self
    def namespace; end
    def validate_float; end
  end
end

ActiveSupport::NumberHelper::NumberToHumanSizeConverter::STORAGE_UNITS =
  T.let(T.unsafe(nil), Array)

class ActiveSupport::NumberHelper::NumberToPercentageConverter < ::ActiveSupport::NumberHelper::NumberConverter
  def convert; end

  class << self
    def namespace; end
  end
end

class ActiveSupport::NumberHelper::NumberToPhoneConverter < ::ActiveSupport::NumberHelper::NumberConverter
  def convert; end

  private

  def convert_to_phone_number(number); end
  def convert_with_area_code(number); end
  def convert_without_area_code(number); end
  def country_code(code); end
  def delimiter; end
  def phone_ext(ext); end
  def regexp_pattern(default_pattern); end
  def start_with_delimiter?(number); end
end

class ActiveSupport::NumberHelper::NumberToRoundedConverter < ::ActiveSupport::NumberHelper::NumberConverter
  def convert; end

  private

  def format_number(number); end
  def strip_insignificant_zeros; end

  class << self
    def namespace; end
    def validate_float; end
  end
end

class ActiveSupport::NumberHelper::RoundingHelper
  def initialize(options); end

  def digit_count(number); end

  # Returns the value of attribute options.
  def options; end

  def round(number); end

  private

  def absolute_precision(number); end
  def convert_to_decimal(number); end
end

module ActiveSupport::NumericWithFormat
  # Provides options for converting numbers into formatted strings.
  # Options are provided for phone numbers, currency, percentage,
  # precision, positional notation, file size and pretty printing.
  #
  # This method is aliased to <tt>to_fs</tt>.
  #
  # ==== Options
  #
  # For details on which formats use which options, see ActiveSupport::NumberHelper
  #
  # ==== Examples
  #
  # Phone Numbers:
  # 5551234.to_formatted_s(:phone)                                     # => "555-1234"
  # 1235551234.to_formatted_s(:phone)                                  # => "123-555-1234"
  # 1235551234.to_formatted_s(:phone, area_code: true)                 # => "(123) 555-1234"
  # 1235551234.to_formatted_s(:phone, delimiter: ' ')                  # => "123 555 1234"
  # 1235551234.to_formatted_s(:phone, area_code: true, extension: 555) # => "(123) 555-1234 x 555"
  # 1235551234.to_formatted_s(:phone, country_code: 1)                 # => "+1-123-555-1234"
  # 1235551234.to_formatted_s(:phone, country_code: 1, extension: 1343, delimiter: '.')
  # # => "+1.123.555.1234 x 1343"
  #
  # Currency:
  # 1234567890.50.to_formatted_s(:currency)                     # => "$1,234,567,890.50"
  # 1234567890.506.to_formatted_s(:currency)                    # => "$1,234,567,890.51"
  # 1234567890.506.to_formatted_s(:currency, precision: 3)      # => "$1,234,567,890.506"
  # 1234567890.506.to_formatted_s(:currency, round_mode: :down) # => "$1,234,567,890.50"
  # 1234567890.506.to_formatted_s(:currency, locale: :fr)       # => "1 234 567 890,51 €"
  # -1234567890.50.to_formatted_s(:currency, negative_format: '(%u%n)')
  # # => "($1,234,567,890.50)"
  # 1234567890.50.to_formatted_s(:currency, unit: '&pound;', separator: ',', delimiter: '')
  # # => "&pound;1234567890,50"
  # 1234567890.50.to_formatted_s(:currency, unit: '&pound;', separator: ',', delimiter: '', format: '%n %u')
  # # => "1234567890,50 &pound;"
  #
  # Percentage:
  # 100.to_formatted_s(:percentage)                                  # => "100.000%"
  # 100.to_formatted_s(:percentage, precision: 0)                    # => "100%"
  # 1000.to_formatted_s(:percentage, delimiter: '.', separator: ',') # => "1.000,000%"
  # 302.24398923423.to_formatted_s(:percentage, precision: 5)        # => "302.24399%"
  # 302.24398923423.to_formatted_s(:percentage, round_mode: :down)   # => "302.243%"
  # 1000.to_formatted_s(:percentage, locale: :fr)                    # => "1 000,000%"
  # 100.to_formatted_s(:percentage, format: '%n  %')                 # => "100.000  %"
  #
  # Delimited:
  # 12345678.to_formatted_s(:delimited)                     # => "12,345,678"
  # 12345678.05.to_formatted_s(:delimited)                  # => "12,345,678.05"
  # 12345678.to_formatted_s(:delimited, delimiter: '.')     # => "12.345.678"
  # 12345678.to_formatted_s(:delimited, delimiter: ',')     # => "12,345,678"
  # 12345678.05.to_formatted_s(:delimited, separator: ' ')  # => "12,345,678 05"
  # 12345678.05.to_formatted_s(:delimited, locale: :fr)     # => "12 345 678,05"
  # 98765432.98.to_formatted_s(:delimited, delimiter: ' ', separator: ',')
  # # => "98 765 432,98"
  #
  # Rounded:
  # 111.2345.to_formatted_s(:rounded)                                      # => "111.235"
  # 111.2345.to_formatted_s(:rounded, precision: 2)                        # => "111.23"
  # 111.2345.to_formatted_s(:rounded, precision: 2, round_mode: :up)       # => "111.24"
  # 13.to_formatted_s(:rounded, precision: 5)                              # => "13.00000"
  # 389.32314.to_formatted_s(:rounded, precision: 0)                       # => "389"
  # 111.2345.to_formatted_s(:rounded, significant: true)                   # => "111"
  # 111.2345.to_formatted_s(:rounded, precision: 1, significant: true)     # => "100"
  # 13.to_formatted_s(:rounded, precision: 5, significant: true)           # => "13.000"
  # 111.234.to_formatted_s(:rounded, locale: :fr)                          # => "111,234"
  # 13.to_formatted_s(:rounded, precision: 5, significant: true, strip_insignificant_zeros: true)
  # # => "13"
  # 389.32314.to_formatted_s(:rounded, precision: 4, significant: true)    # => "389.3"
  # 1111.2345.to_formatted_s(:rounded, precision: 2, separator: ',', delimiter: '.')
  # # => "1.111,23"
  #
  # Human-friendly size in Bytes:
  # 123.to_formatted_s(:human_size)                                    # => "123 Bytes"
  # 1234.to_formatted_s(:human_size)                                   # => "1.21 KB"
  # 12345.to_formatted_s(:human_size)                                  # => "12.1 KB"
  # 1234567.to_formatted_s(:human_size)                                # => "1.18 MB"
  # 1234567890.to_formatted_s(:human_size)                             # => "1.15 GB"
  # 1234567890123.to_formatted_s(:human_size)                          # => "1.12 TB"
  # 1234567890123456.to_formatted_s(:human_size)                       # => "1.1 PB"
  # 1234567890123456789.to_formatted_s(:human_size)                    # => "1.07 EB"
  # 1234567.to_formatted_s(:human_size, precision: 2)                  # => "1.2 MB"
  # 1234567.to_formatted_s(:human_size, precision: 2, round_mode: :up) # => "1.3 MB"
  # 483989.to_formatted_s(:human_size, precision: 2)                   # => "470 KB"
  # 1234567.to_formatted_s(:human_size, precision: 2, separator: ',')  # => "1,2 MB"
  # 1234567890123.to_formatted_s(:human_size, precision: 5)            # => "1.1228 TB"
  # 524288000.to_formatted_s(:human_size, precision: 5)                # => "500 MB"
  #
  # Human-friendly format:
  # 123.to_formatted_s(:human)                                       # => "123"
  # 1234.to_formatted_s(:human)                                      # => "1.23 Thousand"
  # 12345.to_formatted_s(:human)                                     # => "12.3 Thousand"
  # 1234567.to_formatted_s(:human)                                   # => "1.23 Million"
  # 1234567890.to_formatted_s(:human)                                # => "1.23 Billion"
  # 1234567890123.to_formatted_s(:human)                             # => "1.23 Trillion"
  # 1234567890123456.to_formatted_s(:human)                          # => "1.23 Quadrillion"
  # 1234567890123456789.to_formatted_s(:human)                       # => "1230 Quadrillion"
  # 489939.to_formatted_s(:human, precision: 2)                      # => "490 Thousand"
  # 489939.to_formatted_s(:human, precision: 2, round_mode: :down)   # => "480 Thousand"
  # 489939.to_formatted_s(:human, precision: 4)                      # => "489.9 Thousand"
  # 1234567.to_formatted_s(:human, precision: 4,
  # significant: false)                             # => "1.2346 Million"
  # 1234567.to_formatted_s(:human, precision: 1,
  # separator: ',',
  # significant: false)                             # => "1,2 Million"
  def to_formatted_s(format = T.unsafe(nil), options = T.unsafe(nil)); end

  # Provides options for converting numbers into formatted strings.
  # Options are provided for phone numbers, currency, percentage,
  # precision, positional notation, file size and pretty printing.
  #
  # This method is aliased to <tt>to_fs</tt>.
  #
  # ==== Options
  #
  # For details on which formats use which options, see ActiveSupport::NumberHelper
  #
  # ==== Examples
  #
  # Phone Numbers:
  # 5551234.to_formatted_s(:phone)                                     # => "555-1234"
  # 1235551234.to_formatted_s(:phone)                                  # => "123-555-1234"
  # 1235551234.to_formatted_s(:phone, area_code: true)                 # => "(123) 555-1234"
  # 1235551234.to_formatted_s(:phone, delimiter: ' ')                  # => "123 555 1234"
  # 1235551234.to_formatted_s(:phone, area_code: true, extension: 555) # => "(123) 555-1234 x 555"
  # 1235551234.to_formatted_s(:phone, country_code: 1)                 # => "+1-123-555-1234"
  # 1235551234.to_formatted_s(:phone, country_code: 1, extension: 1343, delimiter: '.')
  # # => "+1.123.555.1234 x 1343"
  #
  # Currency:
  # 1234567890.50.to_formatted_s(:currency)                     # => "$1,234,567,890.50"
  # 1234567890.506.to_formatted_s(:currency)                    # => "$1,234,567,890.51"
  # 1234567890.506.to_formatted_s(:currency, precision: 3)      # => "$1,234,567,890.506"
  # 1234567890.506.to_formatted_s(:currency, round_mode: :down) # => "$1,234,567,890.50"
  # 1234567890.506.to_formatted_s(:currency, locale: :fr)       # => "1 234 567 890,51 €"
  # -1234567890.50.to_formatted_s(:currency, negative_format: '(%u%n)')
  # # => "($1,234,567,890.50)"
  # 1234567890.50.to_formatted_s(:currency, unit: '&pound;', separator: ',', delimiter: '')
  # # => "&pound;1234567890,50"
  # 1234567890.50.to_formatted_s(:currency, unit: '&pound;', separator: ',', delimiter: '', format: '%n %u')
  # # => "1234567890,50 &pound;"
  #
  # Percentage:
  # 100.to_formatted_s(:percentage)                                  # => "100.000%"
  # 100.to_formatted_s(:percentage, precision: 0)                    # => "100%"
  # 1000.to_formatted_s(:percentage, delimiter: '.', separator: ',') # => "1.000,000%"
  # 302.24398923423.to_formatted_s(:percentage, precision: 5)        # => "302.24399%"
  # 302.24398923423.to_formatted_s(:percentage, round_mode: :down)   # => "302.243%"
  # 1000.to_formatted_s(:percentage, locale: :fr)                    # => "1 000,000%"
  # 100.to_formatted_s(:percentage, format: '%n  %')                 # => "100.000  %"
  #
  # Delimited:
  # 12345678.to_formatted_s(:delimited)                     # => "12,345,678"
  # 12345678.05.to_formatted_s(:delimited)                  # => "12,345,678.05"
  # 12345678.to_formatted_s(:delimited, delimiter: '.')     # => "12.345.678"
  # 12345678.to_formatted_s(:delimited, delimiter: ',')     # => "12,345,678"
  # 12345678.05.to_formatted_s(:delimited, separator: ' ')  # => "12,345,678 05"
  # 12345678.05.to_formatted_s(:delimited, locale: :fr)     # => "12 345 678,05"
  # 98765432.98.to_formatted_s(:delimited, delimiter: ' ', separator: ',')
  # # => "98 765 432,98"
  #
  # Rounded:
  # 111.2345.to_formatted_s(:rounded)                                      # => "111.235"
  # 111.2345.to_formatted_s(:rounded, precision: 2)                        # => "111.23"
  # 111.2345.to_formatted_s(:rounded, precision: 2, round_mode: :up)       # => "111.24"
  # 13.to_formatted_s(:rounded, precision: 5)                              # => "13.00000"
  # 389.32314.to_formatted_s(:rounded, precision: 0)                       # => "389"
  # 111.2345.to_formatted_s(:rounded, significant: true)                   # => "111"
  # 111.2345.to_formatted_s(:rounded, precision: 1, significant: true)     # => "100"
  # 13.to_formatted_s(:rounded, precision: 5, significant: true)           # => "13.000"
  # 111.234.to_formatted_s(:rounded, locale: :fr)                          # => "111,234"
  # 13.to_formatted_s(:rounded, precision: 5, significant: true, strip_insignificant_zeros: true)
  # # => "13"
  # 389.32314.to_formatted_s(:rounded, precision: 4, significant: true)    # => "389.3"
  # 1111.2345.to_formatted_s(:rounded, precision: 2, separator: ',', delimiter: '.')
  # # => "1.111,23"
  #
  # Human-friendly size in Bytes:
  # 123.to_formatted_s(:human_size)                                    # => "123 Bytes"
  # 1234.to_formatted_s(:human_size)                                   # => "1.21 KB"
  # 12345.to_formatted_s(:human_size)                                  # => "12.1 KB"
  # 1234567.to_formatted_s(:human_size)                                # => "1.18 MB"
  # 1234567890.to_formatted_s(:human_size)                             # => "1.15 GB"
  # 1234567890123.to_formatted_s(:human_size)                          # => "1.12 TB"
  # 1234567890123456.to_formatted_s(:human_size)                       # => "1.1 PB"
  # 1234567890123456789.to_formatted_s(:human_size)                    # => "1.07 EB"
  # 1234567.to_formatted_s(:human_size, precision: 2)                  # => "1.2 MB"
  # 1234567.to_formatted_s(:human_size, precision: 2, round_mode: :up) # => "1.3 MB"
  # 483989.to_formatted_s(:human_size, precision: 2)                   # => "470 KB"
  # 1234567.to_formatted_s(:human_size, precision: 2, separator: ',')  # => "1,2 MB"
  # 1234567890123.to_formatted_s(:human_size, precision: 5)            # => "1.1228 TB"
  # 524288000.to_formatted_s(:human_size, precision: 5)                # => "500 MB"
  #
  # Human-friendly format:
  # 123.to_formatted_s(:human)                                       # => "123"
  # 1234.to_formatted_s(:human)                                      # => "1.23 Thousand"
  # 12345.to_formatted_s(:human)                                     # => "12.3 Thousand"
  # 1234567.to_formatted_s(:human)                                   # => "1.23 Million"
  # 1234567890.to_formatted_s(:human)                                # => "1.23 Billion"
  # 1234567890123.to_formatted_s(:human)                             # => "1.23 Trillion"
  # 1234567890123456.to_formatted_s(:human)                          # => "1.23 Quadrillion"
  # 1234567890123456789.to_formatted_s(:human)                       # => "1230 Quadrillion"
  # 489939.to_formatted_s(:human, precision: 2)                      # => "490 Thousand"
  # 489939.to_formatted_s(:human, precision: 2, round_mode: :down)   # => "480 Thousand"
  # 489939.to_formatted_s(:human, precision: 4)                      # => "489.9 Thousand"
  # 1234567.to_formatted_s(:human, precision: 4,
  # significant: false)                             # => "1.2346 Million"
  # 1234567.to_formatted_s(:human, precision: 1,
  # separator: ',',
  # significant: false)                             # => "1,2 Million"
  def to_fs(format = T.unsafe(nil), options = T.unsafe(nil)); end
end

class ActiveSupport::OptionMerger
  def initialize(context, options); end

  private

  def method_missing(method, *arguments, &block); end
  def respond_to_missing?(*arguments); end
end

# DEPRECATED: <tt>ActiveSupport::OrderedHash</tt> implements a hash that preserves
# insertion order.
#
# oh = ActiveSupport::OrderedHash.new
# oh[:a] = 1
# oh[:b] = 2
# oh.keys # => [:a, :b], this order is guaranteed
#
# Also, maps the +omap+ feature for YAML files
# (See https://yaml.org/type/omap.html) to support ordered items
# when loading from yaml.
#
# <tt>ActiveSupport::OrderedHash</tt> is namespaced to prevent conflicts
# with other implementations.
class ActiveSupport::OrderedHash < ::Hash
  def encode_with(coder); end

  # Returns true to make sure that this hash is extractable via <tt>Array#extract_options!</tt>
  def extractable_options?; end

  def nested_under_indifferent_access; end
  def reject(*args, &block); end
  def select(*args, &block); end
  def to_yaml_type; end
end

# +OrderedOptions+ inherits from +Hash+ and provides dynamic accessor methods.
#
# With a +Hash+, key-value pairs are typically managed like this:
#
# h = {}
# h[:boy] = 'John'
# h[:girl] = 'Mary'
# h[:boy]  # => 'John'
# h[:girl] # => 'Mary'
# h[:dog]  # => nil
#
# Using +OrderedOptions+, the above code can be written as:
#
# h = ActiveSupport::OrderedOptions.new
# h.boy = 'John'
# h.girl = 'Mary'
# h.boy  # => 'John'
# h.girl # => 'Mary'
# h.dog  # => nil
#
# To raise an exception when the value is blank, append a
# bang to the key name, like:
#
# h.dog! # => raises KeyError: :dog is blank
class ActiveSupport::OrderedOptions < ::Hash
  def [](key); end
  def []=(key, value); end
  def extractable_options?; end
  def inspect; end
  def method_missing(name, *args); end

  protected

  # preserve the original #[] method
  def _get(_arg0); end

  private

  def respond_to_missing?(name, include_private); end
end

# +ParameterFilter+ allows you to specify keys for sensitive data from
# hash-like object and replace corresponding value. Filtering only certain
# sub-keys from a hash is possible by using the dot notation:
# 'credit_card.number'. If a proc is given, each key and value of a hash and
# all sub-hashes are passed to it, where the value or the key can be replaced
# using String#replace or similar methods.
#
# ActiveSupport::ParameterFilter.new([:password])
# => replaces the value to all keys matching /password/i with "[FILTERED]"
#
# ActiveSupport::ParameterFilter.new([:foo, "bar"])
# => replaces the value to all keys matching /foo|bar/i with "[FILTERED]"
#
# ActiveSupport::ParameterFilter.new([/\Apin\z/i, /\Apin_/i])
# => replaces the value for the exact (case-insensitive) key 'pin' and all
# (case-insensitive) keys beginning with 'pin_', with "[FILTERED]".
# Does not match keys with 'pin' as a substring, such as 'shipping_id'.
#
# ActiveSupport::ParameterFilter.new(["credit_card.code"])
# => replaces { credit_card: {code: "xxxx"} } with "[FILTERED]", does not
# change { file: { code: "xxxx"} }
#
# ActiveSupport::ParameterFilter.new([-> (k, v) do
# v.reverse! if /secret/i.match?(k)
# end])
# => reverses the value to all keys matching /secret/i
class ActiveSupport::ParameterFilter
  # Create instance with given filters. Supported type of filters are +String+, +Regexp+, and +Proc+.
  # Other types of filters are treated as +String+ using +to_s+.
  # For +Proc+ filters, key, value, and optional original hash is passed to block arguments.
  #
  # ==== Options
  #
  # * <tt>:mask</tt> - A replaced object when filtered. Defaults to <tt>"[FILTERED]"</tt>.
  def initialize(filters = T.unsafe(nil), mask: T.unsafe(nil)); end

  # Mask value of +params+ if key matches one of filters.
  def filter(params); end

  # Returns filtered value for given key. For +Proc+ filters, third block argument is not populated.
  def filter_param(key, value); end

  private

  def compiled_filter; end
end

class ActiveSupport::ParameterFilter::CompiledFilter
  def initialize(regexps, deep_regexps, blocks, mask:); end

  # Returns the value of attribute blocks.
  def blocks; end

  def call(
    params,
    parents = T.unsafe(nil),
    original_params = T.unsafe(nil)
  ); end

  # Returns the value of attribute deep_regexps.
  def deep_regexps; end

  # Returns the value of attribute regexps.
  def regexps; end

  def value_for_key(
    key,
    value,
    parents = T.unsafe(nil),
    original_params = T.unsafe(nil)
  ); end

  class << self
    def compile(filters, mask:); end
  end
end

ActiveSupport::ParameterFilter::FILTERED = T.let(T.unsafe(nil), String)

# NOTE: This approach has been deprecated for end-user code in favor of {thread_mattr_accessor}[rdoc-ref:Module#thread_mattr_accessor] and friends.
# Please use that approach instead.
#
# This module is used to encapsulate access to thread local variables.
#
# Instead of polluting the thread locals namespace:
#
# Thread.current[:connection_handler]
#
# you define a class that extends this module:
#
# module ActiveRecord
# class RuntimeRegistry
# extend ActiveSupport::PerThreadRegistry
#
# attr_accessor :connection_handler
# end
# end
#
# and invoke the declared instance accessors as class methods. So
#
# ActiveRecord::RuntimeRegistry.connection_handler = connection_handler
#
# sets a connection handler local to the current thread, and
#
# ActiveRecord::RuntimeRegistry.connection_handler
#
# returns a connection handler local to the current thread.
#
# This feature is accomplished by instantiating the class and storing the
# instance as a thread local keyed by the class name. In the example above
# a key "ActiveRecord::RuntimeRegistry" is stored in <tt>Thread.current</tt>.
# The class methods proxy to said thread local instance.
#
# If the class has an initializer, it must accept no arguments.
module ActiveSupport::PerThreadRegistry
  def instance; end

  private

  def method_missing(name, *args, &block); end

  class << self
    def extended(object); end
  end
end

# A class with no predefined methods that behaves similarly to Builder's
# BlankSlate. Used for proxy classes.
class ActiveSupport::ProxyObject < ::BasicObject
  # Let ActiveSupport::ProxyObject at least raise exceptions.
  def raise(*args); end
end

class ActiveSupport::Railtie < ::Rails::Railtie
end

module ActiveSupport::RangeWithFormat
  # Convert range to a formatted string. See RANGE_FORMATS for predefined formats.
  #
  # This method is aliased to <tt>to_fs</tt>.
  #
  # range = (1..100)           # => 1..100
  #
  # range.to_s                 # => "1..100"
  # range.to_formatted_s(:db)            # => "BETWEEN '1' AND '100'"
  #
  # == Adding your own range formats to to_s
  # You can add your own formats to the Range::RANGE_FORMATS hash.
  # Use the format name as the hash key and a Proc instance.
  #
  # # config/initializers/range_formats.rb
  # Range::RANGE_FORMATS[:short] = ->(start, stop) { "Between #{start.to_formatted_s(:db)} and #{stop.to_formatted_s(:db)}" }
  def to_formatted_s(format = T.unsafe(nil)); end

  # Convert range to a formatted string. See RANGE_FORMATS for predefined formats.
  #
  # This method is aliased to <tt>to_fs</tt>.
  #
  # range = (1..100)           # => 1..100
  #
  # range.to_s                 # => "1..100"
  # range.to_formatted_s(:db)            # => "BETWEEN '1' AND '100'"
  #
  # == Adding your own range formats to to_s
  # You can add your own formats to the Range::RANGE_FORMATS hash.
  # Use the format name as the hash key and a Proc instance.
  #
  # # config/initializers/range_formats.rb
  # Range::RANGE_FORMATS[:short] = ->(start, stop) { "Between #{start.to_formatted_s(:db)} and #{stop.to_formatted_s(:db)}" }
  def to_fs(format = T.unsafe(nil)); end
end

ActiveSupport::RangeWithFormat::RANGE_FORMATS = T.let(T.unsafe(nil), Hash)

# --
# This class defines several callbacks:
#
# to_prepare -- Run once at application startup, and also from
# +to_run+.
#
# to_run -- Run before a work run that is reloading. If
# +reload_classes_only_on_change+ is true (the default), the class
# unload will have already occurred.
#
# to_complete -- Run after a work run that has reloaded. If
# +reload_classes_only_on_change+ is false, the class unload will
# have occurred after the work run, but before this callback.
#
# before_class_unload -- Run immediately before the classes are
# unloaded.
#
# after_class_unload -- Run immediately after the classes are
# unloaded.
class ActiveSupport::Reloader < ::ActiveSupport::ExecutionWrapper
  def initialize; end

  def _class_unload_callbacks; end
  def _prepare_callbacks; end
  def _run_class_unload_callbacks(&block); end
  def _run_prepare_callbacks(&block); end
  def check; end
  def check=(_arg0); end
  def check?; end
  def class_unload!(&block); end
  def complete!; end
  def executor; end
  def executor=(_arg0); end
  def executor?; end

  # Release the unload lock if it has been previously obtained
  def release_unload_lock!; end

  # Acquire the ActiveSupport::Dependencies::Interlock unload lock,
  # ensuring it will be released automatically
  def require_unload_lock!; end

  def run!; end

  class << self
    def __callbacks; end
    def _class_unload_callbacks; end
    def _class_unload_callbacks=(value); end
    def _prepare_callbacks; end
    def _prepare_callbacks=(value); end

    # Registers a callback that will run immediately after the classes are unloaded.
    def after_class_unload(*args, &block); end

    # Registers a callback that will run immediately before the classes are unloaded.
    def before_class_unload(*args, &block); end

    def check; end
    def check!; end
    def check=(value); end
    def check?; end
    def executor; end
    def executor=(value); end
    def executor?; end
    def prepare!; end

    # Initiate a manual reload
    def reload!; end

    def reloaded!; end
    def run!; end

    # Registers a callback that will run once at application startup and every time the code is reloaded.
    def to_prepare(*args, &block); end

    # Run the supplied block as a work unit, reloading code as needed
    def wrap; end
  end
end

# Rescuable module adds support for easier exception handling.
module ActiveSupport::Rescuable
  extend ::ActiveSupport::Concern
  include GeneratedInstanceMethods

  mixes_in_class_methods GeneratedClassMethods
  mixes_in_class_methods ::ActiveSupport::Rescuable::ClassMethods

  # Internal handler lookup. Delegates to class method. Some libraries call
  # this directly, so keeping it around for compatibility.
  def handler_for_rescue(exception); end

  # Delegates to the class method, but uses the instance as the subject for
  # rescue_from handlers (method calls, instance_exec blocks).
  def rescue_with_handler(exception); end

  module GeneratedClassMethods
    def rescue_handlers; end
    def rescue_handlers=(value); end
    def rescue_handlers?; end
  end

  module GeneratedInstanceMethods
    def rescue_handlers; end
    def rescue_handlers=(value); end
    def rescue_handlers?; end
  end
end

module ActiveSupport::Rescuable::ClassMethods
  def handler_for_rescue(exception, object: T.unsafe(nil)); end

  # Registers exception classes with a handler to be called by <tt>rescue_with_handler</tt>.
  #
  # <tt>rescue_from</tt> receives a series of exception classes or class
  # names, and an exception handler specified by a trailing <tt>:with</tt>
  # option containing the name of a method or a Proc object. Alternatively, a block
  # can be given as the handler.
  #
  # Handlers that take one argument will be called with the exception, so
  # that the exception can be inspected when dealing with it.
  #
  # Handlers are inherited. They are searched from right to left, from
  # bottom to top, and up the hierarchy. The handler of the first class for
  # which <tt>exception.is_a?(klass)</tt> holds true is the one invoked, if
  # any.
  #
  # class ApplicationController < ActionController::Base
  # rescue_from User::NotAuthorized, with: :deny_access # self defined exception
  # rescue_from ActiveRecord::RecordInvalid, with: :show_errors
  #
  # rescue_from 'MyAppError::Base' do |exception|
  # render xml: exception, status: 500
  # end
  #
  # private
  # def deny_access
  # ...
  # end
  #
  # def show_errors(exception)
  # exception.record.new_record? ? ...
  # end
  # end
  #
  # Exceptions raised inside exception handlers are not propagated up.
  def rescue_from(*klasses, with: T.unsafe(nil), &block); end

  # Matches an exception to a handler based on the exception class.
  #
  # If no handler matches the exception, check for a handler matching the
  # (optional) exception.cause. If no handler matches the exception or its
  # cause, this returns +nil+, so you can deal with unhandled exceptions.
  # Be sure to re-raise unhandled exceptions if this is what you expect.
  #
  # begin
  # …
  # rescue => exception
  # rescue_with_handler(exception) || raise
  # end
  #
  # Returns the exception if it was handled and +nil+ if it was not.
  def rescue_with_handler(
    exception,
    object: T.unsafe(nil),
    visited_exceptions: T.unsafe(nil)
  ); end

  private

  def constantize_rescue_handler_class(class_or_name); end
  def find_rescue_handler(exception); end
end

module ActiveSupport::RubyFeatures
end

class ActiveSupport::SafeBuffer < ::String
  def initialize(str = T.unsafe(nil)); end

  def %(args); end
  def *(*_arg0); end
  def +(other); end
  def <<(value); end
  def [](*args); end
  def []=(*args); end
  def capitalize(*args, &block); end
  def capitalize!(*args); end
  def chomp(*args, &block); end
  def chomp!(*args); end
  def chop(*args, &block); end
  def chop!(*args); end
  def clone_empty; end
  def concat(value); end
  def delete(*args, &block); end
  def delete!(*args); end
  def delete_prefix(*args, &block); end
  def delete_prefix!(*args); end
  def delete_suffix(*args, &block); end
  def delete_suffix!(*args); end
  def downcase(*args, &block); end
  def downcase!(*args); end
  def encode_with(coder); end
  def gsub(*args, &block); end
  def gsub!(*args, &block); end
  def html_safe?; end
  def insert(index, value); end
  def lstrip(*args, &block); end
  def lstrip!(*args); end
  def next(*args, &block); end
  def next!(*args); end
  def prepend(value); end
  def replace(value); end
  def reverse(*args, &block); end
  def reverse!(*args); end
  def rstrip(*args, &block); end
  def rstrip!(*args); end
  def safe_concat(value); end
  def scrub(*args, &block); end
  def scrub!(*args); end
  def slice(*args, &block); end
  def slice!(*args); end
  def squeeze(*args, &block); end
  def squeeze!(*args); end
  def strip(*args, &block); end
  def strip!(*args); end
  def sub(*args, &block); end
  def sub!(*args, &block); end
  def succ(*args, &block); end
  def succ!(*args); end
  def swapcase(*args, &block); end
  def swapcase!(*args); end
  def to_param; end
  def to_s; end
  def tr(*args, &block); end
  def tr!(*args); end
  def tr_s(*args, &block); end
  def tr_s!(*args); end
  def unicode_normalize(*args, &block); end
  def unicode_normalize!(*args); end
  def upcase(*args, &block); end
  def upcase!(*args); end

  private

  def explicit_html_escape_interpolated_argument(arg); end
  def implicit_html_escape_interpolated_argument(arg); end
  def initialize_copy(other); end
  def original_concat(*_arg0); end
  def set_block_back_references(block, match_data); end
end

# Raised when <tt>ActiveSupport::SafeBuffer#safe_concat</tt> is called on unsafe buffers.
class ActiveSupport::SafeBuffer::SafeConcatError < ::StandardError
  def initialize; end
end

ActiveSupport::SafeBuffer::UNSAFE_STRING_METHODS = T.let(T.unsafe(nil), Array)
ActiveSupport::SafeBuffer::UNSAFE_STRING_METHODS_WITH_BACKREF =
  T.let(T.unsafe(nil), Array)

# The ActiveSupport::SecureCompareRotator is a wrapper around +ActiveSupport::SecurityUtils.secure_compare+
# and allows you to rotate a previously defined value to a new one.
#
# It can be used as follow:
#
# rotator = ActiveSupport::SecureCompareRotator.new('new_production_value')
# rotator.rotate('previous_production_value')
# rotator.secure_compare!('previous_production_value')
#
# One real use case example would be to rotate a basic auth credentials:
#
# class MyController < ApplicationController
# def authenticate_request
# rotator = ActiveSupport::SecureCompareRotator.new('new_password')
# rotator.rotate('old_password')
#
# authenticate_or_request_with_http_basic do |username, password|
# rotator.secure_compare!(password)
# rescue ActiveSupport::SecureCompareRotator::InvalidMatch
# false
# end
# end
# end
class ActiveSupport::SecureCompareRotator
  include ::ActiveSupport::Messages::Rotator
  include ::ActiveSupport::SecurityUtils

  def secure_compare!(other_value, on_rotation: T.unsafe(nil)); end

  private

  def build_rotation(previous_value, _options); end
end

class ActiveSupport::SecureCompareRotator::InvalidMatch < ::StandardError
end

module ActiveSupport::SecurityUtils
  private

  def fixed_length_secure_compare(a, b); end

  # Secure string comparison for strings of variable length.
  #
  # While a timing attack would not be able to discern the content of
  # a secret compared via secure_compare, it is possible to determine
  # the secret length. This should be considered when using secure_compare
  # to compare weak, short secrets to user input.
  def secure_compare(a, b); end

  class << self
    def fixed_length_secure_compare(a, b); end

    # Secure string comparison for strings of variable length.
    #
    # While a timing attack would not be able to discern the content of
    # a secret compared via secure_compare, it is possible to determine
    # the secret length. This should be considered when using secure_compare
    # to compare weak, short secrets to user input.
    def secure_compare(a, b); end
  end
end

# Wrapping a string in this class gives you a prettier way to test
# for equality. The value returned by <tt>Rails.env</tt> is wrapped
# in a StringInquirer object, so instead of calling this:
#
# Rails.env == 'production'
#
# you can call this:
#
# Rails.env.production?
#
# == Instantiating a new StringInquirer
#
# vehicle = ActiveSupport::StringInquirer.new('car')
# vehicle.car?   # => true
# vehicle.bike?  # => false
class ActiveSupport::StringInquirer < ::String
  private

  def method_missing(method_name, *arguments); end
  def respond_to_missing?(method_name, include_private = T.unsafe(nil)); end
end

# ActiveSupport::Subscriber is an object set to consume
# ActiveSupport::Notifications. The subscriber dispatches notifications to
# a registered object based on its given namespace.
#
# An example would be an Active Record subscriber responsible for collecting
# statistics about queries:
#
# module ActiveRecord
# class StatsSubscriber < ActiveSupport::Subscriber
# attach_to :active_record
#
# def sql(event)
# Statsd.timing("sql.#{event.payload[:name]}", event.duration)
# end
# end
# end
#
# After configured, whenever a "sql.active_record" notification is published,
# it will properly dispatch the event (ActiveSupport::Notifications::Event) to
# the +sql+ method.
#
# We can detach a subscriber as well:
#
# ActiveRecord::StatsSubscriber.detach_from(:active_record)
class ActiveSupport::Subscriber
  def initialize; end

  def finish(name, id, payload); end
  def patterns; end
  def publish_event(event); end
  def start(name, id, payload); end

  private

  def event_stack; end

  class << self
    # Attach the subscriber to a namespace.
    def attach_to(
      namespace,
      subscriber = T.unsafe(nil),
      notifier = T.unsafe(nil),
      inherit_all: T.unsafe(nil)
    ); end

    # Detach the subscriber from a namespace.
    def detach_from(namespace, notifier = T.unsafe(nil)); end

    # Adds event subscribers for all new methods added to the class.
    def method_added(event); end

    def subscribers; end

    private

    def add_event_subscriber(event); end
    def fetch_public_methods(subscriber, inherit_all); end
    def find_attached_subscriber; end
    def invalid_event?(event); end

    # Returns the value of attribute namespace.
    def namespace; end

    # Returns the value of attribute notifier.
    def notifier; end

    def pattern_subscribed?(pattern); end
    def prepare_pattern(event); end
    def remove_event_subscriber(event); end

    # Returns the value of attribute subscriber.
    def subscriber; end
  end
end

# Wraps any standard Logger object to provide tagging capabilities.
#
# May be called with a block:
#
# logger = ActiveSupport::TaggedLogging.new(Logger.new(STDOUT))
# logger.tagged('BCX') { logger.info 'Stuff' }                            # Logs "[BCX] Stuff"
# logger.tagged('BCX', "Jason") { logger.info 'Stuff' }                   # Logs "[BCX] [Jason] Stuff"
# logger.tagged('BCX') { logger.tagged('Jason') { logger.info 'Stuff' } } # Logs "[BCX] [Jason] Stuff"
#
# If called without a block, a new logger will be returned with applied tags:
#
# logger = ActiveSupport::TaggedLogging.new(Logger.new(STDOUT))
# logger.tagged("BCX").info "Stuff"                 # Logs "[BCX] Stuff"
# logger.tagged("BCX", "Jason").info "Stuff"        # Logs "[BCX] [Jason] Stuff"
# logger.tagged("BCX").tagged("Jason").info "Stuff" # Logs "[BCX] [Jason] Stuff"
#
# This is used by the default Rails.logger as configured by Railties to make
# it easy to stamp log lines with subdomains, request ids, and anything else
# to aid debugging of multi-user production applications.
module ActiveSupport::TaggedLogging
  def clear_tags!(*_arg0, &_arg1); end
  def flush; end
  def pop_tags(*_arg0, &_arg1); end
  def push_tags(*_arg0, &_arg1); end
  def tagged(*tags); end

  class << self
    def new(logger); end
  end
end

module ActiveSupport::TaggedLogging::Formatter
  # This method is invoked when a log event occurs.
  def call(severity, timestamp, progname, msg); end

  def clear_tags!; end
  def current_tags; end
  def pop_tags(size = T.unsafe(nil)); end
  def push_tags(*tags); end
  def tagged(*tags); end
  def tags_text; end
end

module ActiveSupport::TaggedLogging::LocalTagStorage
  # Returns the value of attribute current_tags.
  def current_tags; end

  # Sets the attribute current_tags
  def current_tags=(_arg0); end

  class << self
    def extended(base); end
  end
end

class ActiveSupport::TestCase < ::Minitest::Test
  include ::ActiveSupport::Testing::SetupAndTeardown
  include ::ActiveSupport::Testing::TaggedLogging
  include ::ActiveSupport::Callbacks
  include ::ActiveSupport::Testing::Assertions
  include ::ActiveSupport::Testing::Deprecation
  include ::ActiveSupport::Testing::TimeHelpers
  include ::ActiveSupport::Testing::FileFixtures
  include ::ActiveRecord::TestDatabases
  include ::ActiveRecord::TestFixtures
  extend ::ActiveSupport::Callbacks::ClassMethods
  extend ::ActiveSupport::DescendantsTracker
  extend ::ActiveSupport::Testing::SetupAndTeardown::ClassMethods
  extend ::ActiveSupport::Testing::Declarative
  extend ::ActiveRecord::TestFixtures::ClassMethods

  def __callbacks; end
  def __callbacks?; end
  def _run_setup_callbacks(&block); end
  def _run_teardown_callbacks(&block); end
  def _setup_callbacks; end
  def _teardown_callbacks; end
  def assert_no_match(matcher, obj, msg = T.unsafe(nil)); end
  def assert_not_empty(obj, msg = T.unsafe(nil)); end
  def assert_not_equal(exp, act, msg = T.unsafe(nil)); end
  def assert_not_in_delta(
    exp,
    act,
    delta = T.unsafe(nil),
    msg = T.unsafe(nil)
  ); end
  def assert_not_in_epsilon(
    a,
    b,
    epsilon = T.unsafe(nil),
    msg = T.unsafe(nil)
  ); end
  def assert_not_includes(collection, obj, msg = T.unsafe(nil)); end
  def assert_not_instance_of(cls, obj, msg = T.unsafe(nil)); end
  def assert_not_kind_of(cls, obj, msg = T.unsafe(nil)); end
  def assert_not_nil(obj, msg = T.unsafe(nil)); end
  def assert_not_operator(o1, op, o2 = T.unsafe(nil), msg = T.unsafe(nil)); end
  def assert_not_predicate(o1, op, msg = T.unsafe(nil)); end
  def assert_not_respond_to(obj, meth, msg = T.unsafe(nil)); end
  def assert_not_same(exp, act, msg = T.unsafe(nil)); end

  # test/unit backwards compatibility methods
  def assert_raise(*exp); end

  def file_fixture_path; end
  def file_fixture_path?; end
  def fixture_class_names; end
  def fixture_class_names=(_arg0); end
  def fixture_class_names?; end
  def fixture_path; end
  def fixture_path?; end
  def fixture_table_names; end
  def fixture_table_names=(_arg0); end
  def fixture_table_names?; end
  def lock_threads; end
  def lock_threads=(_arg0); end
  def lock_threads?; end
  def method_name; end
  def pre_loaded_fixtures; end
  def pre_loaded_fixtures=(_arg0); end
  def pre_loaded_fixtures?; end
  def use_instantiated_fixtures; end
  def use_instantiated_fixtures=(_arg0); end
  def use_instantiated_fixtures?; end
  def use_transactional_tests; end
  def use_transactional_tests=(_arg0); end
  def use_transactional_tests?; end

  class << self
    def __callbacks; end
    def __callbacks=(value); end
    def __callbacks?; end
    def _setup_callbacks; end
    def _setup_callbacks=(value); end
    def _teardown_callbacks; end
    def _teardown_callbacks=(value); end
    def file_fixture_path; end
    def file_fixture_path=(value); end
    def file_fixture_path?; end
    def fixture_class_names; end
    def fixture_class_names=(value); end
    def fixture_class_names?; end
    def fixture_path; end
    def fixture_path=(value); end
    def fixture_path?; end
    def fixture_table_names; end
    def fixture_table_names=(value); end
    def fixture_table_names?; end
    def lock_threads; end
    def lock_threads=(value); end
    def lock_threads?; end

    # Parallelizes the test suite.
    #
    # Takes a +workers+ argument that controls how many times the process
    # is forked. For each process a new database will be created suffixed
    # with the worker number.
    #
    # test-database-0
    # test-database-1
    #
    # If <tt>ENV["PARALLEL_WORKERS"]</tt> is set the workers argument will be ignored
    # and the environment variable will be used instead. This is useful for CI
    # environments, or other environments where you may need more workers than
    # you do for local testing.
    #
    # If the number of workers is set to +1+ or fewer, the tests will not be
    # parallelized.
    #
    # If +workers+ is set to +:number_of_processors+, the number of workers will be
    # set to the actual core count on the machine you are on.
    #
    # The default parallelization method is to fork processes. If you'd like to
    # use threads instead you can pass <tt>with: :threads</tt> to the +parallelize+
    # method. Note the threaded parallelization does not create multiple
    # database and will not work with system tests at this time.
    #
    # parallelize(workers: :number_of_processors, with: :threads)
    #
    # The threaded parallelization uses minitest's parallel executor directly.
    # The processes parallelization uses a Ruby DRb server.
    #
    # Because parallelization presents an overhead, it is only enabled when the
    # number of tests to run is above the +threshold+ param. The default value is
    # 50, and it's configurable via +config.active_support.test_parallelization_threshold+.
    def parallelize(
      workers: T.unsafe(nil),
      with: T.unsafe(nil),
      threshold: T.unsafe(nil)
    ); end

    # Set up hook for parallel testing. This can be used if you have multiple
    # databases or any behavior that needs to be run after the process is forked
    # but before the tests run.
    #
    # Note: this feature is not available with the threaded parallelization.
    #
    # In your +test_helper.rb+ add the following:
    #
    # class ActiveSupport::TestCase
    # parallelize_setup do
    # # create databases
    # end
    # end
    def parallelize_setup(&block); end

    # Clean up hook for parallel testing. This can be used to drop databases
    # if your app uses multiple write/read databases or other clean up before
    # the tests finish. This runs before the forked process is closed.
    #
    # Note: this feature is not available with the threaded parallelization.
    #
    # In your +test_helper.rb+ add the following:
    #
    # class ActiveSupport::TestCase
    # parallelize_teardown do
    # # drop databases
    # end
    # end
    def parallelize_teardown(&block); end

    def pre_loaded_fixtures; end
    def pre_loaded_fixtures=(value); end
    def pre_loaded_fixtures?; end

    # Returns the order in which test cases are run.
    #
    # ActiveSupport::TestCase.test_order # => :random
    #
    # Possible values are +:random+, +:parallel+, +:alpha+, +:sorted+.
    # Defaults to +:random+.
    def test_order; end

    # Sets the order in which test cases are run.
    #
    # ActiveSupport::TestCase.test_order = :random # => :random
    #
    # Valid values are:
    # * +:random+   (to run tests in random order)
    # * +:parallel+ (to run tests in parallel)
    # * +:sorted+   (to run tests alphabetically by method name)
    # * +:alpha+    (equivalent to +:sorted+)
    def test_order=(new_order); end

    def use_instantiated_fixtures; end
    def use_instantiated_fixtures=(value); end
    def use_instantiated_fixtures?; end
    def use_transactional_tests; end
    def use_transactional_tests=(value); end
    def use_transactional_tests?; end
  end
end

ActiveSupport::TestCase::Assertion = Minitest::Assertion
module ActiveSupport::Testing
end

module ActiveSupport::Testing::Assertions
  # Assertion that the result of evaluating an expression is changed before
  # and after invoking the passed in block.
  #
  # assert_changes 'Status.all_good?' do
  # post :create, params: { status: { ok: false } }
  # end
  #
  # You can pass the block as a string to be evaluated in the context of
  # the block. A lambda can be passed for the block as well.
  #
  # assert_changes -> { Status.all_good? } do
  # post :create, params: { status: { ok: false } }
  # end
  #
  # The assertion is useful to test side effects. The passed block can be
  # anything that can be converted to string with #to_s.
  #
  # assert_changes :@object do
  # @object = 42
  # end
  #
  # The keyword arguments :from and :to can be given to specify the
  # expected initial value and the expected value after the block was
  # executed.
  #
  # assert_changes :@object, from: nil, to: :foo do
  # @object = :foo
  # end
  #
  # An error message can be specified.
  #
  # assert_changes -> { Status.all_good? }, 'Expected the status to be bad' do
  # post :create, params: { status: { incident: true } }
  # end
  def assert_changes(
    expression,
    message = T.unsafe(nil),
    from: T.unsafe(nil),
    to: T.unsafe(nil),
    &block
  ); end

  # Test numeric difference between the return value of an expression as a
  # result of what is evaluated in the yielded block.
  #
  # assert_difference 'Article.count' do
  # post :create, params: { article: {...} }
  # end
  #
  # An arbitrary expression is passed in and evaluated.
  #
  # assert_difference 'Article.last.comments(:reload).size' do
  # post :create, params: { comment: {...} }
  # end
  #
  # An arbitrary positive or negative difference can be specified.
  # The default is <tt>1</tt>.
  #
  # assert_difference 'Article.count', -1 do
  # post :delete, params: { id: ... }
  # end
  #
  # An array of expressions can also be passed in and evaluated.
  #
  # assert_difference [ 'Article.count', 'Post.count' ], 2 do
  # post :create, params: { article: {...} }
  # end
  #
  # A hash of expressions/numeric differences can also be passed in and evaluated.
  #
  # assert_difference ->{ Article.count } => 1, ->{ Notification.count } => 2 do
  # post :create, params: { article: {...} }
  # end
  #
  # A lambda or a list of lambdas can be passed in and evaluated:
  #
  # assert_difference ->{ Article.count }, 2 do
  # post :create, params: { article: {...} }
  # end
  #
  # assert_difference [->{ Article.count }, ->{ Post.count }], 2 do
  # post :create, params: { article: {...} }
  # end
  #
  # An error message can be specified.
  #
  # assert_difference 'Article.count', -1, 'An Article should be destroyed' do
  # post :delete, params: { id: ... }
  # end
  def assert_difference(expression, *args, &block); end

  # Assertion that the result of evaluating an expression is not changed before
  # and after invoking the passed in block.
  #
  # assert_no_changes 'Status.all_good?' do
  # post :create, params: { status: { ok: true } }
  # end
  #
  # Provide the optional keyword argument :from to specify the expected
  # initial value.
  #
  # assert_no_changes -> { Status.all_good? }, from: true do
  # post :create, params: { status: { ok: true } }
  # end
  #
  # An error message can be specified.
  #
  # assert_no_changes -> { Status.all_good? }, 'Expected the status to be good' do
  # post :create, params: { status: { ok: false } }
  # end
  def assert_no_changes(
    expression,
    message = T.unsafe(nil),
    from: T.unsafe(nil),
    &block
  ); end

  # Assertion that the numeric result of evaluating an expression is not
  # changed before and after invoking the passed in block.
  #
  # assert_no_difference 'Article.count' do
  # post :create, params: { article: invalid_attributes }
  # end
  #
  # A lambda can be passed in and evaluated.
  #
  # assert_no_difference -> { Article.count } do
  # post :create, params: { article: invalid_attributes }
  # end
  #
  # An error message can be specified.
  #
  # assert_no_difference 'Article.count', 'An Article should not be created' do
  # post :create, params: { article: invalid_attributes }
  # end
  #
  # An array of expressions can also be passed in and evaluated.
  #
  # assert_no_difference [ 'Article.count', -> { Post.count } ] do
  # post :create, params: { article: invalid_attributes }
  # end
  def assert_no_difference(expression, message = T.unsafe(nil), &block); end

  # Asserts that an expression is not truthy. Passes if <tt>object</tt> is
  # +nil+ or +false+. "Truthy" means "considered true in a conditional"
  # like <tt>if foo</tt>.
  #
  # assert_not nil    # => true
  # assert_not false  # => true
  # assert_not 'foo'  # => Expected "foo" to be nil or false
  #
  # An error message can be specified.
  #
  # assert_not foo, 'foo should be false'
  def assert_not(object, message = T.unsafe(nil)); end

  # Assertion that the block should not raise an exception.
  #
  # Passes if evaluated code in the yielded block raises no exception.
  #
  # assert_nothing_raised do
  # perform_service(param: 'no_exception')
  # end
  def assert_nothing_raised; end

  private

  def _assert_nothing_raised_or_warn(assertion, &block); end
end

ActiveSupport::Testing::Assertions::UNTRACKED = T.let(T.unsafe(nil), Object)

# Resolves a constant from a minitest spec name.
#
# Given the following spec-style test:
#
# describe WidgetsController, :index do
# describe "authenticated user" do
# describe "returns widgets" do
# it "has a controller that exists" do
# assert_kind_of WidgetsController, @controller
# end
# end
# end
# end
#
# The test will have the following name:
#
# "WidgetsController::index::authenticated user::returns widgets"
#
# The constant WidgetsController can be resolved from the name.
# The following code will resolve the constant:
#
# controller = determine_constant_from_test_name(name) do |constant|
# Class === constant && constant < ::ActionController::Metal
# end
module ActiveSupport::Testing::ConstantLookup
  extend ::ActiveSupport::Concern

  mixes_in_class_methods ::ActiveSupport::Testing::ConstantLookup::ClassMethods
end

module ActiveSupport::Testing::ConstantLookup::ClassMethods
  def determine_constant_from_test_name(test_name); end
end

module ActiveSupport::Testing::Declarative
  # Helper to define a test method using a String. Under the hood, it replaces
  # spaces with underscores and defines the test method.
  #
  # test "verify something" do
  # ...
  # end
  def test(name, &block); end
end

module ActiveSupport::Testing::Deprecation
  # Asserts that a matching deprecation warning was emitted by the given deprecator during the execution of the yielded block.
  #
  # assert_deprecated(/foo/, CustomDeprecator) do
  # CustomDeprecator.warn "foo should no longer be used"
  # end
  #
  # The +match+ object may be a +Regexp+, or +String+ appearing in the message.
  #
  # assert_deprecated('foo', CustomDeprecator) do
  # CustomDeprecator.warn "foo should no longer be used"
  # end
  #
  # If the +match+ is omitted (or explicitly +nil+), any deprecation warning will match.
  #
  # assert_deprecated(nil, CustomDeprecator) do
  # CustomDeprecator.warn "foo should no longer be used"
  # end
  #
  # If no +deprecator+ is given, defaults to ActiveSupport::Deprecation.
  #
  # assert_deprecated do
  # ActiveSupport::Deprecation.warn "foo should no longer be used"
  # end
  def assert_deprecated(
    match = T.unsafe(nil),
    deprecator = T.unsafe(nil),
    &block
  ); end

  # Asserts that no deprecation warnings are emitted by the given deprecator during the execution of the yielded block.
  #
  # assert_not_deprecated(CustomDeprecator) do
  # CustomDeprecator.warn "message" # fails assertion
  # end
  #
  # If no +deprecator+ is given, defaults to ActiveSupport::Deprecation.
  #
  # assert_not_deprecated do
  # ActiveSupport::Deprecation.warn "message" # fails assertion
  # end
  #
  # assert_not_deprecated do
  # CustomDeprecator.warn "message" # passes assertion
  # end
  def assert_not_deprecated(deprecator = T.unsafe(nil), &block); end

  # Returns an array of all the deprecation warnings emitted by the given
  # +deprecator+ during the execution of the yielded block.
  #
  # collect_deprecations(CustomDeprecator) do
  # CustomDeprecator.warn "message"
  # end # => ["message"]
  #
  # If no +deprecator+ is given, defaults to ActiveSupport::Deprecation.
  #
  # collect_deprecations do
  # CustomDeprecator.warn "custom message"
  # ActiveSupport::Deprecation.warn "message"
  # end # => ["message"]
  def collect_deprecations(deprecator = T.unsafe(nil)); end
end

# Adds simple access to sample files called file fixtures.
# File fixtures are normal files stored in
# <tt>ActiveSupport::TestCase.file_fixture_path</tt>.
#
# File fixtures are represented as +Pathname+ objects.
# This makes it easy to extract specific information:
#
# file_fixture("example.txt").read # get the file's content
# file_fixture("example.mp3").size # get the file size
module ActiveSupport::Testing::FileFixtures
  extend ::ActiveSupport::Concern
  include GeneratedInstanceMethods

  mixes_in_class_methods GeneratedClassMethods

  # Returns a +Pathname+ to the fixture file named +fixture_name+.
  #
  # Raises +ArgumentError+ if +fixture_name+ can't be found.
  def file_fixture(fixture_name); end

  module GeneratedClassMethods
    def file_fixture_path; end
    def file_fixture_path=(value); end
    def file_fixture_path?; end
  end

  module GeneratedInstanceMethods
    def file_fixture_path; end
    def file_fixture_path?; end
  end
end

module ActiveSupport::Testing::Isolation
  include ::ActiveSupport::Testing::Isolation::Forking

  def run; end

  class << self
    def forking_env?; end
    def included(klass); end
  end
end

module ActiveSupport::Testing::Isolation::Forking
  def run_in_isolation(&blk); end
end

module ActiveSupport::Testing::Isolation::Subprocess
  # Complicated H4X to get this working in windows / jruby with
  # no forking.
  def run_in_isolation(&blk); end
end

ActiveSupport::Testing::Isolation::Subprocess::ORIG_ARGV =
  T.let(T.unsafe(nil), Array)

class ActiveSupport::Testing::Parallelization
  def initialize(worker_count); end

  def <<(work); end
  def after_fork_hooks; end
  def run_cleanup_hooks; end
  def shutdown; end
  def size; end
  def start; end

  class << self
    def after_fork_hook(&blk); end
    def after_fork_hooks; end
    def run_cleanup_hook(&blk); end
    def run_cleanup_hooks; end
  end
end

class ActiveSupport::Testing::Parallelization::Server
  include ::DRb::DRbUndumped

  def initialize; end

  def <<(o); end
  def active_workers?; end
  def interrupt; end
  def pop; end
  def record(reporter, result); end
  def shutdown; end
  def start_worker(worker_id); end
  def stop_worker(worker_id); end
end

class ActiveSupport::Testing::Parallelization::Worker
  def initialize(number, url); end

  def after_fork; end
  def perform_job(job); end
  def run_cleanup; end
  def safe_record(reporter, result); end
  def start; end
  def work_from_queue; end

  private

  def add_setup_exception(result); end
  def set_process_title(status); end
end

class ActiveSupport::Testing::ParallelizeExecutor
  def initialize(size:, with:, threshold: T.unsafe(nil)); end

  def <<(work); end

  # Returns the value of attribute parallelize_with.
  def parallelize_with; end

  def shutdown; end

  # Returns the value of attribute size.
  def size; end

  def start; end

  # Returns the value of attribute threshold.
  def threshold; end

  private

  def build_parallel_executor; end
  def execution_info; end
  def parallel_executor; end
  def parallelize; end
  def parallelized?; end
  def should_parallelize?; end
  def show_execution_info; end
  def tests_count; end
end

# Adds support for +setup+ and +teardown+ callbacks.
# These callbacks serve as a replacement to overwriting the
# <tt>#setup</tt> and <tt>#teardown</tt> methods of your TestCase.
#
# class ExampleTest < ActiveSupport::TestCase
# setup do
# # ...
# end
#
# teardown do
# # ...
# end
# end
module ActiveSupport::Testing::SetupAndTeardown
  def after_teardown; end
  def before_setup; end

  class << self
    def prepended(klass); end
  end
end

module ActiveSupport::Testing::SetupAndTeardown::ClassMethods
  # Add a callback, which runs before <tt>TestCase#setup</tt>.
  def setup(*args, &block); end

  # Add a callback, which runs after <tt>TestCase#teardown</tt>.
  def teardown(*args, &block); end
end

# Manages stubs for TimeHelpers
class ActiveSupport::Testing::SimpleStubs
  def initialize; end

  # Stubs object.method_name with the given block
  # If the method is already stubbed, remove that stub
  # so that removing this stub will restore the original implementation.
  # Time.current # => Sat, 09 Nov 2013 15:34:49 EST -05:00
  # target = Time.zone.local(2004, 11, 24, 1, 4, 44)
  # simple_stubs.stub_object(Time, :now) { at(target.to_i) }
  # Time.current # => Wed, 24 Nov 2004 01:04:44 EST -05:00
  def stub_object(object, method_name, &block); end

  # Returns true if any stubs are set, false if there are none
  def stubbed?; end

  # Returns the Stub for object#method_name
  # (nil if it is not stubbed)
  def stubbing(object, method_name); end

  # Remove all object-method stubs held by this instance
  def unstub_all!; end

  private

  # Restores the original object.method described by the Stub
  def unstub_object(stub); end
end

class ActiveSupport::Testing::SimpleStubs::Stub < ::Struct
  # Returns the value of attribute method_name
  def method_name; end

  # Sets the attribute method_name
  def method_name=(_); end

  # Returns the value of attribute object
  def object; end

  # Sets the attribute object
  def object=(_); end

  # Returns the value of attribute original_method
  def original_method; end

  # Sets the attribute original_method
  def original_method=(_); end

  class << self
    def [](*_arg0); end
    def inspect; end
    def members; end
    def new(*_arg0); end
  end
end

module ActiveSupport::Testing::Stream
  private

  def capture(stream); end
  def quietly(&block); end
  def silence_stream(stream); end
end

# Logs a "PostsControllerTest: test name" heading before each test to
# make test.log easier to search and follow along with.
module ActiveSupport::Testing::TaggedLogging
  def before_setup; end
  def tagged_logger=(_arg0); end

  private

  def tagged_logger; end
end

# Contains helpers that help you test passage of time.
module ActiveSupport::Testing::TimeHelpers
  def after_teardown; end

  # Calls +travel_to+ with +Time.now+.
  #
  # Time.current # => Sun, 09 Jul 2017 15:34:49 EST -05:00
  # freeze_time
  # sleep(1)
  # Time.current # => Sun, 09 Jul 2017 15:34:49 EST -05:00
  #
  # This method also accepts a block, which will return the current time back to its original
  # state at the end of the block:
  #
  # Time.current # => Sun, 09 Jul 2017 15:34:49 EST -05:00
  # freeze_time do
  # sleep(1)
  # User.create.created_at # => Sun, 09 Jul 2017 15:34:49 EST -05:00
  # end
  # Time.current # => Sun, 09 Jul 2017 15:34:50 EST -05:00
  def freeze_time(&block); end

  # Changes current time to the time in the future or in the past by a given time difference by
  # stubbing +Time.now+, +Date.today+, and +DateTime.now+. The stubs are automatically removed
  # at the end of the test.
  #
  # Time.current     # => Sat, 09 Nov 2013 15:34:49 EST -05:00
  # travel 1.day
  # Time.current     # => Sun, 10 Nov 2013 15:34:49 EST -05:00
  # Date.current     # => Sun, 10 Nov 2013
  # DateTime.current # => Sun, 10 Nov 2013 15:34:49 -0500
  #
  # This method also accepts a block, which will return the current time back to its original
  # state at the end of the block:
  #
  # Time.current # => Sat, 09 Nov 2013 15:34:49 EST -05:00
  # travel 1.day do
  # User.create.created_at # => Sun, 10 Nov 2013 15:34:49 EST -05:00
  # end
  # Time.current # => Sat, 09 Nov 2013 15:34:49 EST -05:00
  def travel(duration, &block); end

  # Returns the current time back to its original state, by removing the stubs added by
  # +travel+, +travel_to+, and +freeze_time+.
  #
  # Time.current # => Sat, 09 Nov 2013 15:34:49 EST -05:00
  #
  # travel_to Time.zone.local(2004, 11, 24, 1, 4, 44)
  # Time.current # => Wed, 24 Nov 2004 01:04:44 EST -05:00
  #
  # travel_back
  # Time.current # => Sat, 09 Nov 2013 15:34:49 EST -05:00
  #
  # This method also accepts a block, which brings the stubs back at the end of the block:
  #
  # Time.current # => Sat, 09 Nov 2013 15:34:49 EST -05:00
  #
  # travel_to Time.zone.local(2004, 11, 24, 1, 4, 44)
  # Time.current # => Wed, 24 Nov 2004 01:04:44 EST -05:00
  #
  # travel_back do
  # Time.current # => Sat, 09 Nov 2013 15:34:49 EST -05:00
  # end
  #
  # Time.current # => Wed, 24 Nov 2004 01:04:44 EST -05:00
  def travel_back; end

  # Changes current time to the given time by stubbing +Time.now+,
  # +Date.today+, and +DateTime.now+ to return the time or date passed into this method.
  # The stubs are automatically removed at the end of the test.
  #
  # Time.current     # => Sat, 09 Nov 2013 15:34:49 EST -05:00
  # travel_to Time.zone.local(2004, 11, 24, 1, 4, 44)
  # Time.current     # => Wed, 24 Nov 2004 01:04:44 EST -05:00
  # Date.current     # => Wed, 24 Nov 2004
  # DateTime.current # => Wed, 24 Nov 2004 01:04:44 -0500
  #
  # Dates are taken as their timestamp at the beginning of the day in the
  # application time zone. <tt>Time.current</tt> returns said timestamp,
  # and <tt>Time.now</tt> its equivalent in the system time zone. Similarly,
  # <tt>Date.current</tt> returns a date equal to the argument, and
  # <tt>Date.today</tt> the date according to <tt>Time.now</tt>, which may
  # be different. (Note that you rarely want to deal with <tt>Time.now</tt>,
  # or <tt>Date.today</tt>, in order to honor the application time zone
  # please always use <tt>Time.current</tt> and <tt>Date.current</tt>.)
  #
  # Note that the usec for the time passed will be set to 0 to prevent rounding
  # errors with external services, like MySQL (which will round instead of floor,
  # leading to off-by-one-second errors).
  #
  # This method also accepts a block, which will return the current time back to its original
  # state at the end of the block:
  #
  # Time.current # => Sat, 09 Nov 2013 15:34:49 EST -05:00
  # travel_to Time.zone.local(2004, 11, 24, 1, 4, 44) do
  # Time.current # => Wed, 24 Nov 2004 01:04:44 EST -05:00
  # end
  # Time.current # => Sat, 09 Nov 2013 15:34:49 EST -05:00
  def travel_to(date_or_time); end

  # Returns the current time back to its original state, by removing the stubs added by
  # +travel+, +travel_to+, and +freeze_time+.
  #
  # Time.current # => Sat, 09 Nov 2013 15:34:49 EST -05:00
  #
  # travel_to Time.zone.local(2004, 11, 24, 1, 4, 44)
  # Time.current # => Wed, 24 Nov 2004 01:04:44 EST -05:00
  #
  # travel_back
  # Time.current # => Sat, 09 Nov 2013 15:34:49 EST -05:00
  #
  # This method also accepts a block, which brings the stubs back at the end of the block:
  #
  # Time.current # => Sat, 09 Nov 2013 15:34:49 EST -05:00
  #
  # travel_to Time.zone.local(2004, 11, 24, 1, 4, 44)
  # Time.current # => Wed, 24 Nov 2004 01:04:44 EST -05:00
  #
  # travel_back do
  # Time.current # => Sat, 09 Nov 2013 15:34:49 EST -05:00
  # end
  #
  # Time.current # => Wed, 24 Nov 2004 01:04:44 EST -05:00
  def unfreeze_time; end

  private

  # Returns the value of attribute in_block.
  def in_block; end

  # Sets the attribute in_block
  def in_block=(_arg0); end

  def simple_stubs; end
end

# A Time-like class that can represent a time in any time zone. Necessary
# because standard Ruby Time instances are limited to UTC and the
# system's <tt>ENV['TZ']</tt> zone.
#
# You shouldn't ever need to create a TimeWithZone instance directly via +new+.
# Instead use methods +local+, +parse+, +at+ and +now+ on TimeZone instances,
# and +in_time_zone+ on Time and DateTime instances.
#
# Time.zone = 'Eastern Time (US & Canada)'        # => 'Eastern Time (US & Canada)'
# Time.zone.local(2007, 2, 10, 15, 30, 45)        # => Sat, 10 Feb 2007 15:30:45.000000000 EST -05:00
# Time.zone.parse('2007-02-10 15:30:45')          # => Sat, 10 Feb 2007 15:30:45.000000000 EST -05:00
# Time.zone.at(1171139445)                        # => Sat, 10 Feb 2007 15:30:45.000000000 EST -05:00
# Time.zone.now                                   # => Sun, 18 May 2008 13:07:55.754107581 EDT -04:00
# Time.utc(2007, 2, 10, 20, 30, 45).in_time_zone  # => Sat, 10 Feb 2007 15:30:45.000000000 EST -05:00
#
# See Time and TimeZone for further documentation of these methods.
#
# TimeWithZone instances implement the same API as Ruby Time instances, so
# that Time and TimeWithZone instances are interchangeable.
#
# t = Time.zone.now                     # => Sun, 18 May 2008 13:27:25.031505668 EDT -04:00
# t.hour                                # => 13
# t.dst?                                # => true
# t.utc_offset                          # => -14400
# t.zone                                # => "EDT"
# t.to_formatted_s(:rfc822)             # => "Sun, 18 May 2008 13:27:25 -0400"
# t + 1.day                             # => Mon, 19 May 2008 13:27:25.031505668 EDT -04:00
# t.beginning_of_year                   # => Tue, 01 Jan 2008 00:00:00.000000000 EST -05:00
# t > Time.utc(1999)                    # => true
# t.is_a?(Time)                         # => true
# t.is_a?(ActiveSupport::TimeWithZone)  # => true
class ActiveSupport::TimeWithZone
  include ::DateAndTime::Compatibility
  include ::Comparable

  def initialize(
    utc_time,
    time_zone,
    local_time = T.unsafe(nil),
    period = T.unsafe(nil)
  ); end

  # Adds an interval of time to the current object's time and returns that
  # value as a new TimeWithZone object.
  #
  # Time.zone = 'Eastern Time (US & Canada)' # => 'Eastern Time (US & Canada)'
  # now = Time.zone.now # => Sun, 02 Nov 2014 01:26:28.725182881 EDT -04:00
  # now + 1000          # => Sun, 02 Nov 2014 01:43:08.725182881 EDT -04:00
  #
  # If we're adding a Duration of variable length (i.e., years, months, days),
  # move forward from #time, otherwise move forward from #utc, for accuracy
  # when moving across DST boundaries.
  #
  # For instance, a time + 24.hours will advance exactly 24 hours, while a
  # time + 1.day will advance 23-25 hours, depending on the day.
  #
  # now + 24.hours      # => Mon, 03 Nov 2014 00:26:28.725182881 EST -05:00
  # now + 1.day         # => Mon, 03 Nov 2014 01:26:28.725182881 EST -05:00
  def +(other); end

  # Subtracts an interval of time and returns a new TimeWithZone object unless
  # the other value +acts_like?+ time. Then it will return a Float of the difference
  # between the two times that represents the difference between the current
  # object's time and the +other+ time.
  #
  # Time.zone = 'Eastern Time (US & Canada)' # => 'Eastern Time (US & Canada)'
  # now = Time.zone.now # => Mon, 03 Nov 2014 00:26:28.725182881 EST -05:00
  # now - 1000          # => Mon, 03 Nov 2014 00:09:48.725182881 EST -05:00
  #
  # If subtracting a Duration of variable length (i.e., years, months, days),
  # move backward from #time, otherwise move backward from #utc, for accuracy
  # when moving across DST boundaries.
  #
  # For instance, a time - 24.hours will go subtract exactly 24 hours, while a
  # time - 1.day will subtract 23-25 hours, depending on the day.
  #
  # now - 24.hours      # => Sun, 02 Nov 2014 01:26:28.725182881 EDT -04:00
  # now - 1.day         # => Sun, 02 Nov 2014 00:26:28.725182881 EDT -04:00
  #
  # If both the TimeWithZone object and the other value act like Time, a Float
  # will be returned.
  #
  # Time.zone.now - 1.day.ago # => 86399.999967
  def -(other); end

  # Use the time in UTC for comparisons.
  def <=>(other); end

  # So that +self+ <tt>acts_like?(:time)</tt>.
  def acts_like_time?; end

  # Uses Date to provide precise Time calculations for years, months, and days
  # according to the proleptic Gregorian calendar. The result is returned as a
  # new TimeWithZone object.
  #
  # The +options+ parameter takes a hash with any of these keys:
  # <tt>:years</tt>, <tt>:months</tt>, <tt>:weeks</tt>, <tt>:days</tt>,
  # <tt>:hours</tt>, <tt>:minutes</tt>, <tt>:seconds</tt>.
  #
  # If advancing by a value of variable length (i.e., years, weeks, months,
  # days), move forward from #time, otherwise move forward from #utc, for
  # accuracy when moving across DST boundaries.
  #
  # Time.zone = 'Eastern Time (US & Canada)' # => 'Eastern Time (US & Canada)'
  # now = Time.zone.now # => Sun, 02 Nov 2014 01:26:28.558049687 EDT -04:00
  # now.advance(seconds: 1) # => Sun, 02 Nov 2014 01:26:29.558049687 EDT -04:00
  # now.advance(minutes: 1) # => Sun, 02 Nov 2014 01:27:28.558049687 EDT -04:00
  # now.advance(hours: 1)   # => Sun, 02 Nov 2014 01:26:28.558049687 EST -05:00
  # now.advance(days: 1)    # => Mon, 03 Nov 2014 01:26:28.558049687 EST -05:00
  # now.advance(weeks: 1)   # => Sun, 09 Nov 2014 01:26:28.558049687 EST -05:00
  # now.advance(months: 1)  # => Tue, 02 Dec 2014 01:26:28.558049687 EST -05:00
  # now.advance(years: 1)   # => Mon, 02 Nov 2015 01:26:28.558049687 EST -05:00
  def advance(options); end

  def after?(_arg0); end

  # Subtracts an interval of time from the current object's time and returns
  # the result as a new TimeWithZone object.
  #
  # Time.zone = 'Eastern Time (US & Canada)' # => 'Eastern Time (US & Canada)'
  # now = Time.zone.now # => Mon, 03 Nov 2014 00:26:28.725182881 EST -05:00
  # now.ago(1000)       # => Mon, 03 Nov 2014 00:09:48.725182881 EST -05:00
  #
  # If we're subtracting a Duration of variable length (i.e., years, months,
  # days), move backward from #time, otherwise move backward from #utc, for
  # accuracy when moving across DST boundaries.
  #
  # For instance, <tt>time.ago(24.hours)</tt> will move back exactly 24 hours,
  # while <tt>time.ago(1.day)</tt> will move back 23-25 hours, depending on
  # the day.
  #
  # now.ago(24.hours)   # => Sun, 02 Nov 2014 01:26:28.725182881 EDT -04:00
  # now.ago(1.day)      # => Sun, 02 Nov 2014 00:26:28.725182881 EDT -04:00
  def ago(other); end

  # Coerces time to a string for JSON encoding. The default format is ISO 8601.
  # You can get %Y/%m/%d %H:%M:%S +offset style by setting
  # <tt>ActiveSupport::JSON::Encoding.use_standard_json_time_format</tt>
  # to +false+.
  #
  # # With ActiveSupport::JSON::Encoding.use_standard_json_time_format = true
  # Time.utc(2005,2,1,15,15,10).in_time_zone("Hawaii").to_json
  # # => "2005-02-01T05:15:10.000-10:00"
  #
  # # With ActiveSupport::JSON::Encoding.use_standard_json_time_format = false
  # Time.utc(2005,2,1,15,15,10).in_time_zone("Hawaii").to_json
  # # => "2005/02/01 05:15:10 -1000"
  def as_json(options = T.unsafe(nil)); end

  def before?(_arg0); end

  # Returns true if the current object's time is within the specified
  # +min+ and +max+ time.
  def between?(min, max); end

  # An instance of ActiveSupport::TimeWithZone is never blank
  def blank?; end

  # Returns a new +ActiveSupport::TimeWithZone+ where one or more of the elements have
  # been changed according to the +options+ parameter. The time options (<tt>:hour</tt>,
  # <tt>:min</tt>, <tt>:sec</tt>, <tt>:usec</tt>, <tt>:nsec</tt>) reset cascadingly,
  # so if only the hour is passed, then minute, sec, usec and nsec is set to 0. If the
  # hour and minute is passed, then sec, usec and nsec is set to 0. The +options+
  # parameter takes a hash with any of these keys: <tt>:year</tt>, <tt>:month</tt>,
  # <tt>:day</tt>, <tt>:hour</tt>, <tt>:min</tt>, <tt>:sec</tt>, <tt>:usec</tt>,
  # <tt>:nsec</tt>, <tt>:offset</tt>, <tt>:zone</tt>. Pass either <tt>:usec</tt>
  # or <tt>:nsec</tt>, not both. Similarly, pass either <tt>:zone</tt> or
  # <tt>:offset</tt>, not both.
  #
  # t = Time.zone.now          # => Fri, 14 Apr 2017 11:45:15.116992711 EST -05:00
  # t.change(year: 2020)       # => Tue, 14 Apr 2020 11:45:15.116992711 EST -05:00
  # t.change(hour: 12)         # => Fri, 14 Apr 2017 12:00:00.116992711 EST -05:00
  # t.change(min: 30)          # => Fri, 14 Apr 2017 11:30:00.116992711 EST -05:00
  # t.change(offset: "-10:00") # => Fri, 14 Apr 2017 11:45:15.116992711 HST -10:00
  # t.change(zone: "Hawaii")   # => Fri, 14 Apr 2017 11:45:15.116992711 HST -10:00
  def change(options); end

  # Returns a <tt>Time</tt> instance of the simultaneous time in the UTC timezone.
  def comparable_time; end

  def day; end

  # Returns true if the current time is within Daylight Savings Time for the
  # specified time zone.
  #
  # Time.zone = 'Eastern Time (US & Canada)'    # => 'Eastern Time (US & Canada)'
  # Time.zone.parse("2012-5-30").dst?           # => true
  # Time.zone.parse("2012-11-30").dst?          # => false
  def dst?; end

  def encode_with(coder); end

  # Returns +true+ if +other+ is equal to current object.
  def eql?(other); end

  # Returns a formatted string of the offset from UTC, or an alternative
  # string if the time zone is already UTC.
  #
  # Time.zone = 'Eastern Time (US & Canada)'   # => "Eastern Time (US & Canada)"
  # Time.zone.now.formatted_offset(true)       # => "-05:00"
  # Time.zone.now.formatted_offset(false)      # => "-0500"
  # Time.zone = 'UTC'                          # => "UTC"
  # Time.zone.now.formatted_offset(true, "0")  # => "0"
  def formatted_offset(
    colon = T.unsafe(nil),
    alternate_utc_string = T.unsafe(nil)
  ); end

  def freeze; end

  # Returns true if the current object's time is in the future.
  def future?; end

  # Returns a <tt>Time</tt> instance of the simultaneous time in the UTC timezone.
  def getgm; end

  # Returns a <tt>Time</tt> instance of the simultaneous time in the system timezone.
  def getlocal(utc_offset = T.unsafe(nil)); end

  # Returns a <tt>Time</tt> instance of the simultaneous time in the UTC timezone.
  def getutc; end

  # Returns true if the current time zone is set to UTC.
  #
  # Time.zone = 'UTC'                           # => 'UTC'
  # Time.zone.now.utc?                          # => true
  # Time.zone = 'Eastern Time (US & Canada)'    # => 'Eastern Time (US & Canada)'
  # Time.zone.now.utc?                          # => false
  def gmt?; end

  # Returns the offset from current time to UTC time in seconds.
  def gmt_offset; end

  # Returns a <tt>Time</tt> instance of the simultaneous time in the UTC timezone.
  def gmtime; end

  # Returns the offset from current time to UTC time in seconds.
  def gmtoff; end

  def hash; end
  def hour; end

  # Returns a string of the object's date and time in the format used by
  # HTTP requests.
  #
  # Time.zone.now.httpdate  # => "Tue, 01 Jan 2013 04:39:43 GMT"
  def httpdate; end

  # Adds an interval of time to the current object's time and returns that
  # value as a new TimeWithZone object.
  #
  # Time.zone = 'Eastern Time (US & Canada)' # => 'Eastern Time (US & Canada)'
  # now = Time.zone.now # => Sun, 02 Nov 2014 01:26:28.725182881 EDT -04:00
  # now + 1000          # => Sun, 02 Nov 2014 01:43:08.725182881 EDT -04:00
  #
  # If we're adding a Duration of variable length (i.e., years, months, days),
  # move forward from #time, otherwise move forward from #utc, for accuracy
  # when moving across DST boundaries.
  #
  # For instance, a time + 24.hours will advance exactly 24 hours, while a
  # time + 1.day will advance 23-25 hours, depending on the day.
  #
  # now + 24.hours      # => Mon, 03 Nov 2014 00:26:28.725182881 EST -05:00
  # now + 1.day         # => Mon, 03 Nov 2014 01:26:28.725182881 EST -05:00
  def in(other); end

  # Returns the simultaneous time in <tt>Time.zone</tt>, or the specified zone.
  def in_time_zone(new_zone = T.unsafe(nil)); end

  def init_with(coder); end

  # Returns a string of the object's date, time, zone, and offset from UTC.
  #
  # Time.zone.now.inspect # => "Thu, 04 Dec 2014 11:00:25.624541392 EST -05:00"
  def inspect; end

  # Say we're a Time to thwart type checking.
  def is_a?(klass); end

  # Returns true if the current time is within Daylight Savings Time for the
  # specified time zone.
  #
  # Time.zone = 'Eastern Time (US & Canada)'    # => 'Eastern Time (US & Canada)'
  # Time.zone.parse("2012-5-30").dst?           # => true
  # Time.zone.parse("2012-11-30").dst?          # => false
  def isdst; end

  # Returns a string of the object's date and time in the ISO 8601 standard
  # format.
  #
  # Time.zone.now.xmlschema  # => "2014-12-04T11:02:37-05:00"
  def iso8601(fraction_digits = T.unsafe(nil)); end

  # Say we're a Time to thwart type checking.
  def kind_of?(klass); end

  # Returns a <tt>Time</tt> instance of the simultaneous time in the system timezone.
  def localtime(utc_offset = T.unsafe(nil)); end

  def marshal_dump; end
  def marshal_load(variables); end
  def mday; end

  # Send the missing method to +time+ instance, and wrap result in a new
  # TimeWithZone with the existing +time_zone+.
  def method_missing(sym, *args, &block); end

  def min; end
  def mon; end
  def month; end

  # Returns true if the current object's time falls within
  # the next day (tomorrow).
  def next_day?; end

  def nsec; end

  # Returns true if the current object's time is in the past.
  def past?; end

  # Returns the underlying TZInfo::TimezonePeriod.
  def period; end

  # Returns true if the current object's time falls within
  # the previous day (yesterday).
  def prev_day?; end

  # respond_to_missing? is not called in some cases, such as when type conversion is
  # performed with Kernel#String
  def respond_to?(sym, include_priv = T.unsafe(nil)); end

  # Returns a string of the object's date and time in the RFC 2822 standard
  # format.
  #
  # Time.zone.now.rfc2822  # => "Tue, 01 Jan 2013 04:51:39 +0000"
  def rfc2822; end

  # Returns a string of the object's date and time in the ISO 8601 standard
  # format.
  #
  # Time.zone.now.xmlschema  # => "2014-12-04T11:02:37-05:00"
  def rfc3339(fraction_digits = T.unsafe(nil)); end

  # Returns a string of the object's date and time in the RFC 2822 standard
  # format.
  #
  # Time.zone.now.rfc2822  # => "Tue, 01 Jan 2013 04:51:39 +0000"
  def rfc822; end

  def sec; end

  # Adds an interval of time to the current object's time and returns that
  # value as a new TimeWithZone object.
  #
  # Time.zone = 'Eastern Time (US & Canada)' # => 'Eastern Time (US & Canada)'
  # now = Time.zone.now # => Sun, 02 Nov 2014 01:26:28.725182881 EDT -04:00
  # now + 1000          # => Sun, 02 Nov 2014 01:43:08.725182881 EDT -04:00
  #
  # If we're adding a Duration of variable length (i.e., years, months, days),
  # move forward from #time, otherwise move forward from #utc, for accuracy
  # when moving across DST boundaries.
  #
  # For instance, a time + 24.hours will advance exactly 24 hours, while a
  # time + 1.day will advance 23-25 hours, depending on the day.
  #
  # now + 24.hours      # => Mon, 03 Nov 2014 00:26:28.725182881 EST -05:00
  # now + 1.day         # => Mon, 03 Nov 2014 01:26:28.725182881 EST -05:00
  def since(other); end

  # Replaces <tt>%Z</tt> directive with +zone before passing to Time#strftime,
  # so that zone information is correct.
  def strftime(format); end

  # Returns a <tt>Time</tt> instance that represents the time in +time_zone+.
  def time; end

  # Returns the value of attribute time_zone.
  def time_zone; end

  # Returns Array of parts of Time in sequence of
  # [seconds, minutes, hours, day, month, year, weekday, yearday, dst?, zone].
  #
  # now = Time.zone.now     # => Tue, 18 Aug 2015 02:29:27.485278555 UTC +00:00
  # now.to_a                # => [27, 29, 2, 18, 8, 2015, 2, 230, false, "UTC"]
  def to_a; end

  def to_date; end

  # Returns an instance of DateTime with the timezone's UTC offset
  #
  # Time.zone.now.to_datetime                         # => Tue, 18 Aug 2015 02:32:20 +0000
  # Time.current.in_time_zone('Hawaii').to_datetime   # => Mon, 17 Aug 2015 16:32:20 -1000
  def to_datetime; end

  # Returns the object's date and time as a floating-point number of seconds
  # since the Epoch (January 1, 1970 00:00 UTC).
  #
  # Time.zone.now.to_f # => 1417709320.285418
  def to_f; end

  # Returns a string of the object's date and time.
  #
  # This method is aliased to <tt>to_fs</tt>.
  #
  # Accepts an optional <tt>format</tt>:
  # * <tt>:default</tt> - default value, mimics Ruby Time#to_s format.
  # * <tt>:db</tt> - format outputs time in UTC :db time. See Time#to_formatted_s(:db).
  # * Any key in <tt>Time::DATE_FORMATS</tt> can be used. See active_support/core_ext/time/conversions.rb.
  def to_formatted_s(format = T.unsafe(nil)); end

  # Returns a string of the object's date and time.
  #
  # This method is aliased to <tt>to_fs</tt>.
  #
  # Accepts an optional <tt>format</tt>:
  # * <tt>:default</tt> - default value, mimics Ruby Time#to_s format.
  # * <tt>:db</tt> - format outputs time in UTC :db time. See Time#to_formatted_s(:db).
  # * Any key in <tt>Time::DATE_FORMATS</tt> can be used. See active_support/core_ext/time/conversions.rb.
  def to_fs(format = T.unsafe(nil)); end

  # Returns the object's date and time as an integer number of seconds
  # since the Epoch (January 1, 1970 00:00 UTC).
  #
  # Time.zone.now.to_i # => 1417709320
  def to_i; end

  # Returns the object's date and time as a rational number of seconds
  # since the Epoch (January 1, 1970 00:00 UTC).
  #
  # Time.zone.now.to_r # => (708854548642709/500000)
  def to_r; end

  # Returns a string of the object's date and time.
  def to_s(format = T.unsafe(nil)); end

  # Returns an instance of +Time+, either with the same UTC offset
  # as +self+ or in the local system timezone depending on the setting
  # of +ActiveSupport.to_time_preserves_timezone+.
  def to_time; end

  # Returns true if the current object's time falls within
  # the current day.
  def today?; end

  # Returns true if the current object's time falls within
  # the next day (tomorrow).
  def tomorrow?; end

  # Returns the object's date and time as an integer number of seconds
  # since the Epoch (January 1, 1970 00:00 UTC).
  #
  # Time.zone.now.to_i # => 1417709320
  def tv_sec; end

  def usec; end

  # Returns a <tt>Time</tt> instance of the simultaneous time in the UTC timezone.
  def utc; end

  # Returns true if the current time zone is set to UTC.
  #
  # Time.zone = 'UTC'                           # => 'UTC'
  # Time.zone.now.utc?                          # => true
  # Time.zone = 'Eastern Time (US & Canada)'    # => 'Eastern Time (US & Canada)'
  # Time.zone.now.utc?                          # => false
  def utc?; end

  # Returns the offset from current time to UTC time in seconds.
  def utc_offset; end

  def wday; end

  # Returns a string of the object's date and time in the ISO 8601 standard
  # format.
  #
  # Time.zone.now.xmlschema  # => "2014-12-04T11:02:37-05:00"
  def xmlschema(fraction_digits = T.unsafe(nil)); end

  def yday; end
  def year; end

  # Returns true if the current object's time falls within
  # the previous day (yesterday).
  def yesterday?; end

  # Returns the time zone abbreviation.
  #
  # Time.zone = 'Eastern Time (US & Canada)'   # => "Eastern Time (US & Canada)"
  # Time.zone.now.zone # => "EST"
  def zone; end

  private

  def duration_of_variable_length?(obj); end
  def get_period_and_ensure_valid_local_time(period); end
  def incorporate_utc_offset(time, offset); end

  # Ensure proxy class responds to all methods that underlying time instance
  # responds to.
  def respond_to_missing?(sym, include_priv); end

  def transfer_time_values_to_utc_constructor(time); end
  def wrap_with_time_zone(time); end

  class << self
    # Report class name as 'Time' to thwart type checking.
    def name; end
  end
end

ActiveSupport::TimeWithZone::NOT_SET = T.let(T.unsafe(nil), Object)
ActiveSupport::TimeWithZone::PRECISIONS = T.let(T.unsafe(nil), Hash)
ActiveSupport::TimeWithZone::SECONDS_PER_DAY = T.let(T.unsafe(nil), Integer)

# The TimeZone class serves as a wrapper around TZInfo::Timezone instances.
# It allows us to do the following:
#
# * Limit the set of zones provided by TZInfo to a meaningful subset of 134
# zones.
# * Retrieve and display zones with a friendlier name
# (e.g., "Eastern Time (US & Canada)" instead of "America/New_York").
# * Lazily load TZInfo::Timezone instances only when they're needed.
# * Create ActiveSupport::TimeWithZone instances via TimeZone's +local+,
# +parse+, +at+ and +now+ methods.
#
# If you set <tt>config.time_zone</tt> in the Rails Application, you can
# access this TimeZone object via <tt>Time.zone</tt>:
#
# # application.rb:
# class Application < Rails::Application
# config.time_zone = 'Eastern Time (US & Canada)'
# end
#
# Time.zone      # => #<ActiveSupport::TimeZone:0x514834...>
# Time.zone.name # => "Eastern Time (US & Canada)"
# Time.zone.now  # => Sun, 18 May 2008 14:30:44 EDT -04:00
class ActiveSupport::TimeZone
  include ::Comparable

  # Create a new TimeZone object with the given name and offset. The
  # offset is the number of seconds that this time zone is offset from UTC
  # (GMT). Seconds were chosen as the offset unit because that is the unit
  # that Ruby uses to represent time zone offsets (see Time#utc_offset).
  def initialize(name, utc_offset = T.unsafe(nil), tzinfo = T.unsafe(nil)); end

  # Compare this time zone to the parameter. The two are compared first on
  # their offsets, and then by name.
  def <=>(zone); end

  # Compare #name and TZInfo identifier to a supplied regexp, returning +true+
  # if a match is found.
  def =~(re); end

  # Method for creating new ActiveSupport::TimeWithZone instance in time zone
  # of +self+ from number of seconds since the Unix epoch.
  #
  # Time.zone = 'Hawaii'        # => "Hawaii"
  # Time.utc(2000).to_f         # => 946684800.0
  # Time.zone.at(946684800.0)   # => Fri, 31 Dec 1999 14:00:00 HST -10:00
  #
  # A second argument can be supplied to specify sub-second precision.
  #
  # Time.zone = 'Hawaii'                # => "Hawaii"
  # Time.at(946684800, 123456.789).nsec # => 123456789
  def at(*args); end

  def encode_with(coder); end

  # Returns a formatted string of the offset from UTC, or an alternative
  # string if the time zone is already UTC.
  #
  # zone = ActiveSupport::TimeZone['Central Time (US & Canada)']
  # zone.formatted_offset        # => "-06:00"
  # zone.formatted_offset(false) # => "-0600"
  def formatted_offset(
    colon = T.unsafe(nil),
    alternate_utc_string = T.unsafe(nil)
  ); end

  def init_with(coder); end

  # Method for creating new ActiveSupport::TimeWithZone instance in time zone
  # of +self+ from an ISO 8601 string.
  #
  # Time.zone = 'Hawaii'                     # => "Hawaii"
  # Time.zone.iso8601('1999-12-31T14:00:00') # => Fri, 31 Dec 1999 14:00:00 HST -10:00
  #
  # If the time components are missing then they will be set to zero.
  #
  # Time.zone = 'Hawaii'            # => "Hawaii"
  # Time.zone.iso8601('1999-12-31') # => Fri, 31 Dec 1999 00:00:00 HST -10:00
  #
  # If the string is invalid then an +ArgumentError+ will be raised unlike +parse+
  # which usually returns +nil+ when given an invalid date string.
  def iso8601(str); end

  # Method for creating new ActiveSupport::TimeWithZone instance in time zone
  # of +self+ from given values.
  #
  # Time.zone = 'Hawaii'                    # => "Hawaii"
  # Time.zone.local(2007, 2, 1, 15, 30, 45) # => Thu, 01 Feb 2007 15:30:45 HST -10:00
  def local(*args); end

  # Adjust the given time to the simultaneous time in UTC. Returns a
  # Time.utc() instance.
  def local_to_utc(time, dst = T.unsafe(nil)); end

  # Compare #name and TZInfo identifier to a supplied regexp, returning +true+
  # if a match is found.
  def match?(re); end

  # Returns the value of attribute name.
  def name; end

  # Returns an ActiveSupport::TimeWithZone instance representing the current
  # time in the time zone represented by +self+.
  #
  # Time.zone = 'Hawaii'  # => "Hawaii"
  # Time.zone.now         # => Wed, 23 Jan 2008 20:24:27 HST -10:00
  def now; end

  # Method for creating new ActiveSupport::TimeWithZone instance in time zone
  # of +self+ from parsed string.
  #
  # Time.zone = 'Hawaii'                   # => "Hawaii"
  # Time.zone.parse('1999-12-31 14:00:00') # => Fri, 31 Dec 1999 14:00:00 HST -10:00
  #
  # If upper components are missing from the string, they are supplied from
  # TimeZone#now:
  #
  # Time.zone.now               # => Fri, 31 Dec 1999 14:00:00 HST -10:00
  # Time.zone.parse('22:30:00') # => Fri, 31 Dec 1999 22:30:00 HST -10:00
  #
  # However, if the date component is not provided, but any other upper
  # components are supplied, then the day of the month defaults to 1:
  #
  # Time.zone.parse('Mar 2000') # => Wed, 01 Mar 2000 00:00:00 HST -10:00
  #
  # If the string is invalid then an +ArgumentError+ could be raised.
  def parse(str, now = T.unsafe(nil)); end

  # Available so that TimeZone instances respond like TZInfo::Timezone
  # instances.
  def period_for_local(time, dst = T.unsafe(nil)); end

  # Available so that TimeZone instances respond like TZInfo::Timezone
  # instances.
  def period_for_utc(time); end

  def periods_for_local(time); end

  # Method for creating new ActiveSupport::TimeWithZone instance in time zone
  # of +self+ from an RFC 3339 string.
  #
  # Time.zone = 'Hawaii'                     # => "Hawaii"
  # Time.zone.rfc3339('2000-01-01T00:00:00Z') # => Fri, 31 Dec 1999 14:00:00 HST -10:00
  #
  # If the time or zone components are missing then an +ArgumentError+ will
  # be raised. This is much stricter than either +parse+ or +iso8601+ which
  # allow for missing components.
  #
  # Time.zone = 'Hawaii'            # => "Hawaii"
  # Time.zone.rfc3339('1999-12-31') # => ArgumentError: invalid date
  def rfc3339(str); end

  # Parses +str+ according to +format+ and returns an ActiveSupport::TimeWithZone.
  #
  # Assumes that +str+ is a time in the time zone +self+,
  # unless +format+ includes an explicit time zone.
  # (This is the same behavior as +parse+.)
  # In either case, the returned TimeWithZone has the timezone of +self+.
  #
  # Time.zone = 'Hawaii'                   # => "Hawaii"
  # Time.zone.strptime('1999-12-31 14:00:00', '%Y-%m-%d %H:%M:%S') # => Fri, 31 Dec 1999 14:00:00 HST -10:00
  #
  # If upper components are missing from the string, they are supplied from
  # TimeZone#now:
  #
  # Time.zone.now                              # => Fri, 31 Dec 1999 14:00:00 HST -10:00
  # Time.zone.strptime('22:30:00', '%H:%M:%S') # => Fri, 31 Dec 1999 22:30:00 HST -10:00
  #
  # However, if the date component is not provided, but any other upper
  # components are supplied, then the day of the month defaults to 1:
  #
  # Time.zone.strptime('Mar 2000', '%b %Y') # => Wed, 01 Mar 2000 00:00:00 HST -10:00
  def strptime(str, format, now = T.unsafe(nil)); end

  # Returns a textual representation of this time zone.
  def to_s; end

  # Returns the current date in this time zone.
  def today; end

  # Returns the next date in this time zone.
  def tomorrow; end

  # Returns the value of attribute tzinfo.
  def tzinfo; end

  # Returns the offset of this time zone from UTC in seconds.
  def utc_offset; end

  # Adjust the given time to the simultaneous time in the time zone
  # represented by +self+. Returns a local time with the appropriate offset
  # -- if you want an ActiveSupport::TimeWithZone instance, use
  # Time#in_time_zone() instead.
  #
  # As of tzinfo 2, utc_to_local returns a Time with a non-zero utc_offset.
  # See the +utc_to_local_returns_utc_offset_times+ config for more info.
  def utc_to_local(time); end

  # Returns the previous date in this time zone.
  def yesterday; end

  private

  def parts_to_time(parts, now); end
  def time_now; end

  class << self
    # Locate a specific time zone object. If the argument is a string, it
    # is interpreted to mean the name of the timezone to locate. If it is a
    # numeric value it is either the hour offset, or the second offset, of the
    # timezone to find. (The first one with that offset will be returned.)
    # Returns +nil+ if no such time zone is known to the system.
    def [](arg); end

    # Returns an array of all TimeZone objects. There are multiple
    # TimeZone objects per time zone, in many cases, to make it easier
    # for users to find their own time zone.
    def all; end

    def clear; end

    # A convenience method for returning a collection of TimeZone objects
    # for time zones in the country specified by its ISO 3166-1 Alpha2 code.
    def country_zones(country_code); end

    def create(*_arg0); end
    def find_tzinfo(name); end

    # Returns a TimeZone instance with the given name, or +nil+ if no
    # such TimeZone instance exists. (This exists to support the use of
    # this class with the +composed_of+ macro.)
    def new(name); end

    # Assumes self represents an offset from UTC in seconds (as returned from
    # Time#utc_offset) and turns this into an +HH:MM formatted string.
    #
    # ActiveSupport::TimeZone.seconds_to_utc_offset(-21_600) # => "-06:00"
    def seconds_to_utc_offset(seconds, colon = T.unsafe(nil)); end

    # A convenience method for returning a collection of TimeZone objects
    # for time zones in the USA.
    def us_zones; end

    private

    def load_country_zones(code); end
    def zones_map; end
  end
end

# Keys are Rails TimeZone names, values are TZInfo identifiers.
ActiveSupport::TimeZone::MAPPING = T.let(T.unsafe(nil), Hash)

ActiveSupport::TimeZone::UTC_OFFSET_WITHOUT_COLON = T.let(T.unsafe(nil), String)
ActiveSupport::TimeZone::UTC_OFFSET_WITH_COLON = T.let(T.unsafe(nil), String)

module ActiveSupport::ToJsonWithActiveSupportEncoder
  def to_json(options = T.unsafe(nil)); end
end

module ActiveSupport::Tryable
  def try(*args, &block); end
  def try!(*args, &block); end
end

module ActiveSupport::VERSION
end
ActiveSupport::VERSION::MAJOR = T.let(T.unsafe(nil), Integer)
ActiveSupport::VERSION::MINOR = T.let(T.unsafe(nil), Integer)
ActiveSupport::VERSION::STRING = T.let(T.unsafe(nil), String)
ActiveSupport::VERSION::TINY = T.let(T.unsafe(nil), Integer)

class ActiveSupport::XMLConverter
  def initialize(xml, disallowed_types = T.unsafe(nil)); end

  def to_h; end

  private

  def become_array?(value); end
  def become_content?(value); end
  def become_empty_string?(value); end
  def become_hash?(value); end
  def deep_to_h(value); end
  def garbage?(value); end
  def normalize_keys(params); end
  def nothing?(value); end
  def process_array(value); end
  def process_content(value); end
  def process_hash(value); end
end

ActiveSupport::XMLConverter::DISALLOWED_TYPES = T.let(T.unsafe(nil), Array)

# Raised if the XML contains attributes with type="yaml" or
# type="symbol". Read Hash#from_xml for more details.
class ActiveSupport::XMLConverter::DisallowedType < ::StandardError
  def initialize(type); end
end

# = XmlMini
#
# To use the much faster libxml parser:
# gem 'libxml-ruby', '=0.9.7'
# XmlMini.backend = 'LibXML'
module ActiveSupport::XmlMini
  extend ::ActiveSupport::XmlMini

  def backend; end
  def backend=(name); end

  # Returns the value of attribute depth.
  def depth; end

  # Sets the attribute depth
  def depth=(_arg0); end

  def parse(*_arg0, &_arg1); end
  def rename_key(key, options = T.unsafe(nil)); end
  def to_tag(key, value, options); end
  def with_backend(name); end

  private

  def _dasherize(key); end

  # TODO: Add support for other encodings
  def _parse_binary(bin, entity); end

  def _parse_file(file, entity); end
  def cast_backend_name_to_module(name); end
  def current_thread_backend; end
  def current_thread_backend=(name); end
end

ActiveSupport::XmlMini::DEFAULT_ENCODINGS = T.let(T.unsafe(nil), Hash)
ActiveSupport::XmlMini::FORMATTING = T.let(T.unsafe(nil), Hash)

# This module decorates files deserialized using Hash.from_xml with
# the <tt>original_filename</tt> and <tt>content_type</tt> methods.
module ActiveSupport::XmlMini::FileLike
  def content_type; end
  def content_type=(_arg0); end
  def original_filename; end
  def original_filename=(_arg0); end
end

ActiveSupport::XmlMini::PARSING = T.let(T.unsafe(nil), Hash)
ActiveSupport::XmlMini::TYPE_NAMES = T.let(T.unsafe(nil), Hash)

module ActiveSupport::XmlMini_REXML
  extend ::ActiveSupport::XmlMini_REXML

  # Parse an XML Document string or IO into a simple hash.
  #
  # Same as XmlSimple::xml_in but doesn't shoot itself in the foot,
  # and uses the defaults from Active Support.
  #
  # data::
  # XML Document string or IO to parse
  def parse(data); end

  private

  # Actually converts an XML document element into a data structure.
  #
  # element::
  # The document element to be collapsed.
  def collapse(element, depth); end

  # Determines if a document element has text content
  #
  # element::
  # XML element to be checked.
  def empty_content?(element); end

  # Converts the attributes array of an XML element into a hash.
  # Returns an empty Hash if node has no attributes.
  #
  # element::
  # XML element to extract attributes from.
  def get_attributes(element); end

  # Adds a new key/value pair to an existing Hash. If the key to be added
  # already exists and the existing value associated with key is not
  # an Array, it will be wrapped in an Array. Then the new value is
  # appended to that Array.
  #
  # hash::
  # Hash to add key/value pair to.
  # key::
  # Key to be added.
  # value::
  # Value to be associated with key.
  def merge!(hash, key, value); end

  # Convert an XML element and merge into the hash
  #
  # hash::
  # Hash to merge the converted element into.
  # element::
  # XML element to merge into hash
  def merge_element!(hash, element, depth); end

  # Merge all the texts of an element into the hash
  #
  # hash::
  # Hash to add the converted element to.
  # element::
  # XML element whose texts are to me merged into the hash
  def merge_texts!(hash, element); end

  def require_rexml; end
end

ActiveSupport::XmlMini_REXML::CONTENT_KEY = T.let(T.unsafe(nil), String)

class Array
  include ::Enumerable
  include ::JSON::Ext::Generator::GeneratorMethods::Array
  include ::MessagePack::CoreExt

  def as_json(options = T.unsafe(nil)); end

  # Removes all blank elements from the +Array+ in place and returns self.
  # Uses Object#blank? for determining if an item is blank.
  #
  # a = [1, "", nil, 2, " ", [], {}, false, true]
  # a.compact_blank!
  # # =>  [1, 2, true]
  def compact_blank!; end

  # Returns a deep copy of array.
  #
  # array = [1, [2, 3]]
  # dup   = array.deep_dup
  # dup[1][2] = 4
  #
  # array[1][2] # => nil
  # dup[1][2]   # => 4
  def deep_dup; end

  # Returns a copy of the Array excluding the specified elements.
  #
  # ["David", "Rafael", "Aaron", "Todd"].excluding("Aaron", "Todd") # => ["David", "Rafael"]
  # [ [ 0, 1 ], [ 1, 0 ] ].excluding([ [ 1, 0 ] ]) # => [ [ 0, 1 ] ]
  #
  # Note: This is an optimization of <tt>Enumerable#excluding</tt> that uses <tt>Array#-</tt>
  # instead of <tt>Array#reject</tt> for performance reasons.
  def excluding(*elements); end

  # Removes and returns the elements for which the block returns a true value.
  # If no block is given, an Enumerator is returned instead.
  #
  # numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
  # odd_numbers = numbers.extract! { |number| number.odd? } # => [1, 3, 5, 7, 9]
  # numbers # => [0, 2, 4, 6, 8]
  def extract!; end

  # Extracts options from a set of arguments. Removes and returns the last
  # element in the array if it's a hash, otherwise returns a blank hash.
  #
  # def options(*args)
  # args.extract_options!
  # end
  #
  # options(1, 2)        # => {}
  # options(1, 2, a: :b) # => {:a=>:b}
  def extract_options!; end

  # Equal to <tt>self[4]</tt>.
  #
  # %w( a b c d e ).fifth # => "e"
  def fifth; end

  # Equal to <tt>self[41]</tt>. Also known as accessing "the reddit".
  #
  # (1..42).to_a.forty_two # => 42
  def forty_two; end

  # Equal to <tt>self[3]</tt>.
  #
  # %w( a b c d e ).fourth # => "d"
  def fourth; end

  # Returns the tail of the array from +position+.
  #
  # %w( a b c d ).from(0)  # => ["a", "b", "c", "d"]
  # %w( a b c d ).from(2)  # => ["c", "d"]
  # %w( a b c d ).from(10) # => []
  # %w().from(0)           # => []
  # %w( a b c d ).from(-2) # => ["c", "d"]
  # %w( a b c ).from(-10)  # => []
  def from(position); end

  # Splits or iterates over the array in +number+ of groups, padding any
  # remaining slots with +fill_with+ unless it is +false+.
  #
  # %w(1 2 3 4 5 6 7 8 9 10).in_groups(3) {|group| p group}
  # ["1", "2", "3", "4"]
  # ["5", "6", "7", nil]
  # ["8", "9", "10", nil]
  #
  # %w(1 2 3 4 5 6 7 8 9 10).in_groups(3, '&nbsp;') {|group| p group}
  # ["1", "2", "3", "4"]
  # ["5", "6", "7", "&nbsp;"]
  # ["8", "9", "10", "&nbsp;"]
  #
  # %w(1 2 3 4 5 6 7).in_groups(3, false) {|group| p group}
  # ["1", "2", "3"]
  # ["4", "5"]
  # ["6", "7"]
  def in_groups(number, fill_with = T.unsafe(nil), &block); end

  # Splits or iterates over the array in groups of size +number+,
  # padding any remaining slots with +fill_with+ unless it is +false+.
  #
  # %w(1 2 3 4 5 6 7 8 9 10).in_groups_of(3) {|group| p group}
  # ["1", "2", "3"]
  # ["4", "5", "6"]
  # ["7", "8", "9"]
  # ["10", nil, nil]
  #
  # %w(1 2 3 4 5).in_groups_of(2, '&nbsp;') {|group| p group}
  # ["1", "2"]
  # ["3", "4"]
  # ["5", "&nbsp;"]
  #
  # %w(1 2 3 4 5).in_groups_of(2, false) {|group| p group}
  # ["1", "2"]
  # ["3", "4"]
  # ["5"]
  def in_groups_of(number, fill_with = T.unsafe(nil), &block); end

  # Returns a new array that includes the passed elements.
  #
  # [ 1, 2, 3 ].including(4, 5) # => [ 1, 2, 3, 4, 5 ]
  # [ [ 0, 1 ] ].including([ [ 1, 0 ] ]) # => [ [ 0, 1 ], [ 1, 0 ] ]
  def including(*elements); end

  # Wraps the array in an +ArrayInquirer+ object, which gives a friendlier way
  # to check its string-like contents.
  #
  # pets = [:cat, :dog].inquiry
  #
  # pets.cat?     # => true
  # pets.ferret?  # => false
  #
  # pets.any?(:cat, :ferret)  # => true
  # pets.any?(:ferret, :alligator)  # => false
  def inquiry; end

  # Equal to <tt>self[1]</tt>.
  #
  # %w( a b c d e ).second # => "b"
  def second; end

  # Equal to <tt>self[-2]</tt>.
  #
  # %w( a b c d e ).second_to_last # => "d"
  def second_to_last; end

  # Divides the array into one or more subarrays based on a delimiting +value+
  # or the result of an optional block.
  #
  # [1, 2, 3, 4, 5].split(3)              # => [[1, 2], [4, 5]]
  # (1..10).to_a.split { |i| i % 3 == 0 } # => [[1, 2], [4, 5], [7, 8], [10]]
  def split(value = T.unsafe(nil), &block); end

  def sum(init = T.unsafe(nil), &block); end

  # Equal to <tt>self[2]</tt>.
  #
  # %w( a b c d e ).third # => "c"
  def third; end

  # Equal to <tt>self[-3]</tt>.
  #
  # %w( a b c d e ).third_to_last # => "c"
  def third_to_last; end

  # Returns the beginning of the array up to +position+.
  #
  # %w( a b c d ).to(0)  # => ["a"]
  # %w( a b c d ).to(2)  # => ["a", "b", "c"]
  # %w( a b c d ).to(10) # => ["a", "b", "c", "d"]
  # %w().to(0)           # => []
  # %w( a b c d ).to(-2) # => ["a", "b", "c"]
  # %w( a b c ).to(-10)  # => []
  def to(position); end

  # Extends <tt>Array#to_s</tt> to convert a collection of elements into a
  # comma separated id list if <tt>:db</tt> argument is given as the format.
  #
  # This method is aliased to <tt>to_fs</tt>.
  #
  # Blog.all.to_formatted_s(:db)  # => "1,2,3"
  # Blog.none.to_formatted_s(:db) # => "null"
  # [1,2].to_formatted_s          # => "[1, 2]"
  def to_formatted_s(format = T.unsafe(nil)); end

  # Extends <tt>Array#to_s</tt> to convert a collection of elements into a
  # comma separated id list if <tt>:db</tt> argument is given as the format.
  #
  # This method is aliased to <tt>to_fs</tt>.
  #
  # Blog.all.to_formatted_s(:db)  # => "1,2,3"
  # Blog.none.to_formatted_s(:db) # => "null"
  # [1,2].to_formatted_s          # => "[1, 2]"
  def to_fs(format = T.unsafe(nil)); end

  # Calls <tt>to_param</tt> on all its elements and joins the result with
  # slashes. This is used by <tt>url_for</tt> in Action Pack.
  def to_param; end

  # Converts an array into a string suitable for use as a URL query string,
  # using the given +key+ as the param name.
  #
  # ['Rails', 'coding'].to_query('hobbies') # => "hobbies%5B%5D=Rails&hobbies%5B%5D=coding"
  def to_query(key); end

  # def to_s(format = T.unsafe(nil)); end

  # Converts the array to a comma-separated sentence where the last element is
  # joined by the connector word.
  #
  # You can pass the following options to change the default behavior. If you
  # pass an option key that doesn't exist in the list below, it will raise an
  # <tt>ArgumentError</tt>.
  #
  # ==== Options
  #
  # * <tt>:words_connector</tt> - The sign or word used to join all but the last
  # element in arrays with three or more elements (default: ", ").
  # * <tt>:last_word_connector</tt> - The sign or word used to join the last element
  # in arrays with three or more elements (default: ", and ").
  # * <tt>:two_words_connector</tt> - The sign or word used to join the elements
  # in arrays with two elements (default: " and ").
  # * <tt>:locale</tt> - If +i18n+ is available, you can set a locale and use
  # the connector options defined on the 'support.array' namespace in the
  # corresponding dictionary file.
  #
  # ==== Examples
  #
  # [].to_sentence                      # => ""
  # ['one'].to_sentence                 # => "one"
  # ['one', 'two'].to_sentence          # => "one and two"
  # ['one', 'two', 'three'].to_sentence # => "one, two, and three"
  #
  # ['one', 'two'].to_sentence(passing: 'invalid option')
  # # => ArgumentError: Unknown key: :passing. Valid keys are: :words_connector, :two_words_connector, :last_word_connector, :locale
  #
  # ['one', 'two'].to_sentence(two_words_connector: '-')
  # # => "one-two"
  #
  # ['one', 'two', 'three'].to_sentence(words_connector: ' or ', last_word_connector: ' or at least ')
  # # => "one or two or at least three"
  #
  # Using <tt>:locale</tt> option:
  #
  # # Given this locale dictionary:
  # #
  # #   es:
  # #     support:
  # #       array:
  # #         words_connector: " o "
  # #         two_words_connector: " y "
  # #         last_word_connector: " o al menos "
  #
  # ['uno', 'dos'].to_sentence(locale: :es)
  # # => "uno y dos"
  #
  # ['uno', 'dos', 'tres'].to_sentence(locale: :es)
  # # => "uno o dos o al menos tres"
  def to_sentence(options = T.unsafe(nil)); end

  # Returns a string that represents the array in XML by invoking +to_xml+
  # on each element. Active Record collections delegate their representation
  # in XML to this method.
  #
  # All elements are expected to respond to +to_xml+, if any of them does
  # not then an exception is raised.
  #
  # The root node reflects the class name of the first element in plural
  # if all elements belong to the same type and that's not Hash:
  #
  # customer.projects.to_xml
  #
  # <?xml version="1.0" encoding="UTF-8"?>
  # <projects type="array">
  # <project>
  # <amount type="decimal">20000.0</amount>
  # <customer-id type="integer">1567</customer-id>
  # <deal-date type="date">2008-04-09</deal-date>
  # ...
  # </project>
  # <project>
  # <amount type="decimal">57230.0</amount>
  # <customer-id type="integer">1567</customer-id>
  # <deal-date type="date">2008-04-15</deal-date>
  # ...
  # </project>
  # </projects>
  #
  # Otherwise the root element is "objects":
  #
  # [{ foo: 1, bar: 2}, { baz: 3}].to_xml
  #
  # <?xml version="1.0" encoding="UTF-8"?>
  # <objects type="array">
  # <object>
  # <bar type="integer">2</bar>
  # <foo type="integer">1</foo>
  # </object>
  # <object>
  # <baz type="integer">3</baz>
  # </object>
  # </objects>
  #
  # If the collection is empty the root element is "nil-classes" by default:
  #
  # [].to_xml
  #
  # <?xml version="1.0" encoding="UTF-8"?>
  # <nil-classes type="array"/>
  #
  # To ensure a meaningful root element use the <tt>:root</tt> option:
  #
  # customer_with_no_projects.projects.to_xml(root: 'projects')
  #
  # <?xml version="1.0" encoding="UTF-8"?>
  # <projects type="array"/>
  #
  # By default name of the node for the children of root is <tt>root.singularize</tt>.
  # You can change it with the <tt>:children</tt> option.
  #
  # The +options+ hash is passed downwards:
  #
  # Message.all.to_xml(skip_types: true)
  #
  # <?xml version="1.0" encoding="UTF-8"?>
  # <messages>
  # <message>
  # <created-at>2008-03-07T09:58:18+01:00</created-at>
  # <id>1</id>
  # <name>1</name>
  # <updated-at>2008-03-07T09:58:18+01:00</updated-at>
  # <user-id>1</user-id>
  # </message>
  # </messages>
  def to_xml(options = T.unsafe(nil)); end

  # Returns a copy of the Array excluding the specified elements.
  #
  # ["David", "Rafael", "Aaron", "Todd"].excluding("Aaron", "Todd") # => ["David", "Rafael"]
  # [ [ 0, 1 ], [ 1, 0 ] ].excluding([ [ 1, 0 ] ]) # => [ [ 0, 1 ] ]
  #
  # Note: This is an optimization of <tt>Enumerable#excluding</tt> that uses <tt>Array#-</tt>
  # instead of <tt>Array#reject</tt> for performance reasons.
  def without(*elements); end

  class << self
    # Wraps its argument in an array unless it is already an array (or array-like).
    #
    # Specifically:
    #
    # * If the argument is +nil+ an empty array is returned.
    # * Otherwise, if the argument responds to +to_ary+ it is invoked, and its result returned.
    # * Otherwise, returns an array with the argument as its single element.
    #
    # Array.wrap(nil)       # => []
    # Array.wrap([1, 2, 3]) # => [1, 2, 3]
    # Array.wrap(0)         # => [0]
    #
    # This method is similar in purpose to <tt>Kernel#Array</tt>, but there are some differences:
    #
    # * If the argument responds to +to_ary+ the method is invoked. <tt>Kernel#Array</tt>
    # moves on to try +to_a+ if the returned value is +nil+, but <tt>Array.wrap</tt> returns
    # an array with the argument as its single element right away.
    # * If the returned value from +to_ary+ is neither +nil+ nor an +Array+ object, <tt>Kernel#Array</tt>
    # raises an exception, while <tt>Array.wrap</tt> does not, it just returns the value.
    # * It does not call +to_a+ on the argument, if the argument does not respond to +to_ary+
    # it returns an array with the argument as its single element.
    #
    # The last point is easily explained with some enumerables:
    #
    # Array(foo: :bar)      # => [[:foo, :bar]]
    # Array.wrap(foo: :bar) # => [{:foo=>:bar}]
    #
    # There's also a related idiom that uses the splat operator:
    #
    # [*object]
    #
    # which returns <tt>[]</tt> for +nil+, but calls to <tt>Array(object)</tt> otherwise.
    #
    # The differences with <tt>Kernel#Array</tt> explained above
    # apply to the rest of <tt>object</tt>s.
    def wrap(object); end
  end
end

Array::NOT_SET = T.let(T.unsafe(nil), Object)

class BigDecimal < ::Numeric
  include ::ActiveSupport::BigDecimalWithDefaultFormat
  include ::ActiveSupport::NumericWithFormat
  include ::ActiveSupport::DeprecatedNumericWithFormat

  # A BigDecimal would be naturally represented as a JSON number. Most libraries,
  # however, parse non-integer JSON numbers directly as floats. Clients using
  # those libraries would get in general a wrong number and no way to recover
  # other than manually inspecting the string with the JSON code itself.
  #
  # That's why a JSON string is returned. The JSON literal is not numeric, but
  # if the other end knows by contract that the data is supposed to be a
  # BigDecimal, it still has the chance to post-process the string and get the
  # real value.
  def as_json(options = T.unsafe(nil)); end
end

BigDecimal::EXCEPTION_NaN = T.let(T.unsafe(nil), Integer)
BigDecimal::VERSION = T.let(T.unsafe(nil), String)

class Class < ::Module
  # Declare a class-level attribute whose value is inheritable by subclasses.
  # Subclasses can change their own value and it will not impact parent class.
  #
  # ==== Options
  #
  # * <tt>:instance_reader</tt> - Sets the instance reader method (defaults to true).
  # * <tt>:instance_writer</tt> - Sets the instance writer method (defaults to true).
  # * <tt>:instance_accessor</tt> - Sets both instance methods (defaults to true).
  # * <tt>:instance_predicate</tt> - Sets a predicate method (defaults to true).
  # * <tt>:default</tt> - Sets a default value for the attribute (defaults to nil).
  #
  # ==== Examples
  #
  # class Base
  # class_attribute :setting
  # end
  #
  # class Subclass < Base
  # end
  #
  # Base.setting = true
  # Subclass.setting            # => true
  # Subclass.setting = false
  # Subclass.setting            # => false
  # Base.setting                # => true
  #
  # In the above case as long as Subclass does not assign a value to setting
  # by performing <tt>Subclass.setting = _something_</tt>, <tt>Subclass.setting</tt>
  # would read value assigned to parent class. Once Subclass assigns a value then
  # the value assigned by Subclass would be returned.
  #
  # This matches normal Ruby method inheritance: think of writing an attribute
  # on a subclass as overriding the reader method. However, you need to be aware
  # when using +class_attribute+ with mutable structures as +Array+ or +Hash+.
  # In such cases, you don't want to do changes in place. Instead use setters:
  #
  # Base.setting = []
  # Base.setting                # => []
  # Subclass.setting            # => []
  #
  # # Appending in child changes both parent and child because it is the same object:
  # Subclass.setting << :foo
  # Base.setting               # => [:foo]
  # Subclass.setting           # => [:foo]
  #
  # # Use setters to not propagate changes:
  # Base.setting = []
  # Subclass.setting += [:foo]
  # Base.setting               # => []
  # Subclass.setting           # => [:foo]
  #
  # For convenience, an instance predicate method is defined as well.
  # To skip it, pass <tt>instance_predicate: false</tt>.
  #
  # Subclass.setting?       # => false
  #
  # Instances may overwrite the class value in the same way:
  #
  # Base.setting = true
  # object = Base.new
  # object.setting          # => true
  # object.setting = false
  # object.setting          # => false
  # Base.setting            # => true
  #
  # To opt out of the instance reader method, pass <tt>instance_reader: false</tt>.
  #
  # object.setting          # => NoMethodError
  # object.setting?         # => NoMethodError
  #
  # To opt out of the instance writer method, pass <tt>instance_writer: false</tt>.
  #
  # object.setting = false  # => NoMethodError
  #
  # To opt out of both instance methods, pass <tt>instance_accessor: false</tt>.
  #
  # To set a default value for the attribute, pass <tt>default:</tt>, like so:
  #
  # class_attribute :settings, default: {}
  def class_attribute(
    *attrs,
    instance_accessor: T.unsafe(nil),
    instance_reader: T.unsafe(nil),
    instance_writer: T.unsafe(nil),
    instance_predicate: T.unsafe(nil),
    default: T.unsafe(nil)
  ); end

  # Returns an array with all classes that are < than its receiver.
  #
  # class C; end
  # C.descendants # => []
  #
  # class B < C; end
  # C.descendants # => [B]
  #
  # class A < B; end
  # C.descendants # => [B, A]
  #
  # class D < C; end
  # C.descendants # => [B, A, D]
  def descendants; end

  # Returns an array with the direct children of +self+.
  #
  # class Foo; end
  # class Bar < Foo; end
  # class Baz < Bar; end
  #
  # Foo.subclasses # => [Bar]
  def subclasses; end
end

class Date
  include ::Comparable
  include ::DateAndTime::Zones
  include ::DateAndTime::Calculations

  def +(other); end
  def -(other); end

  # Allow Date to be compared with Time by converting to DateTime and relying on the <=> from there.
  def <=>(other); end

  # Duck-types as a Date-like class. See Object#acts_like?.
  def acts_like_date?; end

  # Provides precise Date calculations for years, months, and days. The +options+ parameter takes a hash with
  # any of these keys: <tt>:years</tt>, <tt>:months</tt>, <tt>:weeks</tt>, <tt>:days</tt>.
  def advance(options); end

  # Converts Date to a Time (or DateTime if necessary) with the time portion set to the beginning of the day (0:00)
  # and then subtracts the specified number of seconds.
  def ago(seconds); end

  def as_json(options = T.unsafe(nil)); end

  # Converts Date to a Time (or DateTime if necessary) with the time portion set to the beginning of the day (0:00)
  def at_beginning_of_day; end

  # Converts Date to a Time (or DateTime if necessary) with the time portion set to the end of the day (23:59:59)
  def at_end_of_day; end

  # Converts Date to a Time (or DateTime if necessary) with the time portion set to the middle of the day (12:00)
  def at_midday; end

  # Converts Date to a Time (or DateTime if necessary) with the time portion set to the middle of the day (12:00)
  def at_middle_of_day; end

  # Converts Date to a Time (or DateTime if necessary) with the time portion set to the beginning of the day (0:00)
  def at_midnight; end

  # Converts Date to a Time (or DateTime if necessary) with the time portion set to the middle of the day (12:00)
  def at_noon; end

  # Converts Date to a Time (or DateTime if necessary) with the time portion set to the beginning of the day (0:00)
  def beginning_of_day; end

  # No Date is blank:
  #
  # Date.today.blank? # => false
  def blank?; end

  # Returns a new Date where one or more of the elements have been changed according to the +options+ parameter.
  # The +options+ parameter is a hash with a combination of these keys: <tt>:year</tt>, <tt>:month</tt>, <tt>:day</tt>.
  #
  # Date.new(2007, 5, 12).change(day: 1)               # => Date.new(2007, 5, 1)
  # Date.new(2007, 5, 12).change(year: 2005, month: 1) # => Date.new(2005, 1, 12)
  def change(options); end

  # Allow Date to be compared with Time by converting to DateTime and relying on the <=> from there.
  def compare_with_coercion(other); end

  # Converts Date to a Time (or DateTime if necessary) with the time portion set to the end of the day (23:59:59)
  def end_of_day; end

  # Converts Date to a Time (or DateTime if necessary) with the time portion set to the beginning of the day (0:00)
  # and then adds the specified number of seconds
  def in(seconds); end

  # Overrides the default inspect method with a human readable one, e.g., "Mon, 21 Feb 2005"
  def inspect; end

  # Converts Date to a Time (or DateTime if necessary) with the time portion set to the middle of the day (12:00)
  def midday; end

  # Converts Date to a Time (or DateTime if necessary) with the time portion set to the middle of the day (12:00)
  def middle_of_day; end

  # Converts Date to a Time (or DateTime if necessary) with the time portion set to the beginning of the day (0:00)
  def midnight; end

  def minus_with_duration(other); end

  # Converts Date to a Time (or DateTime if necessary) with the time portion set to the middle of the day (12:00)
  def noon; end

  def plus_with_duration(other); end

  # Overrides the default inspect method with a human readable one, e.g., "Mon, 21 Feb 2005"
  def readable_inspect; end

  # Converts Date to a Time (or DateTime if necessary) with the time portion set to the beginning of the day (0:00)
  # and then adds the specified number of seconds
  def since(seconds); end

  # Convert to a formatted string. See DATE_FORMATS for predefined formats.
  #
  # This method is aliased to <tt>to_fs</tt>.
  #
  # date = Date.new(2007, 11, 10)       # => Sat, 10 Nov 2007
  #
  # date.to_formatted_s(:db)            # => "2007-11-10"
  # date.to_fs(:db)                     # => "2007-11-10"
  #
  # date.to_formatted_s(:short)         # => "10 Nov"
  # date.to_formatted_s(:number)        # => "20071110"
  # date.to_formatted_s(:long)          # => "November 10, 2007"
  # date.to_formatted_s(:long_ordinal)  # => "November 10th, 2007"
  # date.to_formatted_s(:rfc822)        # => "10 Nov 2007"
  # date.to_formatted_s(:iso8601)       # => "2007-11-10"
  #
  # == Adding your own date formats to to_formatted_s
  # You can add your own formats to the Date::DATE_FORMATS hash.
  # Use the format name as the hash key and either a strftime string
  # or Proc instance that takes a date argument as the value.
  #
  # # config/initializers/date_formats.rb
  # Date::DATE_FORMATS[:month_and_year] = '%B %Y'
  # Date::DATE_FORMATS[:short_ordinal] = ->(date) { date.strftime("%B #{date.day.ordinalize}") }
  def to_formatted_s(format = T.unsafe(nil)); end

  # Convert to a formatted string. See DATE_FORMATS for predefined formats.
  #
  # This method is aliased to <tt>to_fs</tt>.
  #
  # date = Date.new(2007, 11, 10)       # => Sat, 10 Nov 2007
  #
  # date.to_formatted_s(:db)            # => "2007-11-10"
  # date.to_fs(:db)                     # => "2007-11-10"
  #
  # date.to_formatted_s(:short)         # => "10 Nov"
  # date.to_formatted_s(:number)        # => "20071110"
  # date.to_formatted_s(:long)          # => "November 10, 2007"
  # date.to_formatted_s(:long_ordinal)  # => "November 10th, 2007"
  # date.to_formatted_s(:rfc822)        # => "10 Nov 2007"
  # date.to_formatted_s(:iso8601)       # => "2007-11-10"
  #
  # == Adding your own date formats to to_formatted_s
  # You can add your own formats to the Date::DATE_FORMATS hash.
  # Use the format name as the hash key and either a strftime string
  # or Proc instance that takes a date argument as the value.
  #
  # # config/initializers/date_formats.rb
  # Date::DATE_FORMATS[:month_and_year] = '%B %Y'
  # Date::DATE_FORMATS[:short_ordinal] = ->(date) { date.strftime("%B #{date.day.ordinalize}") }
  def to_fs(format = T.unsafe(nil)); end

  # def to_s(format = T.unsafe(nil)); end

  # Converts a Date instance to a Time, where the time is set to the beginning of the day.
  # The timezone can be either :local or :utc (default :local).
  #
  # date = Date.new(2007, 11, 10)  # => Sat, 10 Nov 2007
  #
  # date.to_time                   # => 2007-11-10 00:00:00 0800
  # date.to_time(:local)           # => 2007-11-10 00:00:00 0800
  #
  # date.to_time(:utc)             # => 2007-11-10 00:00:00 UTC
  #
  # NOTE: The :local timezone is Ruby's *process* timezone, i.e. ENV['TZ'].
  # If the *application's* timezone is needed, then use +in_time_zone+ instead.
  # def to_time(form = T.unsafe(nil)); end

  # Returns a string which represents the time in used time zone as DateTime
  # defined by XML Schema:
  #
  # date = Date.new(2015, 05, 23)  # => Sat, 23 May 2015
  # date.xmlschema                 # => "2015-05-23T00:00:00+04:00"
  def xmlschema; end

  class << self
    # Returns the week start (e.g. :monday) for the current request, if this has been set (via Date.beginning_of_week=).
    # If <tt>Date.beginning_of_week</tt> has not been set for the current request, returns the week start specified in <tt>config.beginning_of_week</tt>.
    # If no config.beginning_of_week was specified, returns :monday.
    def beginning_of_week; end

    # Sets <tt>Date.beginning_of_week</tt> to a week start (e.g. :monday) for current request/thread.
    #
    # This method accepts any of the following day symbols:
    # :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday
    def beginning_of_week=(week_start); end

    # Returns the value of attribute beginning_of_week_default.
    def beginning_of_week_default; end

    # Sets the attribute beginning_of_week_default
    def beginning_of_week_default=(_arg0); end

    # Returns Time.zone.today when <tt>Time.zone</tt> or <tt>config.time_zone</tt> are set, otherwise just returns Date.today.
    def current; end

    # Returns week start day symbol (e.g. :monday), or raises an +ArgumentError+ for invalid day symbol.
    def find_beginning_of_week!(week_start); end

    # Returns a new Date representing the date 1 day after today (i.e. tomorrow's date).
    def tomorrow; end

    # Returns a new Date representing the date 1 day ago (i.e. yesterday's date).
    def yesterday; end
  end
end

Date::DATE_FORMATS = T.let(T.unsafe(nil), Hash)
Date::NOT_SET = T.let(T.unsafe(nil), Object)
Date::VERSION = T.let(T.unsafe(nil), String)
module DateAndTime
end

module DateAndTime::Calculations
  # Returns true if the date/time falls after <tt>date_or_time</tt>.
  def after?(date_or_time); end

  # Returns a Range representing the whole day of the current date/time.
  def all_day; end

  # Returns a Range representing the whole month of the current date/time.
  def all_month; end

  # Returns a Range representing the whole quarter of the current date/time.
  def all_quarter; end

  # Returns a Range representing the whole week of the current date/time.
  # Week starts on start_day, default is <tt>Date.beginning_of_week</tt> or <tt>config.beginning_of_week</tt> when set.
  def all_week(start_day = T.unsafe(nil)); end

  # Returns a Range representing the whole year of the current date/time.
  def all_year; end

  # Returns a new date/time at the start of the month.
  #
  # today = Date.today # => Thu, 18 Jun 2015
  # today.beginning_of_month # => Mon, 01 Jun 2015
  #
  # +DateTime+ objects will have a time set to 0:00.
  #
  # now = DateTime.current # => Thu, 18 Jun 2015 15:23:13 +0000
  # now.beginning_of_month # => Mon, 01 Jun 2015 00:00:00 +0000
  def at_beginning_of_month; end

  # Returns a new date/time at the start of the quarter.
  #
  # today = Date.today # => Fri, 10 Jul 2015
  # today.beginning_of_quarter # => Wed, 01 Jul 2015
  #
  # +DateTime+ objects will have a time set to 0:00.
  #
  # now = DateTime.current # => Fri, 10 Jul 2015 18:41:29 +0000
  # now.beginning_of_quarter # => Wed, 01 Jul 2015 00:00:00 +0000
  def at_beginning_of_quarter; end

  # Returns a new date/time representing the start of this week on the given day.
  # Week is assumed to start on +start_day+, default is
  # +Date.beginning_of_week+ or +config.beginning_of_week+ when set.
  # +DateTime+ objects have their time set to 0:00.
  def at_beginning_of_week(start_day = T.unsafe(nil)); end

  # Returns a new date/time at the beginning of the year.
  #
  # today = Date.today # => Fri, 10 Jul 2015
  # today.beginning_of_year # => Thu, 01 Jan 2015
  #
  # +DateTime+ objects will have a time set to 0:00.
  #
  # now = DateTime.current # => Fri, 10 Jul 2015 18:41:29 +0000
  # now.beginning_of_year # => Thu, 01 Jan 2015 00:00:00 +0000
  def at_beginning_of_year; end

  # Returns a new date/time representing the end of the month.
  # DateTime objects will have a time set to 23:59:59.
  def at_end_of_month; end

  # Returns a new date/time at the end of the quarter.
  #
  # today = Date.today # => Fri, 10 Jul 2015
  # today.end_of_quarter # => Wed, 30 Sep 2015
  #
  # +DateTime+ objects will have a time set to 23:59:59.
  #
  # now = DateTime.current # => Fri, 10 Jul 2015 18:41:29 +0000
  # now.end_of_quarter # => Wed, 30 Sep 2015 23:59:59 +0000
  def at_end_of_quarter; end

  # Returns a new date/time representing the end of this week on the given day.
  # Week is assumed to start on +start_day+, default is
  # +Date.beginning_of_week+ or +config.beginning_of_week+ when set.
  # DateTime objects have their time set to 23:59:59.
  def at_end_of_week(start_day = T.unsafe(nil)); end

  # Returns a new date/time representing the end of the year.
  # DateTime objects will have a time set to 23:59:59.
  def at_end_of_year; end

  # Returns true if the date/time falls before <tt>date_or_time</tt>.
  def before?(date_or_time); end

  # Returns a new date/time at the start of the month.
  #
  # today = Date.today # => Thu, 18 Jun 2015
  # today.beginning_of_month # => Mon, 01 Jun 2015
  #
  # +DateTime+ objects will have a time set to 0:00.
  #
  # now = DateTime.current # => Thu, 18 Jun 2015 15:23:13 +0000
  # now.beginning_of_month # => Mon, 01 Jun 2015 00:00:00 +0000
  def beginning_of_month; end

  # Returns a new date/time at the start of the quarter.
  #
  # today = Date.today # => Fri, 10 Jul 2015
  # today.beginning_of_quarter # => Wed, 01 Jul 2015
  #
  # +DateTime+ objects will have a time set to 0:00.
  #
  # now = DateTime.current # => Fri, 10 Jul 2015 18:41:29 +0000
  # now.beginning_of_quarter # => Wed, 01 Jul 2015 00:00:00 +0000
  def beginning_of_quarter; end

  # Returns a new date/time representing the start of this week on the given day.
  # Week is assumed to start on +start_day+, default is
  # +Date.beginning_of_week+ or +config.beginning_of_week+ when set.
  # +DateTime+ objects have their time set to 0:00.
  def beginning_of_week(start_day = T.unsafe(nil)); end

  # Returns a new date/time at the beginning of the year.
  #
  # today = Date.today # => Fri, 10 Jul 2015
  # today.beginning_of_year # => Thu, 01 Jan 2015
  #
  # +DateTime+ objects will have a time set to 0:00.
  #
  # now = DateTime.current # => Fri, 10 Jul 2015 18:41:29 +0000
  # now.beginning_of_year # => Thu, 01 Jan 2015 00:00:00 +0000
  def beginning_of_year; end

  # Returns a new date/time the specified number of days ago.
  def days_ago(days); end

  # Returns a new date/time the specified number of days in the future.
  def days_since(days); end

  # Returns the number of days to the start of the week on the given day.
  # Week is assumed to start on +start_day+, default is
  # +Date.beginning_of_week+ or +config.beginning_of_week+ when set.
  def days_to_week_start(start_day = T.unsafe(nil)); end

  # Returns a new date/time representing the end of the month.
  # DateTime objects will have a time set to 23:59:59.
  def end_of_month; end

  # Returns a new date/time at the end of the quarter.
  #
  # today = Date.today # => Fri, 10 Jul 2015
  # today.end_of_quarter # => Wed, 30 Sep 2015
  #
  # +DateTime+ objects will have a time set to 23:59:59.
  #
  # now = DateTime.current # => Fri, 10 Jul 2015 18:41:29 +0000
  # now.end_of_quarter # => Wed, 30 Sep 2015 23:59:59 +0000
  def end_of_quarter; end

  # Returns a new date/time representing the end of this week on the given day.
  # Week is assumed to start on +start_day+, default is
  # +Date.beginning_of_week+ or +config.beginning_of_week+ when set.
  # DateTime objects have their time set to 23:59:59.
  def end_of_week(start_day = T.unsafe(nil)); end

  # Returns a new date/time representing the end of the year.
  # DateTime objects will have a time set to 23:59:59.
  def end_of_year; end

  # Returns true if the date/time is in the future.
  def future?; end

  # Short-hand for months_ago(1).
  def last_month; end

  # Short-hand for months_ago(3).
  def last_quarter; end

  # Returns a new date/time representing the given day in the previous week.
  # Week is assumed to start on +start_day+, default is
  # +Date.beginning_of_week+ or +config.beginning_of_week+ when set.
  # DateTime objects have their time set to 0:00 unless +same_time+ is true.
  def last_week(start_day = T.unsafe(nil), same_time: T.unsafe(nil)); end

  # Returns a new date/time representing the previous weekday.
  def last_weekday; end

  # Short-hand for years_ago(1).
  def last_year; end

  # Returns Monday of this week assuming that week starts on Monday.
  # +DateTime+ objects have their time set to 0:00.
  def monday; end

  # Returns a new date/time the specified number of months ago.
  def months_ago(months); end

  # Returns a new date/time the specified number of months in the future.
  def months_since(months); end

  # Returns true if the date/time is tomorrow.
  def next_day?; end

  # Returns a new date/time representing the next occurrence of the specified day of week.
  #
  # today = Date.today               # => Thu, 14 Dec 2017
  # today.next_occurring(:monday)    # => Mon, 18 Dec 2017
  # today.next_occurring(:thursday)  # => Thu, 21 Dec 2017
  def next_occurring(day_of_week); end

  # Short-hand for months_since(3)
  def next_quarter; end

  # Returns a new date/time representing the given day in the next week.
  #
  # today = Date.today # => Thu, 07 May 2015
  # today.next_week    # => Mon, 11 May 2015
  #
  # The +given_day_in_next_week+ defaults to the beginning of the week
  # which is determined by +Date.beginning_of_week+ or +config.beginning_of_week+
  # when set.
  #
  # today = Date.today       # => Thu, 07 May 2015
  # today.next_week(:friday) # => Fri, 15 May 2015
  #
  # +DateTime+ objects have their time set to 0:00 unless +same_time+ is true.
  #
  # now = DateTime.current # => Thu, 07 May 2015 13:31:16 +0000
  # now.next_week      # => Mon, 11 May 2015 00:00:00 +0000
  def next_week(
    given_day_in_next_week = T.unsafe(nil),
    same_time: T.unsafe(nil)
  ); end

  # Returns a new date/time representing the next weekday.
  def next_weekday; end

  # Returns true if the date/time does not fall on a Saturday or Sunday.
  def on_weekday?; end

  # Returns true if the date/time falls on a Saturday or Sunday.
  def on_weekend?; end

  # Returns true if the date/time is in the past.
  def past?; end

  # Returns true if the date/time is yesterday.
  def prev_day?; end

  # Returns a new date/time representing the previous occurrence of the specified day of week.
  #
  # today = Date.today               # => Thu, 14 Dec 2017
  # today.prev_occurring(:monday)    # => Mon, 11 Dec 2017
  # today.prev_occurring(:thursday)  # => Thu, 07 Dec 2017
  def prev_occurring(day_of_week); end

  # Short-hand for months_ago(3).
  def prev_quarter; end

  # Returns a new date/time representing the given day in the previous week.
  # Week is assumed to start on +start_day+, default is
  # +Date.beginning_of_week+ or +config.beginning_of_week+ when set.
  # DateTime objects have their time set to 0:00 unless +same_time+ is true.
  def prev_week(start_day = T.unsafe(nil), same_time: T.unsafe(nil)); end

  # Returns a new date/time representing the previous weekday.
  def prev_weekday; end

  # Returns Sunday of this week assuming that week starts on Monday.
  # +DateTime+ objects have their time set to 23:59:59.
  def sunday; end

  # Returns true if the date/time is today.
  def today?; end

  # Returns a new date/time representing tomorrow.
  def tomorrow; end

  # Returns true if the date/time is tomorrow.
  def tomorrow?; end

  # Returns a new date/time the specified number of weeks ago.
  def weeks_ago(weeks); end

  # Returns a new date/time the specified number of weeks in the future.
  def weeks_since(weeks); end

  # Returns a new date/time the specified number of years ago.
  def years_ago(years); end

  # Returns a new date/time the specified number of years in the future.
  def years_since(years); end

  # Returns a new date/time representing yesterday.
  def yesterday; end

  # Returns true if the date/time is yesterday.
  def yesterday?; end

  private

  def copy_time_to(other); end
  def days_span(day); end
  def first_hour(date_or_time); end
  def last_hour(date_or_time); end
end

DateAndTime::Calculations::DAYS_INTO_WEEK = T.let(T.unsafe(nil), Hash)
DateAndTime::Calculations::WEEKEND_DAYS = T.let(T.unsafe(nil), Array)

module DateAndTime::Compatibility
  def preserve_timezone; end
  def utc_to_local_returns_utc_offset_times; end

  class << self
    def preserve_timezone; end
    def preserve_timezone=(val); end
    def utc_to_local_returns_utc_offset_times; end
    def utc_to_local_returns_utc_offset_times=(val); end
  end
end

module DateAndTime::Zones
  # Returns the simultaneous time in <tt>Time.zone</tt> if a zone is given or
  # if Time.zone_default is set. Otherwise, it returns the current time.
  #
  # Time.zone = 'Hawaii'        # => 'Hawaii'
  # Time.utc(2000).in_time_zone # => Fri, 31 Dec 1999 14:00:00 HST -10:00
  # Date.new(2000).in_time_zone # => Sat, 01 Jan 2000 00:00:00 HST -10:00
  #
  # This method is similar to Time#localtime, except that it uses <tt>Time.zone</tt> as the local zone
  # instead of the operating system's time zone.
  #
  # You can also pass in a TimeZone instance or string that identifies a TimeZone as an argument,
  # and the conversion will be based on that zone instead of <tt>Time.zone</tt>.
  #
  # Time.utc(2000).in_time_zone('Alaska') # => Fri, 31 Dec 1999 15:00:00 AKST -09:00
  # Date.new(2000).in_time_zone('Alaska') # => Sat, 01 Jan 2000 00:00:00 AKST -09:00
  def in_time_zone(zone = T.unsafe(nil)); end

  private

  def time_with_zone(time, zone); end
end

class DateTime < ::Date
  include ::DateAndTime::Compatibility

  # Layers additional behavior on DateTime#<=> so that Time and
  # ActiveSupport::TimeWithZone instances can be compared with a DateTime.
  def <=>(other); end

  # Duck-types as a Date-like class. See Object#acts_like?.
  def acts_like_date?; end

  # Duck-types as a Time-like class. See Object#acts_like?.
  def acts_like_time?; end

  # Uses Date to provide precise Time calculations for years, months, and days.
  # The +options+ parameter takes a hash with any of these keys: <tt>:years</tt>,
  # <tt>:months</tt>, <tt>:weeks</tt>, <tt>:days</tt>, <tt>:hours</tt>,
  # <tt>:minutes</tt>, <tt>:seconds</tt>.
  def advance(options); end

  # Returns a new DateTime representing the time a number of seconds ago.
  # Do not use this method in combination with x.months, use months_ago instead!
  def ago(seconds); end

  def as_json(options = T.unsafe(nil)); end

  # Returns a new DateTime representing the start of the day (0:00).
  def at_beginning_of_day; end

  # Returns a new DateTime representing the start of the hour (hh:00:00).
  def at_beginning_of_hour; end

  # Returns a new DateTime representing the start of the minute (hh:mm:00).
  def at_beginning_of_minute; end

  # Returns a new DateTime representing the end of the day (23:59:59).
  def at_end_of_day; end

  # Returns a new DateTime representing the end of the hour (hh:59:59).
  def at_end_of_hour; end

  # Returns a new DateTime representing the end of the minute (hh:mm:59).
  def at_end_of_minute; end

  # Returns a new DateTime representing the middle of the day (12:00)
  def at_midday; end

  # Returns a new DateTime representing the middle of the day (12:00)
  def at_middle_of_day; end

  # Returns a new DateTime representing the start of the day (0:00).
  def at_midnight; end

  # Returns a new DateTime representing the middle of the day (12:00)
  def at_noon; end

  # Returns a new DateTime representing the start of the day (0:00).
  def beginning_of_day; end

  # Returns a new DateTime representing the start of the hour (hh:00:00).
  def beginning_of_hour; end

  # Returns a new DateTime representing the start of the minute (hh:mm:00).
  def beginning_of_minute; end

  # No DateTime is ever blank:
  #
  # DateTime.now.blank? # => false
  def blank?; end

  # Returns a new DateTime where one or more of the elements have been changed
  # according to the +options+ parameter. The time options (<tt>:hour</tt>,
  # <tt>:min</tt>, <tt>:sec</tt>) reset cascadingly, so if only the hour is
  # passed, then minute and sec is set to 0. If the hour and minute is passed,
  # then sec is set to 0. The +options+ parameter takes a hash with any of these
  # keys: <tt>:year</tt>, <tt>:month</tt>, <tt>:day</tt>, <tt>:hour</tt>,
  # <tt>:min</tt>, <tt>:sec</tt>, <tt>:offset</tt>, <tt>:start</tt>.
  #
  # DateTime.new(2012, 8, 29, 22, 35, 0).change(day: 1)              # => DateTime.new(2012, 8, 1, 22, 35, 0)
  # DateTime.new(2012, 8, 29, 22, 35, 0).change(year: 1981, day: 1)  # => DateTime.new(1981, 8, 1, 22, 35, 0)
  # DateTime.new(2012, 8, 29, 22, 35, 0).change(year: 1981, hour: 0) # => DateTime.new(1981, 8, 29, 0, 0, 0)
  def change(options); end

  # Returns a new DateTime representing the end of the day (23:59:59).
  def end_of_day; end

  # Returns a new DateTime representing the end of the hour (hh:59:59).
  def end_of_hour; end

  # Returns a new DateTime representing the end of the minute (hh:mm:59).
  def end_of_minute; end

  # Returns a formatted string of the offset from UTC, or an alternative
  # string if the time zone is already UTC.
  #
  # datetime = DateTime.civil(2000, 1, 1, 0, 0, 0, Rational(-6, 24))
  # datetime.formatted_offset         # => "-06:00"
  # datetime.formatted_offset(false)  # => "-0600"
  def formatted_offset(
    colon = T.unsafe(nil),
    alternate_utc_string = T.unsafe(nil)
  ); end

  # Returns a <tt>Time</tt> instance of the simultaneous time in the UTC timezone.
  #
  # DateTime.civil(2005, 2, 21, 10, 11, 12, Rational(-6, 24))     # => Mon, 21 Feb 2005 10:11:12 -0600
  # DateTime.civil(2005, 2, 21, 10, 11, 12, Rational(-6, 24)).utc # => Mon, 21 Feb 2005 16:11:12 UTC
  def getgm; end

  # Returns a <tt>Time</tt> instance of the simultaneous time in the system timezone.
  def getlocal(utc_offset = T.unsafe(nil)); end

  # Returns a <tt>Time</tt> instance of the simultaneous time in the UTC timezone.
  #
  # DateTime.civil(2005, 2, 21, 10, 11, 12, Rational(-6, 24))     # => Mon, 21 Feb 2005 10:11:12 -0600
  # DateTime.civil(2005, 2, 21, 10, 11, 12, Rational(-6, 24)).utc # => Mon, 21 Feb 2005 16:11:12 UTC
  def getutc; end

  # Returns a <tt>Time</tt> instance of the simultaneous time in the UTC timezone.
  #
  # DateTime.civil(2005, 2, 21, 10, 11, 12, Rational(-6, 24))     # => Mon, 21 Feb 2005 10:11:12 -0600
  # DateTime.civil(2005, 2, 21, 10, 11, 12, Rational(-6, 24)).utc # => Mon, 21 Feb 2005 16:11:12 UTC
  def gmtime; end

  # Returns a new DateTime representing the time a number of seconds since the
  # instance time. Do not use this method in combination with x.months, use
  # months_since instead!
  def in(seconds); end

  # Overrides the default inspect method with a human readable one, e.g., "Mon, 21 Feb 2005 14:30:00 +0000".
  def inspect; end

  # Returns a <tt>Time</tt> instance of the simultaneous time in the system timezone.
  def localtime(utc_offset = T.unsafe(nil)); end

  # Returns a new DateTime representing the middle of the day (12:00)
  def midday; end

  # Returns a new DateTime representing the middle of the day (12:00)
  def middle_of_day; end

  # Returns a new DateTime representing the start of the day (0:00).
  def midnight; end

  # Returns a new DateTime representing the middle of the day (12:00)
  def noon; end

  # Returns the fraction of a second as nanoseconds
  def nsec; end

  # Overrides the default inspect method with a human readable one, e.g., "Mon, 21 Feb 2005 14:30:00 +0000".
  def readable_inspect; end

  # Returns the number of seconds since 00:00:00.
  #
  # DateTime.new(2012, 8, 29,  0,  0,  0).seconds_since_midnight # => 0
  # DateTime.new(2012, 8, 29, 12, 34, 56).seconds_since_midnight # => 45296
  # DateTime.new(2012, 8, 29, 23, 59, 59).seconds_since_midnight # => 86399
  def seconds_since_midnight; end

  # Returns the number of seconds until 23:59:59.
  #
  # DateTime.new(2012, 8, 29,  0,  0,  0).seconds_until_end_of_day # => 86399
  # DateTime.new(2012, 8, 29, 12, 34, 56).seconds_until_end_of_day # => 41103
  # DateTime.new(2012, 8, 29, 23, 59, 59).seconds_until_end_of_day # => 0
  def seconds_until_end_of_day; end

  # Returns a new DateTime representing the time a number of seconds since the
  # instance time. Do not use this method in combination with x.months, use
  # months_since instead!
  def since(seconds); end

  # Returns the fraction of a second as a +Rational+
  #
  # DateTime.new(2012, 8, 29, 0, 0, 0.5).subsec # => (1/2)
  def subsec; end

  # Converts +self+ to a floating-point number of seconds, including fractional microseconds, since the Unix epoch.
  def to_f; end

  # Convert to a formatted string. See Time::DATE_FORMATS for predefined formats.
  #
  # This method is aliased to <tt>to_fs</tt>.
  #
  # === Examples
  # datetime = DateTime.civil(2007, 12, 4, 0, 0, 0, 0)   # => Tue, 04 Dec 2007 00:00:00 +0000
  #
  # datetime.to_formatted_s(:db)            # => "2007-12-04 00:00:00"
  # datetime.to_fs(:db)                     # => "2007-12-04 00:00:00"
  # datetime.to_formatted_s(:number)        # => "20071204000000"
  # datetime.to_formatted_s(:short)         # => "04 Dec 00:00"
  # datetime.to_formatted_s(:long)          # => "December 04, 2007 00:00"
  # datetime.to_formatted_s(:long_ordinal)  # => "December 4th, 2007 00:00"
  # datetime.to_formatted_s(:rfc822)        # => "Tue, 04 Dec 2007 00:00:00 +0000"
  # datetime.to_formatted_s(:iso8601)       # => "2007-12-04T00:00:00+00:00"
  #
  # == Adding your own datetime formats to to_formatted_s
  # DateTime formats are shared with Time. You can add your own to the
  # Time::DATE_FORMATS hash. Use the format name as the hash key and
  # either a strftime string or Proc instance that takes a time or
  # datetime argument as the value.
  #
  # # config/initializers/time_formats.rb
  # Time::DATE_FORMATS[:month_and_year] = '%B %Y'
  # Time::DATE_FORMATS[:short_ordinal] = lambda { |time| time.strftime("%B #{time.day.ordinalize}") }
  def to_formatted_s(format = T.unsafe(nil)); end

  # Convert to a formatted string. See Time::DATE_FORMATS for predefined formats.
  #
  # This method is aliased to <tt>to_fs</tt>.
  #
  # === Examples
  # datetime = DateTime.civil(2007, 12, 4, 0, 0, 0, 0)   # => Tue, 04 Dec 2007 00:00:00 +0000
  #
  # datetime.to_formatted_s(:db)            # => "2007-12-04 00:00:00"
  # datetime.to_fs(:db)                     # => "2007-12-04 00:00:00"
  # datetime.to_formatted_s(:number)        # => "20071204000000"
  # datetime.to_formatted_s(:short)         # => "04 Dec 00:00"
  # datetime.to_formatted_s(:long)          # => "December 04, 2007 00:00"
  # datetime.to_formatted_s(:long_ordinal)  # => "December 4th, 2007 00:00"
  # datetime.to_formatted_s(:rfc822)        # => "Tue, 04 Dec 2007 00:00:00 +0000"
  # datetime.to_formatted_s(:iso8601)       # => "2007-12-04T00:00:00+00:00"
  #
  # == Adding your own datetime formats to to_formatted_s
  # DateTime formats are shared with Time. You can add your own to the
  # Time::DATE_FORMATS hash. Use the format name as the hash key and
  # either a strftime string or Proc instance that takes a time or
  # datetime argument as the value.
  #
  # # config/initializers/time_formats.rb
  # Time::DATE_FORMATS[:month_and_year] = '%B %Y'
  # Time::DATE_FORMATS[:short_ordinal] = lambda { |time| time.strftime("%B #{time.day.ordinalize}") }
  def to_fs(format = T.unsafe(nil)); end

  # Converts +self+ to an integer number of seconds since the Unix epoch.
  def to_i; end

  # def to_s(format = T.unsafe(nil)); end

  # Either return an instance of +Time+ with the same UTC offset
  # as +self+ or an instance of +Time+ representing the same time
  # in the local system timezone depending on the setting of
  # on the setting of +ActiveSupport.to_time_preserves_timezone+.
  def to_time; end

  # Returns the fraction of a second as microseconds
  def usec; end

  # Returns a <tt>Time</tt> instance of the simultaneous time in the UTC timezone.
  #
  # DateTime.civil(2005, 2, 21, 10, 11, 12, Rational(-6, 24))     # => Mon, 21 Feb 2005 10:11:12 -0600
  # DateTime.civil(2005, 2, 21, 10, 11, 12, Rational(-6, 24)).utc # => Mon, 21 Feb 2005 16:11:12 UTC
  def utc; end

  # Returns +true+ if <tt>offset == 0</tt>.
  def utc?; end

  # Returns the offset value in seconds.
  def utc_offset; end

  private

  def offset_in_seconds; end
  def seconds_since_unix_epoch; end

  class << self
    # Returns DateTime with local offset for given year if format is local else
    # offset is zero.
    #
    # DateTime.civil_from_format :local, 2012
    # # => Sun, 01 Jan 2012 00:00:00 +0300
    # DateTime.civil_from_format :local, 2012, 12, 17
    # # => Mon, 17 Dec 2012 00:00:00 +0000
    def civil_from_format(
      utc_or_local,
      year,
      month = T.unsafe(nil),
      day = T.unsafe(nil),
      hour = T.unsafe(nil),
      min = T.unsafe(nil),
      sec = T.unsafe(nil)
    ); end

    # Returns <tt>Time.zone.now.to_datetime</tt> when <tt>Time.zone</tt> or
    # <tt>config.time_zone</tt> are set, otherwise returns
    # <tt>Time.now.to_datetime</tt>.
    def current; end
  end
end

DateTime::NOT_SET = T.let(T.unsafe(nil), Object)

module Digest::UUID
  class << self
    def use_rfc4122_namespaced_uuids; end
    def use_rfc4122_namespaced_uuids=(val); end

    # Generates a v5 non-random UUID (Universally Unique IDentifier).
    #
    # Using OpenSSL::Digest::MD5 generates version 3 UUIDs; OpenSSL::Digest::SHA1 generates version 5 UUIDs.
    # uuid_from_hash always generates the same UUID for a given name and namespace combination.
    #
    # See RFC 4122 for details of UUID at: https://www.ietf.org/rfc/rfc4122.txt
    def uuid_from_hash(hash_class, namespace, name); end

    # Convenience method for uuid_from_hash using OpenSSL::Digest::MD5.
    def uuid_v3(uuid_namespace, name); end

    # Convenience method for SecureRandom.uuid.
    def uuid_v4; end

    # Convenience method for uuid_from_hash using OpenSSL::Digest::SHA1.
    def uuid_v5(uuid_namespace, name); end

    private

    def pack_uuid_namespace(namespace); end
  end
end

Digest::UUID::DNS_NAMESPACE = T.let(T.unsafe(nil), String)
Digest::UUID::OID_NAMESPACE = T.let(T.unsafe(nil), String)
Digest::UUID::URL_NAMESPACE = T.let(T.unsafe(nil), String)
Digest::UUID::X500_NAMESPACE = T.let(T.unsafe(nil), String)

module ERB::Util
  private

  # A utility method for escaping HTML tag characters.
  # This method is also aliased as <tt>h</tt>.
  #
  # puts html_escape('is a > 0 & a < 10?')
  # # => is a &gt; 0 &amp; a &lt; 10?
  def h(s); end

  # A utility method for escaping HTML tag characters.
  # This method is also aliased as <tt>h</tt>.
  #
  # puts html_escape('is a > 0 & a < 10?')
  # # => is a &gt; 0 &amp; a &lt; 10?
  def html_escape(s); end

  # A utility method for escaping HTML without affecting existing escaped entities.
  #
  # html_escape_once('1 < 2 &amp; 3')
  # # => "1 &lt; 2 &amp; 3"
  #
  # html_escape_once('&lt;&lt; Accept & Checkout')
  # # => "&lt;&lt; Accept &amp; Checkout"
  def html_escape_once(s); end

  # A utility method for escaping HTML entities in JSON strings. Specifically, the
  # &, > and < characters are replaced with their equivalent unicode escaped form -
  # \u0026, \u003e, and \u003c. The Unicode sequences \u2028 and \u2029 are also
  # escaped as they are treated as newline characters in some JavaScript engines.
  # These sequences have identical meaning as the original characters inside the
  # context of a JSON string, so assuming the input is a valid and well-formed
  # JSON value, the output will have equivalent meaning when parsed:
  #
  # json = JSON.generate({ name: "</script><script>alert('PWNED!!!')</script>"})
  # # => "{\"name\":\"</script><script>alert('PWNED!!!')</script>\"}"
  #
  # json_escape(json)
  # # => "{\"name\":\"\\u003C/script\\u003E\\u003Cscript\\u003Ealert('PWNED!!!')\\u003C/script\\u003E\"}"
  #
  # JSON.parse(json) == JSON.parse(json_escape(json))
  # # => true
  #
  # The intended use case for this method is to escape JSON strings before including
  # them inside a script tag to avoid XSS vulnerability:
  #
  # <script>
  # var currentUser = <%= raw json_escape(current_user.to_json) %>;
  # </script>
  #
  # It is necessary to +raw+ the result of +json_escape+, so that quotation marks
  # don't get converted to <tt>&quot;</tt> entities. +json_escape+ doesn't
  # automatically flag the result as HTML safe, since the raw value is unsafe to
  # use inside HTML attributes.
  #
  # If your JSON is being used downstream for insertion into the DOM, be aware of
  # whether or not it is being inserted via <tt>html()</tt>. Most jQuery plugins do this.
  # If that is the case, be sure to +html_escape+ or +sanitize+ any user-generated
  # content returned by your JSON.
  #
  # If you need to output JSON elsewhere in your HTML, you can just do something
  # like this, as any unsafe characters (including quotation marks) will be
  # automatically escaped for you:
  #
  # <div data-user-info="<%= current_user.to_json %>">...</div>
  #
  # WARNING: this helper only works with valid JSON. Using this on non-JSON values
  # will open up serious XSS vulnerabilities. For example, if you replace the
  # +current_user.to_json+ in the example above with user input instead, the browser
  # will happily eval() that string as JavaScript.
  #
  # The escaping performed in this method is identical to those performed in the
  # Active Support JSON encoder when +ActiveSupport.escape_html_entities_in_json+ is
  # set to true. Because this transformation is idempotent, this helper can be
  # applied even if +ActiveSupport.escape_html_entities_in_json+ is already true.
  #
  # Therefore, when you are unsure if +ActiveSupport.escape_html_entities_in_json+
  # is enabled, or if you are unsure where your JSON string originated from, it
  # is recommended that you always apply this helper (other libraries, such as the
  # JSON gem, do not provide this kind of protection by default; also some gems
  # might override +to_json+ to bypass Active Support's encoder).
  def json_escape(s); end

  # HTML escapes strings but doesn't wrap them with an ActiveSupport::SafeBuffer.
  # This method is not for public consumption! Seriously!
  def unwrapped_html_escape(s); end

  class << self
    # A utility method for escaping HTML tag characters.
    # This method is also aliased as <tt>h</tt>.
    #
    # puts html_escape('is a > 0 & a < 10?')
    # # => is a &gt; 0 &amp; a &lt; 10?
    def h(s); end

    # A utility method for escaping HTML tag characters.
    # This method is also aliased as <tt>h</tt>.
    #
    # puts html_escape('is a > 0 & a < 10?')
    # # => is a &gt; 0 &amp; a &lt; 10?
    def html_escape(s); end

    # A utility method for escaping HTML without affecting existing escaped entities.
    #
    # html_escape_once('1 < 2 &amp; 3')
    # # => "1 &lt; 2 &amp; 3"
    #
    # html_escape_once('&lt;&lt; Accept & Checkout')
    # # => "&lt;&lt; Accept &amp; Checkout"
    def html_escape_once(s); end

    # A utility method for escaping HTML entities in JSON strings. Specifically, the
    # &, > and < characters are replaced with their equivalent unicode escaped form -
    # \u0026, \u003e, and \u003c. The Unicode sequences \u2028 and \u2029 are also
    # escaped as they are treated as newline characters in some JavaScript engines.
    # These sequences have identical meaning as the original characters inside the
    # context of a JSON string, so assuming the input is a valid and well-formed
    # JSON value, the output will have equivalent meaning when parsed:
    #
    # json = JSON.generate({ name: "</script><script>alert('PWNED!!!')</script>"})
    # # => "{\"name\":\"</script><script>alert('PWNED!!!')</script>\"}"
    #
    # json_escape(json)
    # # => "{\"name\":\"\\u003C/script\\u003E\\u003Cscript\\u003Ealert('PWNED!!!')\\u003C/script\\u003E\"}"
    #
    # JSON.parse(json) == JSON.parse(json_escape(json))
    # # => true
    #
    # The intended use case for this method is to escape JSON strings before including
    # them inside a script tag to avoid XSS vulnerability:
    #
    # <script>
    # var currentUser = <%= raw json_escape(current_user.to_json) %>;
    # </script>
    #
    # It is necessary to +raw+ the result of +json_escape+, so that quotation marks
    # don't get converted to <tt>&quot;</tt> entities. +json_escape+ doesn't
    # automatically flag the result as HTML safe, since the raw value is unsafe to
    # use inside HTML attributes.
    #
    # If your JSON is being used downstream for insertion into the DOM, be aware of
    # whether or not it is being inserted via <tt>html()</tt>. Most jQuery plugins do this.
    # If that is the case, be sure to +html_escape+ or +sanitize+ any user-generated
    # content returned by your JSON.
    #
    # If you need to output JSON elsewhere in your HTML, you can just do something
    # like this, as any unsafe characters (including quotation marks) will be
    # automatically escaped for you:
    #
    # <div data-user-info="<%= current_user.to_json %>">...</div>
    #
    # WARNING: this helper only works with valid JSON. Using this on non-JSON values
    # will open up serious XSS vulnerabilities. For example, if you replace the
    # +current_user.to_json+ in the example above with user input instead, the browser
    # will happily eval() that string as JavaScript.
    #
    # The escaping performed in this method is identical to those performed in the
    # Active Support JSON encoder when +ActiveSupport.escape_html_entities_in_json+ is
    # set to true. Because this transformation is idempotent, this helper can be
    # applied even if +ActiveSupport.escape_html_entities_in_json+ is already true.
    #
    # Therefore, when you are unsure if +ActiveSupport.escape_html_entities_in_json+
    # is enabled, or if you are unsure where your JSON string originated from, it
    # is recommended that you always apply this helper (other libraries, such as the
    # JSON gem, do not provide this kind of protection by default; also some gems
    # might override +to_json+ to bypass Active Support's encoder).
    def json_escape(s); end

    # HTML escapes strings but doesn't wrap them with an ActiveSupport::SafeBuffer.
    # This method is not for public consumption! Seriously!
    def unwrapped_html_escape(s); end
  end
end

ERB::Util::HTML_ESCAPE = T.let(T.unsafe(nil), Hash)
ERB::Util::HTML_ESCAPE_ONCE_REGEXP = T.let(T.unsafe(nil), Regexp)
ERB::Util::JSON_ESCAPE = T.let(T.unsafe(nil), Hash)
ERB::Util::JSON_ESCAPE_REGEXP = T.let(T.unsafe(nil), Regexp)

module Enumerable
  def as_json(options = T.unsafe(nil)); end

  # Returns a new +Array+ without the blank items.
  # Uses Object#blank? for determining if an item is blank.
  #
  # [1, "", nil, 2, " ", [], {}, false, true].compact_blank
  # # =>  [1, 2, true]
  #
  # Set.new([nil, "", 1, 2])
  # # => [2, 1] (or [1, 2])
  #
  # When called on a +Hash+, returns a new +Hash+ without the blank values.
  #
  # { a: "", b: 1, c: nil, d: [], e: false, f: true }.compact_blank
  # #=> { b: 1, f: true }
  def compact_blank; end

  # The negative of the <tt>Enumerable#include?</tt>. Returns +true+ if the
  # collection does not include the object.
  def exclude?(object); end

  # Returns a copy of the enumerable excluding the specified elements.
  #
  # ["David", "Rafael", "Aaron", "Todd"].excluding "Aaron", "Todd"
  # # => ["David", "Rafael"]
  #
  # ["David", "Rafael", "Aaron", "Todd"].excluding %w[ Aaron Todd ]
  # # => ["David", "Rafael"]
  #
  # {foo: 1, bar: 2, baz: 3}.excluding :bar
  # # => {foo: 1, baz: 3}
  def excluding(*elements); end

  # Returns a new +Array+ where the order has been set to that provided in the +series+, based on the +key+ of the
  # objects in the original enumerable.
  #
  # [ Person.find(5), Person.find(3), Person.find(1) ].in_order_of(:id, [ 1, 5, 3 ])
  # => [ Person.find(1), Person.find(5), Person.find(3) ]
  #
  # If the +series+ include keys that have no corresponding element in the Enumerable, these are ignored.
  # If the Enumerable has additional elements that aren't named in the +series+, these are not included in the result.
  def in_order_of(key, series); end

  # Returns a new array that includes the passed elements.
  #
  # [ 1, 2, 3 ].including(4, 5)
  # # => [ 1, 2, 3, 4, 5 ]
  #
  # ["David", "Rafael"].including %w[ Aaron Todd ]
  # # => ["David", "Rafael", "Aaron", "Todd"]
  def including(*elements); end

  # Convert an enumerable to a hash, using the block result as the key and the
  # element as the value.
  #
  # people.index_by(&:login)
  # # => { "nextangle" => <Person ...>, "chade-" => <Person ...>, ...}
  #
  # people.index_by { |person| "#{person.first_name} #{person.last_name}" }
  # # => { "Chade- Fowlersburg-e" => <Person ...>, "David Heinemeier Hansson" => <Person ...>, ...}
  def index_by; end

  # Convert an enumerable to a hash, using the element as the key and the block
  # result as the value.
  #
  # post = Post.new(title: "hey there", body: "what's up?")
  #
  # %i( title body ).index_with { |attr_name| post.public_send(attr_name) }
  # # => { title: "hey there", body: "what's up?" }
  #
  # If an argument is passed instead of a block, it will be used as the value
  # for all elements:
  #
  # %i( created_at updated_at ).index_with(Time.now)
  # # => { created_at: 2020-03-09 22:31:47, updated_at: 2020-03-09 22:31:47 }
  def index_with(default = T.unsafe(nil)); end

  # Returns +true+ if the enumerable has more than 1 element. Functionally
  # equivalent to <tt>enum.to_a.size > 1</tt>. Can be called with a block too,
  # much like any?, so <tt>people.many? { |p| p.age > 26 }</tt> returns +true+
  # if more than one person is over 26.
  def many?; end

  # Calculates the maximum from the extracted elements.
  #
  # payments = [Payment.new(5), Payment.new(15), Payment.new(10)]
  # payments.maximum(:price) # => 15
  def maximum(key); end

  # Calculates the minimum from the extracted elements.
  #
  # payments = [Payment.new(5), Payment.new(15), Payment.new(10)]
  # payments.minimum(:price) # => 5
  def minimum(key); end

  # Extract the given key from the first element in the enumerable.
  #
  # [{ name: "David" }, { name: "Rafael" }, { name: "Aaron" }].pick(:name)
  # # => "David"
  #
  # [{ id: 1, name: "David" }, { id: 2, name: "Rafael" }].pick(:id, :name)
  # # => [1, "David"]
  def pick(*keys); end

  # Extract the given key from each element in the enumerable.
  #
  # [{ name: "David" }, { name: "Rafael" }, { name: "Aaron" }].pluck(:name)
  # # => ["David", "Rafael", "Aaron"]
  #
  # [{ id: 1, name: "David" }, { id: 2, name: "Rafael" }].pluck(:id, :name)
  # # => [[1, "David"], [2, "Rafael"]]
  def pluck(*keys); end

  # Returns the sole item in the enumerable. If there are no items, or more
  # than one item, raises +Enumerable::SoleItemExpectedError+.
  #
  # ["x"].sole          # => "x"
  # Set.new.sole        # => Enumerable::SoleItemExpectedError: no item found
  # { a: 1, b: 2 }.sole # => Enumerable::SoleItemExpectedError: multiple items found
  def sole; end

  # Calculates a sum from the elements.
  #
  # payments.sum { |p| p.price * p.tax_rate }
  # payments.sum(&:price)
  #
  # The latter is a shortcut for:
  #
  # payments.inject(0) { |sum, p| sum + p.price }
  #
  # It can also calculate the sum without the use of a block.
  #
  # [5, 15, 10].sum # => 30
  # ['foo', 'bar'].sum('') # => "foobar"
  # [[1, 2], [3, 1, 5]].sum([]) # => [1, 2, 3, 1, 5]
  #
  # The default sum of an empty list is zero. You can override this default:
  #
  # [].sum(Payment.new(0)) { |i| i.amount } # => Payment.new(0)
  def sum(identity = T.unsafe(nil), &block); end

  # Returns a copy of the enumerable excluding the specified elements.
  #
  # ["David", "Rafael", "Aaron", "Todd"].excluding "Aaron", "Todd"
  # # => ["David", "Rafael"]
  #
  # ["David", "Rafael", "Aaron", "Todd"].excluding %w[ Aaron Todd ]
  # # => ["David", "Rafael"]
  #
  # {foo: 1, bar: 2, baz: 3}.excluding :bar
  # # => {foo: 1, baz: 3}
  def without(*elements); end
end

Enumerable::INDEX_WITH_DEFAULT = T.let(T.unsafe(nil), Object)

# Error generated by +sole+ when called on an enumerable that doesn't have
# exactly one item.
class Enumerable::SoleItemExpectedError < ::StandardError
end

class Exception
  def as_json(options = T.unsafe(nil)); end
end

class FalseClass
  include ::JSON::Ext::Generator::GeneratorMethods::FalseClass
  include ::MessagePack::CoreExt
  include ::SafeType::BooleanMixin

  def as_json(options = T.unsafe(nil)); end

  # +false+ is blank:
  #
  # false.blank? # => true
  def blank?; end

  # Returns +self+.
  def to_param; end
end

class Float < ::Numeric
  include ::ActiveSupport::NumericWithFormat
  include ::ActiveSupport::DeprecatedNumericWithFormat
  include ::JSON::Ext::Generator::GeneratorMethods::Float
  include ::MessagePack::CoreExt

  # Encoding Infinity or NaN to JSON should return "null". The default returns
  # "Infinity" or "NaN" which are not valid JSON.
  def as_json(options = T.unsafe(nil)); end
end

class Hash
  include ::Enumerable
  include ::JSON::Ext::Generator::GeneratorMethods::Hash
  include ::MessagePack::CoreExt

  def as_json(options = T.unsafe(nil)); end

  # Validates all keys in a hash match <tt>*valid_keys</tt>, raising
  # +ArgumentError+ on a mismatch.
  #
  # Note that keys are treated differently than HashWithIndifferentAccess,
  # meaning that string and symbol keys will not match.
  #
  # { name: 'Rob', years: '28' }.assert_valid_keys(:name, :age) # => raises "ArgumentError: Unknown key: :years. Valid keys are: :name, :age"
  # { name: 'Rob', age: '28' }.assert_valid_keys('name', 'age') # => raises "ArgumentError: Unknown key: :name. Valid keys are: 'name', 'age'"
  # { name: 'Rob', age: '28' }.assert_valid_keys(:name, :age)   # => passes, raises nothing
  def assert_valid_keys(*valid_keys); end

  # Hash#reject has its own definition, so this needs one too.
  def compact_blank; end

  # Removes all blank values from the +Hash+ in place and returns self.
  # Uses Object#blank? for determining if a value is blank.
  #
  # h = { a: "", b: 1, c: nil, d: [], e: false, f: true }
  # h.compact_blank!
  # # => { b: 1, f: true }
  def compact_blank!; end

  # Returns a deep copy of hash.
  #
  # hash = { a: { b: 'b' } }
  # dup  = hash.deep_dup
  # dup[:a][:c] = 'c'
  #
  # hash[:a][:c] # => nil
  # dup[:a][:c]  # => "c"
  def deep_dup; end

  # Returns a new hash with +self+ and +other_hash+ merged recursively.
  #
  # h1 = { a: true, b: { c: [1, 2, 3] } }
  # h2 = { a: false, b: { x: [3, 4, 5] } }
  #
  # h1.deep_merge(h2) # => { a: false, b: { c: [1, 2, 3], x: [3, 4, 5] } }
  #
  # Like with Hash#merge in the standard library, a block can be provided
  # to merge values:
  #
  # h1 = { a: 100, b: 200, c: { c1: 100 } }
  # h2 = { b: 250, c: { c1: 200 } }
  # h1.deep_merge(h2) { |key, this_val, other_val| this_val + other_val }
  # # => { a: 100, b: 450, c: { c1: 300 } }
  def deep_merge(other_hash, &block); end

  # Same as +deep_merge+, but modifies +self+.
  def deep_merge!(other_hash, &block); end

  # Returns a new hash with all keys converted to strings.
  # This includes the keys from the root hash and from all
  # nested hashes and arrays.
  #
  # hash = { person: { name: 'Rob', age: '28' } }
  #
  # hash.deep_stringify_keys
  # # => {"person"=>{"name"=>"Rob", "age"=>"28"}}
  def deep_stringify_keys; end

  # Destructively converts all keys to strings.
  # This includes the keys from the root hash and from all
  # nested hashes and arrays.
  def deep_stringify_keys!; end

  # Returns a new hash with all keys converted to symbols, as long as
  # they respond to +to_sym+. This includes the keys from the root hash
  # and from all nested hashes and arrays.
  #
  # hash = { 'person' => { 'name' => 'Rob', 'age' => '28' } }
  #
  # hash.deep_symbolize_keys
  # # => {:person=>{:name=>"Rob", :age=>"28"}}
  def deep_symbolize_keys; end

  # Destructively converts all keys to symbols, as long as they respond
  # to +to_sym+. This includes the keys from the root hash and from all
  # nested hashes and arrays.
  def deep_symbolize_keys!; end

  # Returns a new hash with all keys converted by the block operation.
  # This includes the keys from the root hash and from all
  # nested hashes and arrays.
  #
  # hash = { person: { name: 'Rob', age: '28' } }
  #
  # hash.deep_transform_keys{ |key| key.to_s.upcase }
  # # => {"PERSON"=>{"NAME"=>"Rob", "AGE"=>"28"}}
  def deep_transform_keys(&block); end

  # Destructively converts all keys by using the block operation.
  # This includes the keys from the root hash and from all
  # nested hashes and arrays.
  def deep_transform_keys!(&block); end

  # Returns a new hash with all values converted by the block operation.
  # This includes the values from the root hash and from all
  # nested hashes and arrays.
  #
  # hash = { person: { name: 'Rob', age: '28' } }
  #
  # hash.deep_transform_values{ |value| value.to_s.upcase }
  # # => {person: {name: "ROB", age: "28"}}
  def deep_transform_values(&block); end

  # Destructively converts all values by using the block operation.
  # This includes the values from the root hash and from all
  # nested hashes and arrays.
  def deep_transform_values!(&block); end

  # Removes the given keys from hash and returns it.
  # hash = { a: true, b: false, c: nil }
  # hash.except!(:c) # => { a: true, b: false }
  # hash             # => { a: true, b: false }
  def except!(*keys); end

  # Removes and returns the key/value pairs matching the given keys.
  #
  # hash = { a: 1, b: 2, c: 3, d: 4 }
  # hash.extract!(:a, :b) # => {:a=>1, :b=>2}
  # hash                  # => {:c=>3, :d=>4}
  def extract!(*keys); end

  # By default, only instances of Hash itself are extractable.
  # Subclasses of Hash may implement this method and return
  # true to declare themselves as extractable. If a Hash
  # is extractable, Array#extract_options! pops it from
  # the Array when it is the last element of the Array.
  def extractable_options?; end

  # Returns an <tt>ActiveSupport::HashWithIndifferentAccess</tt> out of its receiver:
  #
  # { a: 1 }.with_indifferent_access['a'] # => 1
  # Called when object is nested under an object that receives
  # #with_indifferent_access. This method will be called on the current object
  # by the enclosing object and is aliased to #with_indifferent_access by
  # default. Subclasses of Hash may overwrite this method to return +self+ if
  # converting to an <tt>ActiveSupport::HashWithIndifferentAccess</tt> would not be
  # desirable.
  #
  # b = { b: 1 }
  # { a: b }.with_indifferent_access['a'] # calls b.nested_under_indifferent_access
  # # => {"b"=>1}
  def nested_under_indifferent_access; end

  # Merges the caller into +other_hash+. For example,
  #
  # options = options.reverse_merge(size: 25, velocity: 10)
  #
  # is equivalent to
  #
  # options = { size: 25, velocity: 10 }.merge(options)
  #
  # This is particularly useful for initializing an options hash
  # with default values.
  def reverse_merge(other_hash); end

  # Destructive +reverse_merge+.
  def reverse_merge!(other_hash); end

  # Destructive +reverse_merge+.
  def reverse_update(other_hash); end

  # Replaces the hash with only the given keys.
  # Returns a hash containing the removed key/value pairs.
  #
  # hash = { a: 1, b: 2, c: 3, d: 4 }
  # hash.slice!(:a, :b)  # => {:c=>3, :d=>4}
  # hash                 # => {:a=>1, :b=>2}
  def slice!(*keys); end

  # Returns a new hash with all keys converted to strings.
  #
  # hash = { name: 'Rob', age: '28' }
  #
  # hash.stringify_keys
  # # => {"name"=>"Rob", "age"=>"28"}
  def stringify_keys; end

  # Destructively converts all keys to strings. Same as
  # +stringify_keys+, but modifies +self+.
  def stringify_keys!; end

  # Returns a new hash with all keys converted to symbols, as long as
  # they respond to +to_sym+.
  #
  # hash = { 'name' => 'Rob', 'age' => '28' }
  #
  # hash.symbolize_keys
  # # => {:name=>"Rob", :age=>"28"}
  def symbolize_keys; end

  # Destructively converts all keys to symbols, as long as they respond
  # to +to_sym+. Same as +symbolize_keys+, but modifies +self+.
  def symbolize_keys!; end

  # Returns a new hash with all keys converted to symbols, as long as
  # they respond to +to_sym+.
  #
  # hash = { 'name' => 'Rob', 'age' => '28' }
  #
  # hash.symbolize_keys
  # # => {:name=>"Rob", :age=>"28"}
  def to_options; end

  # Destructively converts all keys to symbols, as long as they respond
  # to +to_sym+. Same as +symbolize_keys+, but modifies +self+.
  def to_options!; end

  # Returns a string representation of the receiver suitable for use as a URL
  # query string:
  #
  # {name: 'David', nationality: 'Danish'}.to_query
  # # => "name=David&nationality=Danish"
  #
  # An optional namespace can be passed to enclose key names:
  #
  # {name: 'David', nationality: 'Danish'}.to_query('user')
  # # => "user%5Bname%5D=David&user%5Bnationality%5D=Danish"
  #
  # The string pairs "key=value" that conform the query string
  # are sorted lexicographically in ascending order.
  #
  # This method is also aliased as +to_param+.
  def to_param(namespace = T.unsafe(nil)); end

  # Returns a string representation of the receiver suitable for use as a URL
  # query string:
  #
  # {name: 'David', nationality: 'Danish'}.to_query
  # # => "name=David&nationality=Danish"
  #
  # An optional namespace can be passed to enclose key names:
  #
  # {name: 'David', nationality: 'Danish'}.to_query('user')
  # # => "user%5Bname%5D=David&user%5Bnationality%5D=Danish"
  #
  # The string pairs "key=value" that conform the query string
  # are sorted lexicographically in ascending order.
  #
  # This method is also aliased as +to_param+.
  def to_query(namespace = T.unsafe(nil)); end

  # Returns a string containing an XML representation of its receiver:
  #
  # { foo: 1, bar: 2 }.to_xml
  # # =>
  # # <?xml version="1.0" encoding="UTF-8"?>
  # # <hash>
  # #   <foo type="integer">1</foo>
  # #   <bar type="integer">2</bar>
  # # </hash>
  #
  # To do so, the method loops over the pairs and builds nodes that depend on
  # the _values_. Given a pair +key+, +value+:
  #
  # * If +value+ is a hash there's a recursive call with +key+ as <tt>:root</tt>.
  #
  # * If +value+ is an array there's a recursive call with +key+ as <tt>:root</tt>,
  # and +key+ singularized as <tt>:children</tt>.
  #
  # * If +value+ is a callable object it must expect one or two arguments. Depending
  # on the arity, the callable is invoked with the +options+ hash as first argument
  # with +key+ as <tt>:root</tt>, and +key+ singularized as second argument. The
  # callable can add nodes by using <tt>options[:builder]</tt>.
  #
  # {foo: lambda { |options, key| options[:builder].b(key) }}.to_xml
  # # => "<b>foo</b>"
  #
  # * If +value+ responds to +to_xml+ the method is invoked with +key+ as <tt>:root</tt>.
  #
  # class Foo
  # def to_xml(options)
  # options[:builder].bar 'fooing!'
  # end
  # end
  #
  # { foo: Foo.new }.to_xml(skip_instruct: true)
  # # =>
  # # <hash>
  # #   <bar>fooing!</bar>
  # # </hash>
  #
  # * Otherwise, a node with +key+ as tag is created with a string representation of
  # +value+ as text node. If +value+ is +nil+ an attribute "nil" set to "true" is added.
  # Unless the option <tt>:skip_types</tt> exists and is true, an attribute "type" is
  # added as well according to the following mapping:
  #
  # XML_TYPE_NAMES = {
  # "Symbol"     => "symbol",
  # "Integer"    => "integer",
  # "BigDecimal" => "decimal",
  # "Float"      => "float",
  # "TrueClass"  => "boolean",
  # "FalseClass" => "boolean",
  # "Date"       => "date",
  # "DateTime"   => "dateTime",
  # "Time"       => "dateTime"
  # }
  #
  # By default the root node is "hash", but that's configurable via the <tt>:root</tt> option.
  #
  # The default XML builder is a fresh instance of <tt>Builder::XmlMarkup</tt>. You can
  # configure your own builder with the <tt>:builder</tt> option. The method also accepts
  # options like <tt>:dasherize</tt> and friends, they are forwarded to the builder.
  def to_xml(options = T.unsafe(nil)); end

  # Merges the caller into +other_hash+. For example,
  #
  # options = options.reverse_merge(size: 25, velocity: 10)
  #
  # is equivalent to
  #
  # options = { size: 25, velocity: 10 }.merge(options)
  #
  # This is particularly useful for initializing an options hash
  # with default values.
  def with_defaults(other_hash); end

  # Destructive +reverse_merge+.
  def with_defaults!(other_hash); end

  # Returns an <tt>ActiveSupport::HashWithIndifferentAccess</tt> out of its receiver:
  #
  # { a: 1 }.with_indifferent_access['a'] # => 1
  def with_indifferent_access; end

  private

  # Support methods for deep transforming nested hashes and arrays.
  def _deep_transform_keys_in_object(object, &block); end

  def _deep_transform_keys_in_object!(object, &block); end

  # Support methods for deep transforming nested hashes and arrays.
  def _deep_transform_values_in_object(object, &block); end

  def _deep_transform_values_in_object!(object, &block); end

  class << self
    # Builds a Hash from XML just like <tt>Hash.from_xml</tt>, but also allows Symbol and YAML.
    def from_trusted_xml(xml); end

    # Returns a Hash containing a collection of pairs when the key is the node name and the value is
    # its content
    #
    # xml = <<-XML
    # <?xml version="1.0" encoding="UTF-8"?>
    # <hash>
    # <foo type="integer">1</foo>
    # <bar type="integer">2</bar>
    # </hash>
    # XML
    #
    # hash = Hash.from_xml(xml)
    # # => {"hash"=>{"foo"=>1, "bar"=>2}}
    #
    # +DisallowedType+ is raised if the XML contains attributes with <tt>type="yaml"</tt> or
    # <tt>type="symbol"</tt>. Use <tt>Hash.from_trusted_xml</tt> to
    # parse this XML.
    #
    # Custom +disallowed_types+ can also be passed in the form of an
    # array.
    #
    # xml = <<-XML
    # <?xml version="1.0" encoding="UTF-8"?>
    # <hash>
    # <foo type="integer">1</foo>
    # <bar type="string">"David"</bar>
    # </hash>
    # XML
    #
    # hash = Hash.from_xml(xml, ['integer'])
    # # => ActiveSupport::XMLConverter::DisallowedType: Disallowed type attribute: "integer"
    #
    # Note that passing custom disallowed types will override the default types,
    # which are Symbol and YAML.
    def from_xml(xml, disallowed_types = T.unsafe(nil)); end
  end
end

HashWithIndifferentAccess = ActiveSupport::HashWithIndifferentAccess

# :enddoc:
module I18n
  extend ::I18n::Base

  class << self
    def cache_key_digest; end
    def cache_key_digest=(key_digest); end
    def cache_namespace; end
    def cache_namespace=(namespace); end
    def cache_store; end
    def cache_store=(store); end
    def fallbacks; end
    def fallbacks=(fallbacks); end
    def interpolate(string, values); end
    def interpolate_hash(string, values); end
    def new_double_nested_cache; end
    def perform_caching?; end
    def reserve_key(key); end
    def reserved_keys_pattern; end
  end
end

I18n::DEFAULT_INTERPOLATION_PATTERNS = T.let(T.unsafe(nil), Array)
I18n::EMPTY_HASH = T.let(T.unsafe(nil), Hash)
I18n::INTERPOLATION_PATTERN = T.let(T.unsafe(nil), Regexp)
I18n::JSON = ActiveSupport::JSON
I18n::RESERVED_KEYS = T.let(T.unsafe(nil), Array)

class I18n::Railtie < ::Rails::Railtie
  class << self
    def forward_raise_on_missing_translations_config(app); end
    def include_fallbacks_module; end
    def init_fallbacks(fallbacks); end

    # Setup i18n configuration.
    def initialize_i18n(app); end

    def validate_fallbacks(fallbacks); end
    def watched_dirs_with_extensions(paths); end
  end
end

I18n::VERSION = T.let(T.unsafe(nil), String)

class IO
  include ::Enumerable
  include ::File::Constants

  def as_json(options = T.unsafe(nil)); end
end

class IO::ConsoleMode
  def echo=(_arg0); end
  def raw(*_arg0); end
  def raw!(*_arg0); end

  private

  def initialize_copy(_arg0); end
end

class IO::EAGAINWaitReadable < ::Errno::EAGAIN
  include ::IO::WaitReadable
end

class IO::EAGAINWaitWritable < ::Errno::EAGAIN
  include ::IO::WaitWritable
end

class IO::EINPROGRESSWaitReadable < ::Errno::EINPROGRESS
  include ::IO::WaitReadable
end

class IO::EINPROGRESSWaitWritable < ::Errno::EINPROGRESS
  include ::IO::WaitWritable
end

IO::EWOULDBLOCKWaitReadable = IO::EAGAINWaitReadable
IO::EWOULDBLOCKWaitWritable = IO::EAGAINWaitWritable
IO::PRIORITY = T.let(T.unsafe(nil), Integer)
IO::READABLE = T.let(T.unsafe(nil), Integer)
IO::WRITABLE = T.let(T.unsafe(nil), Integer)

class IPAddr
  include ::Comparable

  def as_json(options = T.unsafe(nil)); end
end

class Integer < ::Numeric
  include ::ActiveSupport::NumericWithFormat
  include ::ActiveSupport::DeprecatedNumericWithFormat
  include ::JSON::Ext::Generator::GeneratorMethods::Integer
  include ::MessagePack::CoreExt

  # Returns a Duration instance matching the number of months provided.
  #
  # 2.months # => 2 months
  def month; end

  # Returns a Duration instance matching the number of months provided.
  #
  # 2.months # => 2 months
  def months; end

  # Check whether the integer is evenly divisible by the argument.
  #
  # 0.multiple_of?(0)  # => true
  # 6.multiple_of?(5)  # => false
  # 10.multiple_of?(2) # => true
  def multiple_of?(number); end

  # Ordinal returns the suffix used to denote the position
  # in an ordered sequence such as 1st, 2nd, 3rd, 4th.
  #
  # 1.ordinal     # => "st"
  # 2.ordinal     # => "nd"
  # 1002.ordinal  # => "nd"
  # 1003.ordinal  # => "rd"
  # -11.ordinal   # => "th"
  # -1001.ordinal # => "st"
  def ordinal; end

  # Ordinalize turns a number into an ordinal string used to denote the
  # position in an ordered sequence such as 1st, 2nd, 3rd, 4th.
  #
  # 1.ordinalize     # => "1st"
  # 2.ordinalize     # => "2nd"
  # 1002.ordinalize  # => "1002nd"
  # 1003.ordinalize  # => "1003rd"
  # -11.ordinalize   # => "-11th"
  # -1001.ordinalize # => "-1001st"
  def ordinalize; end

  # Returns a Duration instance matching the number of years provided.
  #
  # 2.years # => 2 years
  def year; end

  # Returns a Duration instance matching the number of years provided.
  #
  # 2.years # => 2 years
  def years; end
end

Integer::GMP_VERSION = T.let(T.unsafe(nil), String)

module Kernel
  # class_eval on an object acts like singleton_class.class_eval.
  def class_eval(*args, &block); end

  private

  # A shortcut to define a toplevel concern, not within a module.
  #
  # See Module::Concerning for more.
  def concern(topic, &module_definition); end

  # Sets $VERBOSE to +true+ for the duration of the block and back to its
  # original value afterwards.
  def enable_warnings(&block); end

  # Sets $VERBOSE to +nil+ for the duration of the block and back to its original
  # value afterwards.
  #
  # silence_warnings do
  # value = noisy_call # no warning voiced
  # end
  #
  # noisy_call # warning voiced
  def silence_warnings(&block); end

  # Blocks and ignores any exception passed as argument if raised within the block.
  #
  # suppress(ZeroDivisionError) do
  # 1/0
  # puts 'This code is NOT reached'
  # end
  #
  # puts 'This code gets executed and nothing related to ZeroDivisionError was seen'
  def suppress(*exception_classes); end

  # Sets $VERBOSE for the duration of the block and back to its original
  # value afterwards.
  def with_warnings(flag); end

  class << self
    # A shortcut to define a toplevel concern, not within a module.
    #
    # See Module::Concerning for more.
    def concern(topic, &module_definition); end

    # Sets $VERBOSE to +true+ for the duration of the block and back to its
    # original value afterwards.
    def enable_warnings(&block); end

    # Sets $VERBOSE to +nil+ for the duration of the block and back to its original
    # value afterwards.
    #
    # silence_warnings do
    # value = noisy_call # no warning voiced
    # end
    #
    # noisy_call # warning voiced
    def silence_warnings(&block); end

    # Blocks and ignores any exception passed as argument if raised within the block.
    #
    # suppress(ZeroDivisionError) do
    # 1/0
    # puts 'This code is NOT reached'
    # end
    #
    # puts 'This code gets executed and nothing related to ZeroDivisionError was seen'
    def suppress(*exception_classes); end

    # Sets $VERBOSE for the duration of the block and back to its original
    # value afterwards.
    def with_warnings(flag); end
  end
end

class LoadError < ::ScriptError
  include ::DidYouMean::Correctable

  # Returns true if the given path name (except perhaps for the ".rb"
  # extension) is the missing file which caused the exception to be raised.
  def is_missing?(location); end
end

class Method
  include ::MethodSource::SourceLocation::MethodExtensions
  include ::MethodSource::MethodExtensions

  # Methods are not duplicable:
  #
  # method(:puts).duplicable? # => false
  # method(:puts).dup         # => TypeError: allocator undefined for Method
  def duplicable?; end
end

# == Attribute Accessors per Thread
#
# Extends the module object with class/module and instance accessors for
# class/module attributes, just like the native attr* accessors for instance
# attributes, but does so on a per-thread basis.
#
# So the values are scoped within the Thread.current space under the class name
# of the module.
#
# Note that it can also be scoped per-fiber if Rails.application.config.active_support.isolation_level
# is set to `:fiber`
class Module
  include ::Module::Concerning

  # Allows you to make aliases for attributes, which includes
  # getter, setter, and a predicate.
  #
  # class Content < ActiveRecord::Base
  # # has a title attribute
  # end
  #
  # class Email < Content
  # alias_attribute :subject, :title
  # end
  #
  # e = Email.find(1)
  # e.title    # => "Superstars"
  # e.subject  # => "Superstars"
  # e.subject? # => true
  # e.subject = "Megastars"
  # e.title    # => "Megastars"
  def alias_attribute(new_name, old_name); end

  # A module may or may not have a name.
  #
  # module M; end
  # M.name # => "M"
  #
  # m = Module.new
  # m.name # => nil
  #
  # +anonymous?+ method returns true if module does not have a name, false otherwise:
  #
  # Module.new.anonymous? # => true
  #
  # module M; end
  # M.anonymous?          # => false
  #
  # A module gets a name when it is first assigned to a constant. Either
  # via the +module+ or +class+ keyword or by an explicit assignment:
  #
  # m = Module.new # creates an anonymous module
  # m.anonymous?   # => true
  # M = m          # m gets a name here as a side-effect
  # m.name         # => "M"
  # m.anonymous?   # => false
  def anonymous?; end

  def as_json(options = T.unsafe(nil)); end

  # Declares an attribute reader and writer backed by an internally-named instance
  # variable.
  def attr_internal(*attrs); end

  # Declares an attribute reader and writer backed by an internally-named instance
  # variable.
  def attr_internal_accessor(*attrs); end

  # Declares an attribute reader backed by an internally-named instance variable.
  def attr_internal_reader(*attrs); end

  # Declares an attribute writer backed by an internally-named instance variable.
  def attr_internal_writer(*attrs); end

  # Defines both class and instance accessors for class attributes.
  # All class and instance methods created will be public, even if
  # this method is called with a private or protected access modifier.
  #
  # module HairColors
  # mattr_accessor :hair_colors
  # end
  #
  # class Person
  # include HairColors
  # end
  #
  # HairColors.hair_colors = [:brown, :black, :blonde, :red]
  # HairColors.hair_colors # => [:brown, :black, :blonde, :red]
  # Person.new.hair_colors # => [:brown, :black, :blonde, :red]
  #
  # If a subclass changes the value then that would also change the value for
  # parent class. Similarly if parent class changes the value then that would
  # change the value of subclasses too.
  #
  # class Citizen < Person
  # end
  #
  # Citizen.new.hair_colors << :blue
  # Person.new.hair_colors # => [:brown, :black, :blonde, :red, :blue]
  #
  # To omit the instance writer method, pass <tt>instance_writer: false</tt>.
  # To omit the instance reader method, pass <tt>instance_reader: false</tt>.
  #
  # module HairColors
  # mattr_accessor :hair_colors, instance_writer: false, instance_reader: false
  # end
  #
  # class Person
  # include HairColors
  # end
  #
  # Person.new.hair_colors = [:brown]  # => NoMethodError
  # Person.new.hair_colors             # => NoMethodError
  #
  # Or pass <tt>instance_accessor: false</tt>, to omit both instance methods.
  #
  # module HairColors
  # mattr_accessor :hair_colors, instance_accessor: false
  # end
  #
  # class Person
  # include HairColors
  # end
  #
  # Person.new.hair_colors = [:brown]  # => NoMethodError
  # Person.new.hair_colors             # => NoMethodError
  #
  # You can set a default value for the attribute.
  #
  # module HairColors
  # mattr_accessor :hair_colors, default: [:brown, :black, :blonde, :red]
  # end
  #
  # class Person
  # include HairColors
  # end
  #
  # Person.class_variable_get("@@hair_colors") # => [:brown, :black, :blonde, :red]
  def cattr_accessor(
    *syms,
    instance_reader: T.unsafe(nil),
    instance_writer: T.unsafe(nil),
    instance_accessor: T.unsafe(nil),
    default: T.unsafe(nil),
    &blk
  ); end

  # Defines a class attribute and creates a class and instance reader methods.
  # The underlying class variable is set to +nil+, if it is not previously
  # defined. All class and instance methods created will be public, even if
  # this method is called with a private or protected access modifier.
  #
  # module HairColors
  # mattr_reader :hair_colors
  # end
  #
  # HairColors.hair_colors # => nil
  # HairColors.class_variable_set("@@hair_colors", [:brown, :black])
  # HairColors.hair_colors # => [:brown, :black]
  #
  # The attribute name must be a valid method name in Ruby.
  #
  # module Foo
  # mattr_reader :"1_Badname"
  # end
  # # => NameError: invalid attribute name: 1_Badname
  #
  # To omit the instance reader method, pass
  # <tt>instance_reader: false</tt> or <tt>instance_accessor: false</tt>.
  #
  # module HairColors
  # mattr_reader :hair_colors, instance_reader: false
  # end
  #
  # class Person
  # include HairColors
  # end
  #
  # Person.new.hair_colors # => NoMethodError
  #
  # You can set a default value for the attribute.
  #
  # module HairColors
  # mattr_reader :hair_colors, default: [:brown, :black, :blonde, :red]
  # end
  #
  # class Person
  # include HairColors
  # end
  #
  # Person.new.hair_colors # => [:brown, :black, :blonde, :red]
  def cattr_reader(
    *syms,
    instance_reader: T.unsafe(nil),
    instance_accessor: T.unsafe(nil),
    default: T.unsafe(nil),
    location: T.unsafe(nil)
  ); end

  # Defines a class attribute and creates a class and instance writer methods to
  # allow assignment to the attribute. All class and instance methods created
  # will be public, even if this method is called with a private or protected
  # access modifier.
  #
  # module HairColors
  # mattr_writer :hair_colors
  # end
  #
  # class Person
  # include HairColors
  # end
  #
  # HairColors.hair_colors = [:brown, :black]
  # Person.class_variable_get("@@hair_colors") # => [:brown, :black]
  # Person.new.hair_colors = [:blonde, :red]
  # HairColors.class_variable_get("@@hair_colors") # => [:blonde, :red]
  #
  # To omit the instance writer method, pass
  # <tt>instance_writer: false</tt> or <tt>instance_accessor: false</tt>.
  #
  # module HairColors
  # mattr_writer :hair_colors, instance_writer: false
  # end
  #
  # class Person
  # include HairColors
  # end
  #
  # Person.new.hair_colors = [:blonde, :red] # => NoMethodError
  #
  # You can set a default value for the attribute.
  #
  # module HairColors
  # mattr_writer :hair_colors, default: [:brown, :black, :blonde, :red]
  # end
  #
  # class Person
  # include HairColors
  # end
  #
  # Person.class_variable_get("@@hair_colors") # => [:brown, :black, :blonde, :red]
  def cattr_writer(
    *syms,
    instance_writer: T.unsafe(nil),
    instance_accessor: T.unsafe(nil),
    default: T.unsafe(nil),
    location: T.unsafe(nil)
  ); end

  # Provides a +delegate+ class method to easily expose contained objects'
  # public methods as your own.
  #
  # ==== Options
  # * <tt>:to</tt> - Specifies the target object name as a symbol or string
  # * <tt>:prefix</tt> - Prefixes the new method with the target name or a custom prefix
  # * <tt>:allow_nil</tt> - If set to true, prevents a +Module::DelegationError+
  # from being raised
  # * <tt>:private</tt> - If set to true, changes method visibility to private
  #
  # The macro receives one or more method names (specified as symbols or
  # strings) and the name of the target object via the <tt>:to</tt> option
  # (also a symbol or string).
  #
  # Delegation is particularly useful with Active Record associations:
  #
  # class Greeter < ActiveRecord::Base
  # def hello
  # 'hello'
  # end
  #
  # def goodbye
  # 'goodbye'
  # end
  # end
  #
  # class Foo < ActiveRecord::Base
  # belongs_to :greeter
  # delegate :hello, to: :greeter
  # end
  #
  # Foo.new.hello   # => "hello"
  # Foo.new.goodbye # => NoMethodError: undefined method `goodbye' for #<Foo:0x1af30c>
  #
  # Multiple delegates to the same target are allowed:
  #
  # class Foo < ActiveRecord::Base
  # belongs_to :greeter
  # delegate :hello, :goodbye, to: :greeter
  # end
  #
  # Foo.new.goodbye # => "goodbye"
  #
  # Methods can be delegated to instance variables, class variables, or constants
  # by providing them as a symbols:
  #
  # class Foo
  # CONSTANT_ARRAY = [0,1,2,3]
  # @@class_array  = [4,5,6,7]
  #
  # def initialize
  # @instance_array = [8,9,10,11]
  # end
  # delegate :sum, to: :CONSTANT_ARRAY
  # delegate :min, to: :@@class_array
  # delegate :max, to: :@instance_array
  # end
  #
  # Foo.new.sum # => 6
  # Foo.new.min # => 4
  # Foo.new.max # => 11
  #
  # It's also possible to delegate a method to the class by using +:class+:
  #
  # class Foo
  # def self.hello
  # "world"
  # end
  #
  # delegate :hello, to: :class
  # end
  #
  # Foo.new.hello # => "world"
  #
  # Delegates can optionally be prefixed using the <tt>:prefix</tt> option. If the value
  # is <tt>true</tt>, the delegate methods are prefixed with the name of the object being
  # delegated to.
  #
  # Person = Struct.new(:name, :address)
  #
  # class Invoice < Struct.new(:client)
  # delegate :name, :address, to: :client, prefix: true
  # end
  #
  # john_doe = Person.new('John Doe', 'Vimmersvej 13')
  # invoice = Invoice.new(john_doe)
  # invoice.client_name    # => "John Doe"
  # invoice.client_address # => "Vimmersvej 13"
  #
  # It is also possible to supply a custom prefix.
  #
  # class Invoice < Struct.new(:client)
  # delegate :name, :address, to: :client, prefix: :customer
  # end
  #
  # invoice = Invoice.new(john_doe)
  # invoice.customer_name    # => 'John Doe'
  # invoice.customer_address # => 'Vimmersvej 13'
  #
  # The delegated methods are public by default.
  # Pass <tt>private: true</tt> to change that.
  #
  # class User < ActiveRecord::Base
  # has_one :profile
  # delegate :first_name, to: :profile
  # delegate :date_of_birth, to: :profile, private: true
  #
  # def age
  # Date.today.year - date_of_birth.year
  # end
  # end
  #
  # User.new.first_name # => "Tomas"
  # User.new.date_of_birth # => NoMethodError: private method `date_of_birth' called for #<User:0x00000008221340>
  # User.new.age # => 2
  #
  # If the target is +nil+ and does not respond to the delegated method a
  # +Module::DelegationError+ is raised. If you wish to instead return +nil+,
  # use the <tt>:allow_nil</tt> option.
  #
  # class User < ActiveRecord::Base
  # has_one :profile
  # delegate :age, to: :profile
  # end
  #
  # User.new.age
  # # => Module::DelegationError: User#age delegated to profile.age, but profile is nil
  #
  # But if not having a profile yet is fine and should not be an error
  # condition:
  #
  # class User < ActiveRecord::Base
  # has_one :profile
  # delegate :age, to: :profile, allow_nil: true
  # end
  #
  # User.new.age # nil
  #
  # Note that if the target is not +nil+ then the call is attempted regardless of the
  # <tt>:allow_nil</tt> option, and thus an exception is still raised if said object
  # does not respond to the method:
  #
  # class Foo
  # def initialize(bar)
  # @bar = bar
  # end
  #
  # delegate :name, to: :@bar, allow_nil: true
  # end
  #
  # Foo.new("Bar").name # raises NoMethodError: undefined method `name'
  #
  # The target method must be public, otherwise it will raise +NoMethodError+.
  def delegate(
    *methods,
    to: T.unsafe(nil),
    prefix: T.unsafe(nil),
    allow_nil: T.unsafe(nil),
    private: T.unsafe(nil)
  ); end

  # When building decorators, a common pattern may emerge:
  #
  # class Partition
  # def initialize(event)
  # @event = event
  # end
  #
  # def person
  # detail.person || creator
  # end
  #
  # private
  # def respond_to_missing?(name, include_private = false)
  # @event.respond_to?(name, include_private)
  # end
  #
  # def method_missing(method, *args, &block)
  # @event.send(method, *args, &block)
  # end
  # end
  #
  # With <tt>Module#delegate_missing_to</tt>, the above is condensed to:
  #
  # class Partition
  # delegate_missing_to :@event
  #
  # def initialize(event)
  # @event = event
  # end
  #
  # def person
  # detail.person || creator
  # end
  # end
  #
  # The target can be anything callable within the object, e.g. instance
  # variables, methods, constants, etc.
  #
  # The delegated method must be public on the target, otherwise it will
  # raise +DelegationError+. If you wish to instead return +nil+,
  # use the <tt>:allow_nil</tt> option.
  #
  # The <tt>marshal_dump</tt> and <tt>_dump</tt> methods are exempt from
  # delegation due to possible interference when calling
  # <tt>Marshal.dump(object)</tt>, should the delegation target method
  # of <tt>object</tt> add or remove instance variables.
  def delegate_missing_to(target, allow_nil: T.unsafe(nil)); end

  # deprecate :foo
  # deprecate bar: 'message'
  # deprecate :foo, :bar, baz: 'warning!', qux: 'gone!'
  #
  # You can also use custom deprecator instance:
  #
  # deprecate :foo, deprecator: MyLib::Deprecator.new
  # deprecate :foo, bar: "warning!", deprecator: MyLib::Deprecator.new
  #
  # \Custom deprecators must respond to <tt>deprecation_warning(deprecated_method_name, message, caller_backtrace)</tt>
  # method where you can implement your custom warning behavior.
  #
  # class MyLib::Deprecator
  # def deprecation_warning(deprecated_method_name, message, caller_backtrace = nil)
  # message = "#{deprecated_method_name} is deprecated and will be removed from MyLibrary | #{message}"
  # Kernel.warn message
  # end
  # end
  def deprecate(*method_names); end

  # Defines both class and instance accessors for class attributes.
  # All class and instance methods created will be public, even if
  # this method is called with a private or protected access modifier.
  #
  # module HairColors
  # mattr_accessor :hair_colors
  # end
  #
  # class Person
  # include HairColors
  # end
  #
  # HairColors.hair_colors = [:brown, :black, :blonde, :red]
  # HairColors.hair_colors # => [:brown, :black, :blonde, :red]
  # Person.new.hair_colors # => [:brown, :black, :blonde, :red]
  #
  # If a subclass changes the value then that would also change the value for
  # parent class. Similarly if parent class changes the value then that would
  # change the value of subclasses too.
  #
  # class Citizen < Person
  # end
  #
  # Citizen.new.hair_colors << :blue
  # Person.new.hair_colors # => [:brown, :black, :blonde, :red, :blue]
  #
  # To omit the instance writer method, pass <tt>instance_writer: false</tt>.
  # To omit the instance reader method, pass <tt>instance_reader: false</tt>.
  #
  # module HairColors
  # mattr_accessor :hair_colors, instance_writer: false, instance_reader: false
  # end
  #
  # class Person
  # include HairColors
  # end
  #
  # Person.new.hair_colors = [:brown]  # => NoMethodError
  # Person.new.hair_colors             # => NoMethodError
  #
  # Or pass <tt>instance_accessor: false</tt>, to omit both instance methods.
  #
  # module HairColors
  # mattr_accessor :hair_colors, instance_accessor: false
  # end
  #
  # class Person
  # include HairColors
  # end
  #
  # Person.new.hair_colors = [:brown]  # => NoMethodError
  # Person.new.hair_colors             # => NoMethodError
  #
  # You can set a default value for the attribute.
  #
  # module HairColors
  # mattr_accessor :hair_colors, default: [:brown, :black, :blonde, :red]
  # end
  #
  # class Person
  # include HairColors
  # end
  #
  # Person.class_variable_get("@@hair_colors") # => [:brown, :black, :blonde, :red]
  def mattr_accessor(
    *syms,
    instance_reader: T.unsafe(nil),
    instance_writer: T.unsafe(nil),
    instance_accessor: T.unsafe(nil),
    default: T.unsafe(nil),
    &blk
  ); end

  # Defines a class attribute and creates a class and instance reader methods.
  # The underlying class variable is set to +nil+, if it is not previously
  # defined. All class and instance methods created will be public, even if
  # this method is called with a private or protected access modifier.
  #
  # module HairColors
  # mattr_reader :hair_colors
  # end
  #
  # HairColors.hair_colors # => nil
  # HairColors.class_variable_set("@@hair_colors", [:brown, :black])
  # HairColors.hair_colors # => [:brown, :black]
  #
  # The attribute name must be a valid method name in Ruby.
  #
  # module Foo
  # mattr_reader :"1_Badname"
  # end
  # # => NameError: invalid attribute name: 1_Badname
  #
  # To omit the instance reader method, pass
  # <tt>instance_reader: false</tt> or <tt>instance_accessor: false</tt>.
  #
  # module HairColors
  # mattr_reader :hair_colors, instance_reader: false
  # end
  #
  # class Person
  # include HairColors
  # end
  #
  # Person.new.hair_colors # => NoMethodError
  #
  # You can set a default value for the attribute.
  #
  # module HairColors
  # mattr_reader :hair_colors, default: [:brown, :black, :blonde, :red]
  # end
  #
  # class Person
  # include HairColors
  # end
  #
  # Person.new.hair_colors # => [:brown, :black, :blonde, :red]
  def mattr_reader(
    *syms,
    instance_reader: T.unsafe(nil),
    instance_accessor: T.unsafe(nil),
    default: T.unsafe(nil),
    location: T.unsafe(nil)
  ); end

  # Defines a class attribute and creates a class and instance writer methods to
  # allow assignment to the attribute. All class and instance methods created
  # will be public, even if this method is called with a private or protected
  # access modifier.
  #
  # module HairColors
  # mattr_writer :hair_colors
  # end
  #
  # class Person
  # include HairColors
  # end
  #
  # HairColors.hair_colors = [:brown, :black]
  # Person.class_variable_get("@@hair_colors") # => [:brown, :black]
  # Person.new.hair_colors = [:blonde, :red]
  # HairColors.class_variable_get("@@hair_colors") # => [:blonde, :red]
  #
  # To omit the instance writer method, pass
  # <tt>instance_writer: false</tt> or <tt>instance_accessor: false</tt>.
  #
  # module HairColors
  # mattr_writer :hair_colors, instance_writer: false
  # end
  #
  # class Person
  # include HairColors
  # end
  #
  # Person.new.hair_colors = [:blonde, :red] # => NoMethodError
  #
  # You can set a default value for the attribute.
  #
  # module HairColors
  # mattr_writer :hair_colors, default: [:brown, :black, :blonde, :red]
  # end
  #
  # class Person
  # include HairColors
  # end
  #
  # Person.class_variable_get("@@hair_colors") # => [:brown, :black, :blonde, :red]
  def mattr_writer(
    *syms,
    instance_writer: T.unsafe(nil),
    instance_accessor: T.unsafe(nil),
    default: T.unsafe(nil),
    location: T.unsafe(nil)
  ); end

  def method_visibility(method); end

  # Returns the module which contains this one according to its name.
  #
  # module M
  # module N
  # end
  # end
  # X = M::N
  #
  # M::N.module_parent # => M
  # X.module_parent    # => M
  #
  # The parent of top-level and anonymous modules is Object.
  #
  # M.module_parent          # => Object
  # Module.new.module_parent # => Object
  def module_parent; end

  # Returns the name of the module containing this one.
  #
  # M::N.module_parent_name # => "M"
  def module_parent_name; end

  # Returns all the parents of this module according to its name, ordered from
  # nested outwards. The receiver is not contained within the result.
  #
  # module M
  # module N
  # end
  # end
  # X = M::N
  #
  # M.module_parents    # => [Object]
  # M::N.module_parents # => [M, Object]
  # X.module_parents    # => [M, Object]
  def module_parents; end

  # Replaces the existing method definition, if there is one, with the passed
  # block as its body.
  def redefine_method(method, &block); end

  # Replaces the existing singleton method definition, if there is one, with
  # the passed block as its body.
  def redefine_singleton_method(method, &block); end

  # Removes the named method, if it exists.
  def remove_possible_method(method); end

  # Removes the named singleton method, if it exists.
  def remove_possible_singleton_method(method); end

  # Marks the named method as intended to be redefined, if it exists.
  # Suppresses the Ruby method redefinition warning. Prefer
  # #redefine_method where possible.
  def silence_redefinition_of_method(method); end

  # Defines both class and instance accessors for class attributes.
  #
  # class Account
  # thread_mattr_accessor :user
  # end
  #
  # Account.user = "DHH"
  # Account.user     # => "DHH"
  # Account.new.user # => "DHH"
  #
  # Unlike `mattr_accessor`, values are *not* shared with subclasses or parent classes.
  # If a subclass changes the value, the parent class' value is not changed.
  # If the parent class changes the value, the value of subclasses is not changed.
  #
  # class Customer < Account
  # end
  #
  # Account.user   # => "DHH"
  # Customer.user  # => nil
  # Customer.user  = "Rafael"
  # Customer.user  # => "Rafael"
  # Account.user   # => "DHH"
  #
  # To omit the instance writer method, pass <tt>instance_writer: false</tt>.
  # To omit the instance reader method, pass <tt>instance_reader: false</tt>.
  #
  # class Current
  # thread_mattr_accessor :user, instance_writer: false, instance_reader: false
  # end
  #
  # Current.new.user = "DHH"  # => NoMethodError
  # Current.new.user          # => NoMethodError
  #
  # Or pass <tt>instance_accessor: false</tt>, to omit both instance methods.
  #
  # class Current
  # thread_mattr_accessor :user, instance_accessor: false
  # end
  #
  # Current.new.user = "DHH"  # => NoMethodError
  # Current.new.user          # => NoMethodError
  def thread_cattr_accessor(
    *syms,
    instance_reader: T.unsafe(nil),
    instance_writer: T.unsafe(nil),
    instance_accessor: T.unsafe(nil),
    default: T.unsafe(nil)
  ); end

  # Defines a per-thread class attribute and creates class and instance reader methods.
  # The underlying per-thread class variable is set to +nil+, if it is not previously defined.
  #
  # module Current
  # thread_mattr_reader :user
  # end
  #
  # Current.user = "DHH"
  # Current.user # => "DHH"
  # Thread.new { Current.user }.values # => nil
  #
  # The attribute name must be a valid method name in Ruby.
  #
  # module Foo
  # thread_mattr_reader :"1_Badname"
  # end
  # # => NameError: invalid attribute name: 1_Badname
  #
  # To omit the instance reader method, pass
  # <tt>instance_reader: false</tt> or <tt>instance_accessor: false</tt>.
  #
  # class Current
  # thread_mattr_reader :user, instance_reader: false
  # end
  #
  # Current.new.user # => NoMethodError
  def thread_cattr_reader(
    *syms,
    instance_reader: T.unsafe(nil),
    instance_accessor: T.unsafe(nil),
    default: T.unsafe(nil)
  ); end

  # Defines a per-thread class attribute and creates a class and instance writer methods to
  # allow assignment to the attribute.
  #
  # module Current
  # thread_mattr_writer :user
  # end
  #
  # Current.user = "DHH"
  # Thread.current[:attr_Current_user] # => "DHH"
  #
  # To omit the instance writer method, pass
  # <tt>instance_writer: false</tt> or <tt>instance_accessor: false</tt>.
  #
  # class Current
  # thread_mattr_writer :user, instance_writer: false
  # end
  #
  # Current.new.user = "DHH" # => NoMethodError
  def thread_cattr_writer(
    *syms,
    instance_writer: T.unsafe(nil),
    instance_accessor: T.unsafe(nil),
    default: T.unsafe(nil)
  ); end

  # Defines both class and instance accessors for class attributes.
  #
  # class Account
  # thread_mattr_accessor :user
  # end
  #
  # Account.user = "DHH"
  # Account.user     # => "DHH"
  # Account.new.user # => "DHH"
  #
  # Unlike `mattr_accessor`, values are *not* shared with subclasses or parent classes.
  # If a subclass changes the value, the parent class' value is not changed.
  # If the parent class changes the value, the value of subclasses is not changed.
  #
  # class Customer < Account
  # end
  #
  # Account.user   # => "DHH"
  # Customer.user  # => nil
  # Customer.user  = "Rafael"
  # Customer.user  # => "Rafael"
  # Account.user   # => "DHH"
  #
  # To omit the instance writer method, pass <tt>instance_writer: false</tt>.
  # To omit the instance reader method, pass <tt>instance_reader: false</tt>.
  #
  # class Current
  # thread_mattr_accessor :user, instance_writer: false, instance_reader: false
  # end
  #
  # Current.new.user = "DHH"  # => NoMethodError
  # Current.new.user          # => NoMethodError
  #
  # Or pass <tt>instance_accessor: false</tt>, to omit both instance methods.
  #
  # class Current
  # thread_mattr_accessor :user, instance_accessor: false
  # end
  #
  # Current.new.user = "DHH"  # => NoMethodError
  # Current.new.user          # => NoMethodError
  def thread_mattr_accessor(
    *syms,
    instance_reader: T.unsafe(nil),
    instance_writer: T.unsafe(nil),
    instance_accessor: T.unsafe(nil),
    default: T.unsafe(nil)
  ); end

  # Defines a per-thread class attribute and creates class and instance reader methods.
  # The underlying per-thread class variable is set to +nil+, if it is not previously defined.
  #
  # module Current
  # thread_mattr_reader :user
  # end
  #
  # Current.user = "DHH"
  # Current.user # => "DHH"
  # Thread.new { Current.user }.values # => nil
  #
  # The attribute name must be a valid method name in Ruby.
  #
  # module Foo
  # thread_mattr_reader :"1_Badname"
  # end
  # # => NameError: invalid attribute name: 1_Badname
  #
  # To omit the instance reader method, pass
  # <tt>instance_reader: false</tt> or <tt>instance_accessor: false</tt>.
  #
  # class Current
  # thread_mattr_reader :user, instance_reader: false
  # end
  #
  # Current.new.user # => NoMethodError
  def thread_mattr_reader(
    *syms,
    instance_reader: T.unsafe(nil),
    instance_accessor: T.unsafe(nil),
    default: T.unsafe(nil)
  ); end

  # Defines a per-thread class attribute and creates a class and instance writer methods to
  # allow assignment to the attribute.
  #
  # module Current
  # thread_mattr_writer :user
  # end
  #
  # Current.user = "DHH"
  # Thread.current[:attr_Current_user] # => "DHH"
  #
  # To omit the instance writer method, pass
  # <tt>instance_writer: false</tt> or <tt>instance_accessor: false</tt>.
  #
  # class Current
  # thread_mattr_writer :user, instance_writer: false
  # end
  #
  # Current.new.user = "DHH" # => NoMethodError
  def thread_mattr_writer(
    *syms,
    instance_writer: T.unsafe(nil),
    instance_accessor: T.unsafe(nil),
    default: T.unsafe(nil)
  ); end

  private

  def attr_internal_define(attr_name, type); end
  def attr_internal_ivar_name(attr); end

  class << self
    # Returns the value of attribute attr_internal_naming_format.
    def attr_internal_naming_format; end

    # Sets the attribute attr_internal_naming_format
    def attr_internal_naming_format=(_arg0); end
  end
end

# = Bite-sized separation of concerns
#
# We often find ourselves with a medium-sized chunk of behavior that we'd
# like to extract, but only mix in to a single class.
#
# Extracting a plain old Ruby object to encapsulate it and collaborate or
# delegate to the original object is often a good choice, but when there's
# no additional state to encapsulate or we're making DSL-style declarations
# about the parent class, introducing new collaborators can obfuscate rather
# than simplify.
#
# The typical route is to just dump everything in a monolithic class, perhaps
# with a comment, as a least-bad alternative. Using modules in separate files
# means tedious sifting to get a big-picture view.
#
# = Dissatisfying ways to separate small concerns
#
# == Using comments:
#
# class Todo < ApplicationRecord
# # Other todo implementation
# # ...
#
# ## Event tracking
# has_many :events
#
# before_create :track_creation
#
# private
# def track_creation
# # ...
# end
# end
#
# == With an inline module:
#
# Noisy syntax.
#
# class Todo < ApplicationRecord
# # Other todo implementation
# # ...
#
# module EventTracking
# extend ActiveSupport::Concern
#
# included do
# has_many :events
# before_create :track_creation
# end
#
# private
# def track_creation
# # ...
# end
# end
# include EventTracking
# end
#
# == Mix-in noise exiled to its own file:
#
# Once our chunk of behavior starts pushing the scroll-to-understand-it
# boundary, we give in and move it to a separate file. At this size, the
# increased overhead can be a reasonable tradeoff even if it reduces our
# at-a-glance perception of how things work.
#
# class Todo < ApplicationRecord
# # Other todo implementation
# # ...
#
# include TodoEventTracking
# end
#
# = Introducing Module#concerning
#
# By quieting the mix-in noise, we arrive at a natural, low-ceremony way to
# separate bite-sized concerns.
#
# class Todo < ApplicationRecord
# # Other todo implementation
# # ...
#
# concerning :EventTracking do
# included do
# has_many :events
# before_create :track_creation
# end
#
# private
# def track_creation
# # ...
# end
# end
# end
#
# Todo.ancestors
# # => [Todo, Todo::EventTracking, ApplicationRecord, Object]
#
# This small step has some wonderful ripple effects. We can
# * grok the behavior of our class in one glance,
# * clean up monolithic junk-drawer classes by separating their concerns, and
# * stop leaning on protected/private for crude "this is internal stuff" modularity.
#
# === Prepending concerning
#
# <tt>concerning</tt> supports a <tt>prepend: true</tt> argument which will <tt>prepend</tt> the
# concern instead of using <tt>include</tt> for it.
module Module::Concerning
  # A low-cruft shortcut to define a concern.
  #
  # concern :EventTracking do
  # ...
  # end
  #
  # is equivalent to
  #
  # module EventTracking
  # extend ActiveSupport::Concern
  #
  # ...
  # end
  def concern(topic, &module_definition); end

  # Define a new concern and mix it in.
  def concerning(topic, prepend: T.unsafe(nil), &block); end
end

Module::DELEGATION_RESERVED_KEYWORDS = T.let(T.unsafe(nil), Array)
Module::DELEGATION_RESERVED_METHOD_NAMES = T.let(T.unsafe(nil), Set)

# Error generated by +delegate+ when a method is called on +nil+ and +allow_nil+
# option is not used.
class Module::DelegationError < ::NoMethodError
end

Module::RUBY_RESERVED_KEYWORDS = T.let(T.unsafe(nil), Array)

class NameError < ::StandardError
  include ::DidYouMean::Correctable

  # Extract the name of the missing constant from the exception message.
  #
  # begin
  # HelloWorld
  # rescue NameError => e
  # e.missing_name
  # end
  # # => "HelloWorld"
  def missing_name; end

  # Was this exception raised because the given name was missing?
  #
  # begin
  # HelloWorld
  # rescue NameError => e
  # e.missing_name?("HelloWorld")
  # end
  # # => true
  def missing_name?(name); end

  private

  def real_mod_name(mod); end
end

NameError::UNBOUND_METHOD_MODULE_NAME = T.let(T.unsafe(nil), UnboundMethod)

class NilClass
  include ::JSON::Ext::Generator::GeneratorMethods::NilClass
  include ::MessagePack::CoreExt

  def as_json(options = T.unsafe(nil)); end

  # +nil+ is blank:
  #
  # nil.blank? # => true
  def blank?; end

  # Returns +self+.
  def to_param; end

  # Calling +try+ on +nil+ always returns +nil+.
  # It becomes especially helpful when navigating through associations that may return +nil+.
  #
  # nil.try(:name) # => nil
  #
  # Without +try+
  # @person && @person.children.any? && @person.children.first.name
  #
  # With +try+
  # @person.try(:children).try(:first).try(:name)
  def try(*_arg0); end

  # Calling +try!+ on +nil+ always returns +nil+.
  #
  # nil.try!(:name) # => nil
  def try!(*_arg0); end
end

class Numeric
  include ::Comparable

  def as_json(options = T.unsafe(nil)); end

  # No number is blank:
  #
  # 1.blank? # => false
  # 0.blank? # => false
  def blank?; end

  # Enables the use of byte calculations and declarations, like 45.bytes + 2.6.megabytes
  #
  # 2.bytes # => 2
  def byte; end

  # Enables the use of byte calculations and declarations, like 45.bytes + 2.6.megabytes
  #
  # 2.bytes # => 2
  def bytes; end

  # Returns a Duration instance matching the number of days provided.
  #
  # 2.days # => 2 days
  def day; end

  # Returns a Duration instance matching the number of days provided.
  #
  # 2.days # => 2 days
  def days; end

  # Returns the number of bytes equivalent to the exabytes provided.
  #
  # 2.exabytes # => 2_305_843_009_213_693_952
  def exabyte; end

  # Returns the number of bytes equivalent to the exabytes provided.
  #
  # 2.exabytes # => 2_305_843_009_213_693_952
  def exabytes; end

  # Returns a Duration instance matching the number of fortnights provided.
  #
  # 2.fortnights # => 4 weeks
  def fortnight; end

  # Returns a Duration instance matching the number of fortnights provided.
  #
  # 2.fortnights # => 4 weeks
  def fortnights; end

  # Returns the number of bytes equivalent to the gigabytes provided.
  #
  # 2.gigabytes # => 2_147_483_648
  def gigabyte; end

  # Returns the number of bytes equivalent to the gigabytes provided.
  #
  # 2.gigabytes # => 2_147_483_648
  def gigabytes; end

  # Returns a Duration instance matching the number of hours provided.
  #
  # 2.hours # => 2 hours
  def hour; end

  # Returns a Duration instance matching the number of hours provided.
  #
  # 2.hours # => 2 hours
  def hours; end

  def html_safe?; end

  # Returns the number of milliseconds equivalent to the seconds provided.
  # Used with the standard time durations.
  #
  # 2.in_milliseconds # => 2000
  # 1.hour.in_milliseconds # => 3600000
  def in_milliseconds; end

  # Returns the number of bytes equivalent to the kilobytes provided.
  #
  # 2.kilobytes # => 2048
  def kilobyte; end

  # Returns the number of bytes equivalent to the kilobytes provided.
  #
  # 2.kilobytes # => 2048
  def kilobytes; end

  # Returns the number of bytes equivalent to the megabytes provided.
  #
  # 2.megabytes # => 2_097_152
  def megabyte; end

  # Returns the number of bytes equivalent to the megabytes provided.
  #
  # 2.megabytes # => 2_097_152
  def megabytes; end

  # Returns a Duration instance matching the number of minutes provided.
  #
  # 2.minutes # => 2 minutes
  def minute; end

  # Returns a Duration instance matching the number of minutes provided.
  #
  # 2.minutes # => 2 minutes
  def minutes; end

  # Returns the number of bytes equivalent to the petabytes provided.
  #
  # 2.petabytes # => 2_251_799_813_685_248
  def petabyte; end

  # Returns the number of bytes equivalent to the petabytes provided.
  #
  # 2.petabytes # => 2_251_799_813_685_248
  def petabytes; end

  # Returns a Duration instance matching the number of seconds provided.
  #
  # 2.seconds # => 2 seconds
  def second; end

  # Returns a Duration instance matching the number of seconds provided.
  #
  # 2.seconds # => 2 seconds
  def seconds; end

  # Returns the number of bytes equivalent to the terabytes provided.
  #
  # 2.terabytes # => 2_199_023_255_552
  def terabyte; end

  # Returns the number of bytes equivalent to the terabytes provided.
  #
  # 2.terabytes # => 2_199_023_255_552
  def terabytes; end

  # Returns a Duration instance matching the number of weeks provided.
  #
  # 2.weeks # => 2 weeks
  def week; end

  # Returns a Duration instance matching the number of weeks provided.
  #
  # 2.weeks # => 2 weeks
  def weeks; end
end

Numeric::EXABYTE = T.let(T.unsafe(nil), Integer)
Numeric::GIGABYTE = T.let(T.unsafe(nil), Integer)
Numeric::KILOBYTE = T.let(T.unsafe(nil), Integer)
Numeric::MEGABYTE = T.let(T.unsafe(nil), Integer)
Numeric::PETABYTE = T.let(T.unsafe(nil), Integer)
Numeric::TERABYTE = T.let(T.unsafe(nil), Integer)

# --
# Most objects are cloneable, but not all. For example you can't dup methods:
#
# method(:puts).dup # => TypeError: allocator undefined for Method
#
# Classes may signal their instances are not duplicable removing +dup+/+clone+
# or raising exceptions from them. So, to dup an arbitrary object you normally
# use an optimistic approach and are ready to catch an exception, say:
#
# arbitrary_object.dup rescue object
#
# Rails dups objects in a few critical spots where they are not that arbitrary.
# That rescue is very expensive (like 40 times slower than a predicate), and it
# is often triggered.
#
# That's why we hardcode the following cases and check duplicable? instead of
# using that rescue idiom.
# ++
class Object < ::BasicObject
  include ::ActiveSupport::ToJsonWithActiveSupportEncoder
  include ::ActiveSupport::Dependencies::RequireDependency
  include ::Kernel
  include ::ActiveSupport::ForkTracker::CoreExt
  include ::ActiveSupport::ForkTracker::CoreExtPrivate
  include ::JSON::Ext::Generator::GeneratorMethods::Object
  include ::ActiveSupport::Tryable
  include ::PP::ObjectMixin

  # Provides a way to check whether some class acts like some other class based on the existence of
  # an appropriately-named marker method.
  #
  # A class that provides the same interface as <tt>SomeClass</tt> may define a marker method named
  # <tt>acts_like_some_class?</tt> to signal its compatibility to callers of
  # <tt>acts_like?(:some_class)</tt>.
  #
  # For example, Active Support extends <tt>Date</tt> to define an <tt>acts_like_date?</tt> method,
  # and extends <tt>Time</tt> to define <tt>acts_like_time?</tt>. As a result, developers can call
  # <tt>x.acts_like?(:time)</tt> and <tt>x.acts_like?(:date)</tt> to test duck-type compatibility,
  # and classes that are able to act like <tt>Time</tt> can also define an <tt>acts_like_time?</tt>
  # method to interoperate.
  #
  # Note that the marker method is only expected to exist. It isn't called, so its body or return
  # value are irrelevant.
  #
  # ==== Example: A class that provides the same interface as <tt>String</tt>
  #
  # This class may define:
  #
  # class Stringish
  # def acts_like_string?
  # end
  # end
  #
  # Then client code can query for duck-type-safeness this way:
  #
  # Stringish.new.acts_like?(:string) # => true
  def acts_like?(duck); end

  def as_json(options = T.unsafe(nil)); end

  # An object is blank if it's false, empty, or a whitespace string.
  # For example, +nil+, '', '   ', [], {}, and +false+ are all blank.
  #
  # This simplifies
  #
  # !address || address.empty?
  #
  # to
  #
  # address.blank?
  def blank?; end

  # Returns a deep copy of object if it's duplicable. If it's
  # not duplicable, returns +self+.
  #
  # object = Object.new
  # dup    = object.deep_dup
  # dup.instance_variable_set(:@a, 1)
  #
  # object.instance_variable_defined?(:@a) # => false
  # dup.instance_variable_defined?(:@a)    # => true
  def deep_dup; end

  # Can you safely dup this object?
  #
  # False for method objects;
  # true otherwise.
  def duplicable?; end

  def html_safe?; end

  # Returns true if this object is included in the argument. Argument must be
  # any object which responds to +#include?+. Usage:
  #
  # characters = ["Konata", "Kagami", "Tsukasa"]
  # "Konata".in?(characters) # => true
  #
  # This will throw an +ArgumentError+ if the argument doesn't respond
  # to +#include?+.
  def in?(another_object); end

  # Returns a hash with string keys that maps instance variable names without "@" to their
  # corresponding values.
  #
  # class C
  # def initialize(x, y)
  # @x, @y = x, y
  # end
  # end
  #
  # C.new(0, 1).instance_values # => {"x" => 0, "y" => 1}
  def instance_values; end

  # Returns an array of instance variable names as strings including "@".
  #
  # class C
  # def initialize(x, y)
  # @x, @y = x, y
  # end
  # end
  #
  # C.new(0, 1).instance_variable_names # => ["@y", "@x"]
  def instance_variable_names; end

  # Returns the receiver if it's present otherwise returns +nil+.
  # <tt>object.presence</tt> is equivalent to
  #
  # object.present? ? object : nil
  #
  # For example, something like
  #
  # state   = params[:state]   if params[:state].present?
  # country = params[:country] if params[:country].present?
  # region  = state || country || 'US'
  #
  # becomes
  #
  # region = params[:state].presence || params[:country].presence || 'US'
  def presence; end

  # Returns the receiver if it's included in the argument otherwise returns +nil+.
  # Argument must be any object which responds to +#include?+. Usage:
  #
  # params[:bucket_type].presence_in %w( project calendar )
  #
  # This will throw an +ArgumentError+ if the argument doesn't respond to +#include?+.
  def presence_in(another_object); end

  # An object is present if it's not blank.
  def present?; end

  # Alias of <tt>to_s</tt>.
  def to_param; end

  # Converts an object into a string suitable for use as a URL query string,
  # using the given <tt>key</tt> as the param name.
  def to_query(key); end

  # An elegant way to factor duplication out of options passed to a series of
  # method calls. Each method called in the block, with the block variable as
  # the receiver, will have its options merged with the default +options+ hash
  # provided. Each method called on the block variable must take an options
  # hash as its final argument.
  #
  # Without <tt>with_options</tt>, this code contains duplication:
  #
  # class Account < ActiveRecord::Base
  # has_many :customers, dependent: :destroy
  # has_many :products,  dependent: :destroy
  # has_many :invoices,  dependent: :destroy
  # has_many :expenses,  dependent: :destroy
  # end
  #
  # Using <tt>with_options</tt>, we can remove the duplication:
  #
  # class Account < ActiveRecord::Base
  # with_options dependent: :destroy do |assoc|
  # assoc.has_many :customers
  # assoc.has_many :products
  # assoc.has_many :invoices
  # assoc.has_many :expenses
  # end
  # end
  #
  # It can also be used with an explicit receiver:
  #
  # I18n.with_options locale: user.locale, scope: 'newsletter' do |i18n|
  # subject i18n.t :subject
  # body    i18n.t :body, user_name: user.name
  # end
  #
  # When you don't pass an explicit receiver, it executes the whole block
  # in merging options context:
  #
  # class Account < ActiveRecord::Base
  # with_options dependent: :destroy do
  # has_many :customers
  # has_many :products
  # has_many :invoices
  # has_many :expenses
  # end
  # end
  #
  # <tt>with_options</tt> can also be nested since the call is forwarded to its receiver.
  #
  # NOTE: Each nesting level will merge inherited defaults in addition to their own.
  #
  # class Post < ActiveRecord::Base
  # with_options if: :persisted?, length: { minimum: 50 } do
  # validates :content, if: -> { content.present? }
  # end
  # end
  #
  # The code is equivalent to:
  #
  # validates :content, length: { minimum: 50 }, if: -> { content.present? }
  #
  # Hence the inherited default for +if+ key is ignored.
  #
  # NOTE: You cannot call class methods implicitly inside of with_options.
  # You can access these methods using the class name instead:
  #
  # class Phone < ActiveRecord::Base
  # enum phone_number_type: { home: 0, office: 1, mobile: 2 }
  #
  # with_options presence: true do
  # validates :phone_number_type, inclusion: { in: Phone.phone_number_types.keys }
  # end
  # end
  #
  # When the block argument is omitted, the decorated Object instance is returned:
  #
  # module MyStyledHelpers
  # def styled
  # with_options style: "color: red;"
  # end
  # end
  #
  # # styled.link_to "I'm red", "/"
  # # #=> <a href="/" style="color: red;">I'm red</a>
  #
  # # styled.button_tag "I'm red too!"
  # # #=> <button style="color: red;">I'm red too!</button>
  def with_options(options, &block); end
end

class Pathname
  def as_json(options = T.unsafe(nil)); end

  # Returns the receiver if the named file exists otherwise returns +nil+.
  # <tt>pathname.existence</tt> is equivalent to
  #
  # pathname.exist? ? pathname : nil
  #
  # For example, something like
  #
  # content = pathname.read if pathname.exist?
  #
  # becomes
  #
  # content = pathname.existence&.read
  def existence; end
end

class Process::Status
  def as_json(options = T.unsafe(nil)); end
end

class Range
  include ::ActiveSupport::RangeWithFormat
  include ::ActiveSupport::DeprecatedRangeWithFormat
  include ::ActiveSupport::CompareWithRange
  include ::ActiveSupport::EachTimeWithZone
  include ::Enumerable

  def as_json(options = T.unsafe(nil)); end

  # Compare two ranges and see if they overlap each other
  # (1..5).overlaps?(4..6) # => true
  # (1..5).overlaps?(7..9) # => false
  def overlaps?(other); end

  # Optimize range sum to use arithmetic progression if a block is not given and
  # we have a range of numeric values.
  def sum(identity = T.unsafe(nil)); end
end

class Regexp
  def as_json(options = T.unsafe(nil)); end

  # Returns +true+ if the regexp has the multiline flag set.
  #
  # (/./).multiline?  # => false
  # (/./m).multiline? # => true
  #
  # Regexp.new(".").multiline?                    # => false
  # Regexp.new(".", Regexp::MULTILINE).multiline? # => true
  def multiline?; end
end

Regexp::TOKEN_KEYS = T.let(T.unsafe(nil), Array)

class Regexp::Token < ::Struct
  def conditional_level; end
  def conditional_level=(_); end
  def length; end
  def level; end
  def level=(_); end
  def next; end
  def next=(_arg0); end
  def offset; end
  def previous; end
  def previous=(_arg0); end
  def set_level; end
  def set_level=(_); end
  def te; end
  def te=(_); end
  def text; end
  def text=(_); end
  def token; end
  def token=(_); end
  def ts; end
  def ts=(_); end
  def type; end
  def type=(_); end

  class << self
    def [](*_arg0); end
    def inspect; end
    def members; end
    def new(*_arg0); end
  end
end

module SecureRandom
  extend ::Random::Formatter

  class << self
    # SecureRandom.base36 generates a random base36 string in lowercase.
    #
    # The argument _n_ specifies the length of the random string to be generated.
    #
    # If _n_ is not specified or is +nil+, 16 is assumed. It may be larger in the future.
    # This method can be used over +base58+ if a deterministic case key is necessary.
    #
    # The result will contain alphanumeric characters in lowercase.
    #
    # p SecureRandom.base36 # => "4kugl2pdqmscqtje"
    # p SecureRandom.base36(24) # => "77tmhrhjfvfdwodq8w7ev2m7"
    def base36(n = T.unsafe(nil)); end

    # SecureRandom.base58 generates a random base58 string.
    #
    # The argument _n_ specifies the length of the random string to be generated.
    #
    # If _n_ is not specified or is +nil+, 16 is assumed. It may be larger in the future.
    #
    # The result may contain alphanumeric characters except 0, O, I and l.
    #
    # p SecureRandom.base58 # => "4kUgL2pdQMSCQtjE"
    # p SecureRandom.base58(24) # => "77TMHrHJFvFDwodq8w7Ev2m7"
    def base58(n = T.unsafe(nil)); end
  end
end

SecureRandom::BASE36_ALPHABET = T.let(T.unsafe(nil), Array)
SecureRandom::BASE58_ALPHABET = T.let(T.unsafe(nil), Array)

module Singleton
  mixes_in_class_methods ::Singleton::SingletonClassMethods

  # Singleton instances are not duplicable:
  #
  # Class.new.include(Singleton).instance.dup # TypeError (can't dup instance of singleton
  def duplicable?; end
end

Singleton::VERSION = T.let(T.unsafe(nil), String)

# String inflections define new methods on the String class to transform names for different purposes.
# For instance, you can figure out the name of a table from the name of a class.
#
# 'ScaleScore'.tableize # => "scale_scores"
class String
  include ::Comparable
  include ::JSON::Ext::Generator::GeneratorMethods::String
  include ::MessagePack::CoreExt
  extend ::JSON::Ext::Generator::GeneratorMethods::String::Extend

  # Enables more predictable duck-typing on String-like classes. See <tt>Object#acts_like?</tt>.
  def acts_like_string?; end

  def as_json(options = T.unsafe(nil)); end

  # If you pass a single integer, returns a substring of one character at that
  # position. The first character of the string is at position 0, the next at
  # position 1, and so on. If a range is supplied, a substring containing
  # characters at offsets given by the range is returned. In both cases, if an
  # offset is negative, it is counted from the end of the string. Returns +nil+
  # if the initial offset falls outside the string. Returns an empty string if
  # the beginning of the range is greater than the end of the string.
  #
  # str = "hello"
  # str.at(0)      # => "h"
  # str.at(1..3)   # => "ell"
  # str.at(-2)     # => "l"
  # str.at(-2..-1) # => "lo"
  # str.at(5)      # => nil
  # str.at(5..-1)  # => ""
  #
  # If a Regexp is given, the matching portion of the string is returned.
  # If a String is given, that given string is returned if it occurs in
  # the string. In both cases, +nil+ is returned if there is no match.
  #
  # str = "hello"
  # str.at(/lo/) # => "lo"
  # str.at(/ol/) # => nil
  # str.at("lo") # => "lo"
  # str.at("ol") # => nil
  def at(position); end

  # A string is blank if it's empty or contains whitespaces only:
  #
  # ''.blank?       # => true
  # '   '.blank?    # => true
  # "\t\n\r".blank? # => true
  # ' blah '.blank? # => false
  #
  # Unicode whitespace is supported:
  #
  # "\u00a0".blank? # => true
  def blank?; end

  # By default, +camelize+ converts strings to UpperCamelCase. If the argument to camelize
  # is set to <tt>:lower</tt> then camelize produces lowerCamelCase.
  #
  # +camelize+ will also convert '/' to '::' which is useful for converting paths to namespaces.
  #
  # 'active_record'.camelize                # => "ActiveRecord"
  # 'active_record'.camelize(:lower)        # => "activeRecord"
  # 'active_record/errors'.camelize         # => "ActiveRecord::Errors"
  # 'active_record/errors'.camelize(:lower) # => "activeRecord::Errors"
  #
  # +camelize+ is also aliased as +camelcase+.
  #
  # See ActiveSupport::Inflector.camelize.
  def camelcase(first_letter = T.unsafe(nil)); end

  # By default, +camelize+ converts strings to UpperCamelCase. If the argument to camelize
  # is set to <tt>:lower</tt> then camelize produces lowerCamelCase.
  #
  # +camelize+ will also convert '/' to '::' which is useful for converting paths to namespaces.
  #
  # 'active_record'.camelize                # => "ActiveRecord"
  # 'active_record'.camelize(:lower)        # => "activeRecord"
  # 'active_record/errors'.camelize         # => "ActiveRecord::Errors"
  # 'active_record/errors'.camelize(:lower) # => "activeRecord::Errors"
  #
  # +camelize+ is also aliased as +camelcase+.
  #
  # See ActiveSupport::Inflector.camelize.
  def camelize(first_letter = T.unsafe(nil)); end

  # Creates a class name from a plural table name like Rails does for table names to models.
  # Note that this returns a string and not a class. (To convert to an actual class
  # follow +classify+ with +constantize+.)
  #
  # 'ham_and_eggs'.classify # => "HamAndEgg"
  # 'posts'.classify        # => "Post"
  #
  # See ActiveSupport::Inflector.classify.
  def classify; end

  # +constantize+ tries to find a declared constant with the name specified
  # in the string. It raises a NameError when the name is not in CamelCase
  # or is not initialized.
  #
  # 'Module'.constantize  # => Module
  # 'Class'.constantize   # => Class
  # 'blargle'.constantize # => NameError: wrong constant name blargle
  #
  # See ActiveSupport::Inflector.constantize.
  def constantize; end

  # Replaces underscores with dashes in the string.
  #
  # 'puni_puni'.dasherize # => "puni-puni"
  #
  # See ActiveSupport::Inflector.dasherize.
  def dasherize; end

  # Removes the rightmost segment from the constant expression in the string.
  #
  # 'Net::HTTP'.deconstantize   # => "Net"
  # '::Net::HTTP'.deconstantize # => "::Net"
  # 'String'.deconstantize      # => ""
  # '::String'.deconstantize    # => ""
  # ''.deconstantize            # => ""
  #
  # See ActiveSupport::Inflector.deconstantize.
  #
  # See also +demodulize+.
  def deconstantize; end

  # Removes the module part from the constant expression in the string.
  #
  # 'ActiveSupport::Inflector::Inflections'.demodulize # => "Inflections"
  # 'Inflections'.demodulize                           # => "Inflections"
  # '::Inflections'.demodulize                         # => "Inflections"
  # ''.demodulize                                      # => ''
  #
  # See ActiveSupport::Inflector.demodulize.
  #
  # See also +deconstantize+.
  def demodulize; end

  # The inverse of <tt>String#include?</tt>. Returns true if the string
  # does not include the other string.
  #
  # "hello".exclude? "lo" # => false
  # "hello".exclude? "ol" # => true
  # "hello".exclude? ?h   # => false
  def exclude?(string); end

  # Returns the first character. If a limit is supplied, returns a substring
  # from the beginning of the string until it reaches the limit value. If the
  # given limit is greater than or equal to the string length, returns a copy of self.
  #
  # str = "hello"
  # str.first    # => "h"
  # str.first(1) # => "h"
  # str.first(2) # => "he"
  # str.first(0) # => ""
  # str.first(6) # => "hello"
  def first(limit = T.unsafe(nil)); end

  # Creates a foreign key name from a class name.
  # +separate_class_name_and_id_with_underscore+ sets whether
  # the method should put '_' between the name and 'id'.
  #
  # 'Message'.foreign_key        # => "message_id"
  # 'Message'.foreign_key(false) # => "messageid"
  # 'Admin::Post'.foreign_key    # => "post_id"
  #
  # See ActiveSupport::Inflector.foreign_key.
  def foreign_key(
    separate_class_name_and_id_with_underscore = T.unsafe(nil)
  ); end

  # Returns a substring from the given position to the end of the string.
  # If the position is negative, it is counted from the end of the string.
  #
  # str = "hello"
  # str.from(0)  # => "hello"
  # str.from(3)  # => "lo"
  # str.from(-2) # => "lo"
  #
  # You can mix it with +to+ method and do fun things like:
  #
  # str = "hello"
  # str.from(0).to(-1) # => "hello"
  # str.from(1).to(-2) # => "ell"
  def from(position); end

  # Marks a string as trusted safe. It will be inserted into HTML with no
  # additional escaping performed. It is your responsibility to ensure that the
  # string contains no malicious content. This method is equivalent to the
  # +raw+ helper in views. It is recommended that you use +sanitize+ instead of
  # this method. It should never be called on user input.
  def html_safe; end

  # Capitalizes the first word, turns underscores into spaces, and (by default)strips a
  # trailing '_id' if present.
  # Like +titleize+, this is meant for creating pretty output.
  #
  # The capitalization of the first word can be turned off by setting the
  # optional parameter +capitalize+ to false.
  # By default, this parameter is true.
  #
  # The trailing '_id' can be kept and capitalized by setting the
  # optional parameter +keep_id_suffix+ to true.
  # By default, this parameter is false.
  #
  # 'employee_salary'.humanize                    # => "Employee salary"
  # 'author_id'.humanize                          # => "Author"
  # 'author_id'.humanize(capitalize: false)       # => "author"
  # '_id'.humanize                                # => "Id"
  # 'author_id'.humanize(keep_id_suffix: true)    # => "Author id"
  #
  # See ActiveSupport::Inflector.humanize.
  def humanize(capitalize: T.unsafe(nil), keep_id_suffix: T.unsafe(nil)); end

  # Converts String to a TimeWithZone in the current zone if Time.zone or Time.zone_default
  # is set, otherwise converts String to a Time via String#to_time
  def in_time_zone(zone = T.unsafe(nil)); end

  # Indents the lines in the receiver:
  #
  # <<EOS.indent(2)
  # def some_method
  # some_code
  # end
  # EOS
  # # =>
  # def some_method
  # some_code
  # end
  #
  # The second argument, +indent_string+, specifies which indent string to
  # use. The default is +nil+, which tells the method to make a guess by
  # peeking at the first indented line, and fallback to a space if there is
  # none.
  #
  # "  foo".indent(2)        # => "    foo"
  # "foo\n\t\tbar".indent(2) # => "\t\tfoo\n\t\t\t\tbar"
  # "foo".indent(2, "\t")    # => "\t\tfoo"
  #
  # While +indent_string+ is typically one space or tab, it may be any string.
  #
  # The third argument, +indent_empty_lines+, is a flag that says whether
  # empty lines should be indented. Default is false.
  #
  # "foo\n\nbar".indent(2)            # => "  foo\n\n  bar"
  # "foo\n\nbar".indent(2, nil, true) # => "  foo\n  \n  bar"
  def indent(
    amount,
    indent_string = T.unsafe(nil),
    indent_empty_lines = T.unsafe(nil)
  ); end

  # Same as +indent+, except it indents the receiver in-place.
  #
  # Returns the indented string, or +nil+ if there was nothing to indent.
  def indent!(
    amount,
    indent_string = T.unsafe(nil),
    indent_empty_lines = T.unsafe(nil)
  ); end

  # Wraps the current string in the <tt>ActiveSupport::StringInquirer</tt> class,
  # which gives you a prettier way to test for equality.
  #
  # env = 'production'.inquiry
  # env.production?  # => true
  # env.development? # => false
  def inquiry; end

  # Returns +true+ if string has utf_8 encoding.
  #
  # utf_8_str = "some string".encode "UTF-8"
  # iso_str = "some string".encode "ISO-8859-1"
  #
  # utf_8_str.is_utf8? # => true
  # iso_str.is_utf8?   # => false
  def is_utf8?; end

  # Returns the last character of the string. If a limit is supplied, returns a substring
  # from the end of the string until it reaches the limit value (counting backwards). If
  # the given limit is greater than or equal to the string length, returns a copy of self.
  #
  # str = "hello"
  # str.last    # => "o"
  # str.last(1) # => "o"
  # str.last(2) # => "lo"
  # str.last(0) # => ""
  # str.last(6) # => "hello"
  def last(limit = T.unsafe(nil)); end

  # == Multibyte proxy
  #
  # +mb_chars+ is a multibyte safe proxy for string methods.
  #
  # It creates and returns an instance of the ActiveSupport::Multibyte::Chars class which
  # encapsulates the original string. A Unicode safe version of all the String methods are defined on this proxy
  # class. If the proxy class doesn't respond to a certain method, it's forwarded to the encapsulated string.
  #
  # >> "ǉ".mb_chars.upcase.to_s
  # => "Ǉ"
  #
  # NOTE: Ruby 2.4 and later support native Unicode case mappings:
  #
  # >> "ǉ".upcase
  # => "Ǉ"
  #
  # == Method chaining
  #
  # All the methods on the Chars proxy which normally return a string will return a Chars object. This allows
  # method chaining on the result of any of these methods.
  #
  # name.mb_chars.reverse.length # => 12
  #
  # == Interoperability and configuration
  #
  # The Chars object tries to be as interchangeable with String objects as possible: sorting and comparing between
  # String and Char work like expected. The bang! methods change the internal string representation in the Chars
  # object. Interoperability problems can be resolved easily with a +to_s+ call.
  #
  # For more information about the methods defined on the Chars proxy see ActiveSupport::Multibyte::Chars. For
  # information about how to change the default Multibyte behavior see ActiveSupport::Multibyte.
  def mb_chars; end

  # Replaces special characters in a string so that it may be used as part of a 'pretty' URL.
  #
  # If the optional parameter +locale+ is specified,
  # the word will be parameterized as a word of that language.
  # By default, this parameter is set to <tt>nil</tt> and it will use
  # the configured <tt>I18n.locale</tt>.
  #
  # class Person
  # def to_param
  # "#{id}-#{name.parameterize}"
  # end
  # end
  #
  # @person = Person.find(1)
  # # => #<Person id: 1, name: "Donald E. Knuth">
  #
  # <%= link_to(@person.name, person_path) %>
  # # => <a href="/person/1-donald-e-knuth">Donald E. Knuth</a>
  #
  # To preserve the case of the characters in a string, use the +preserve_case+ argument.
  #
  # class Person
  # def to_param
  # "#{id}-#{name.parameterize(preserve_case: true)}"
  # end
  # end
  #
  # @person = Person.find(1)
  # # => #<Person id: 1, name: "Donald E. Knuth">
  #
  # <%= link_to(@person.name, person_path) %>
  # # => <a href="/person/1-Donald-E-Knuth">Donald E. Knuth</a>
  #
  # See ActiveSupport::Inflector.parameterize.
  def parameterize(
    separator: T.unsafe(nil),
    preserve_case: T.unsafe(nil),
    locale: T.unsafe(nil)
  ); end

  # Returns the plural form of the word in the string.
  #
  # If the optional parameter +count+ is specified,
  # the singular form will be returned if <tt>count == 1</tt>.
  # For any other value of +count+ the plural will be returned.
  #
  # If the optional parameter +locale+ is specified,
  # the word will be pluralized as a word of that language.
  # By default, this parameter is set to <tt>:en</tt>.
  # You must define your own inflection rules for languages other than English.
  #
  # 'post'.pluralize             # => "posts"
  # 'octopus'.pluralize          # => "octopi"
  # 'sheep'.pluralize            # => "sheep"
  # 'words'.pluralize            # => "words"
  # 'the blue mailman'.pluralize # => "the blue mailmen"
  # 'CamelOctopus'.pluralize     # => "CamelOctopi"
  # 'apple'.pluralize(1)         # => "apple"
  # 'apple'.pluralize(2)         # => "apples"
  # 'ley'.pluralize(:es)         # => "leyes"
  # 'ley'.pluralize(1, :es)      # => "ley"
  #
  # See ActiveSupport::Inflector.pluralize.
  def pluralize(count = T.unsafe(nil), locale = T.unsafe(nil)); end

  # Returns a new string with all occurrences of the patterns removed.
  # str = "foo bar test"
  # str.remove(" test")                 # => "foo bar"
  # str.remove(" test", /bar/)          # => "foo "
  # str                                 # => "foo bar test"
  def remove(*patterns); end

  # Alters the string by removing all occurrences of the patterns.
  # str = "foo bar test"
  # str.remove!(" test", /bar/)         # => "foo "
  # str                                 # => "foo "
  def remove!(*patterns); end

  # +safe_constantize+ tries to find a declared constant with the name specified
  # in the string. It returns +nil+ when the name is not in CamelCase
  # or is not initialized.
  #
  # 'Module'.safe_constantize  # => Module
  # 'Class'.safe_constantize   # => Class
  # 'blargle'.safe_constantize # => nil
  #
  # See ActiveSupport::Inflector.safe_constantize.
  def safe_constantize; end

  # The reverse of +pluralize+, returns the singular form of a word in a string.
  #
  # If the optional parameter +locale+ is specified,
  # the word will be singularized as a word of that language.
  # By default, this parameter is set to <tt>:en</tt>.
  # You must define your own inflection rules for languages other than English.
  #
  # 'posts'.singularize            # => "post"
  # 'octopi'.singularize           # => "octopus"
  # 'sheep'.singularize            # => "sheep"
  # 'word'.singularize             # => "word"
  # 'the blue mailmen'.singularize # => "the blue mailman"
  # 'CamelOctopi'.singularize      # => "CamelOctopus"
  # 'leyes'.singularize(:es)       # => "ley"
  #
  # See ActiveSupport::Inflector.singularize.
  def singularize(locale = T.unsafe(nil)); end

  # Returns the string, first removing all whitespace on both ends of
  # the string, and then changing remaining consecutive whitespace
  # groups into one space each.
  #
  # Note that it handles both ASCII and Unicode whitespace.
  #
  # %{ Multi-line
  # string }.squish                   # => "Multi-line string"
  # " foo   bar    \n   \t   boo".squish # => "foo bar boo"
  def squish; end

  # Performs a destructive squish. See String#squish.
  # str = " foo   bar    \n   \t   boo"
  # str.squish!                         # => "foo bar boo"
  # str                                 # => "foo bar boo"
  def squish!; end

  # Strips indentation in heredocs.
  #
  # For example in
  #
  # if options[:usage]
  # puts <<-USAGE.strip_heredoc
  # This command does such and such.
  #
  # Supported options are:
  # -h         This message
  # ...
  # USAGE
  # end
  #
  # the user would see the usage message aligned against the left margin.
  #
  # Technically, it looks for the least indented non-empty line
  # in the whole string, and removes that amount of leading whitespace.
  def strip_heredoc; end

  # Creates the name of a table like Rails does for models to table names. This method
  # uses the +pluralize+ method on the last word in the string.
  #
  # 'RawScaledScorer'.tableize # => "raw_scaled_scorers"
  # 'ham_and_egg'.tableize     # => "ham_and_eggs"
  # 'fancyCategory'.tableize   # => "fancy_categories"
  #
  # See ActiveSupport::Inflector.tableize.
  def tableize; end

  # Capitalizes all the words and replaces some characters in the string to create
  # a nicer looking title. +titleize+ is meant for creating pretty output. It is not
  # used in the Rails internals.
  #
  # The trailing '_id','Id'.. can be kept and capitalized by setting the
  # optional parameter +keep_id_suffix+ to true.
  # By default, this parameter is false.
  #
  # 'man from the boondocks'.titleize                       # => "Man From The Boondocks"
  # 'x-men: the last stand'.titleize                        # => "X Men: The Last Stand"
  # 'string_ending_with_id'.titleize(keep_id_suffix: true)  # => "String Ending With Id"
  #
  # +titleize+ is also aliased as +titlecase+.
  #
  # See ActiveSupport::Inflector.titleize.
  def titlecase(keep_id_suffix: T.unsafe(nil)); end

  # Capitalizes all the words and replaces some characters in the string to create
  # a nicer looking title. +titleize+ is meant for creating pretty output. It is not
  # used in the Rails internals.
  #
  # The trailing '_id','Id'.. can be kept and capitalized by setting the
  # optional parameter +keep_id_suffix+ to true.
  # By default, this parameter is false.
  #
  # 'man from the boondocks'.titleize                       # => "Man From The Boondocks"
  # 'x-men: the last stand'.titleize                        # => "X Men: The Last Stand"
  # 'string_ending_with_id'.titleize(keep_id_suffix: true)  # => "String Ending With Id"
  #
  # +titleize+ is also aliased as +titlecase+.
  #
  # See ActiveSupport::Inflector.titleize.
  def titleize(keep_id_suffix: T.unsafe(nil)); end

  # Returns a substring from the beginning of the string to the given position.
  # If the position is negative, it is counted from the end of the string.
  #
  # str = "hello"
  # str.to(0)  # => "h"
  # str.to(3)  # => "hell"
  # str.to(-2) # => "hell"
  #
  # You can mix it with +from+ method and do fun things like:
  #
  # str = "hello"
  # str.from(0).to(-1) # => "hello"
  # str.from(1).to(-2) # => "ell"
  def to(position); end

  # Converts a string to a Date value.
  #
  # "1-1-2012".to_date   # => Sun, 01 Jan 2012
  # "01/01/2012".to_date # => Sun, 01 Jan 2012
  # "2012-12-13".to_date # => Thu, 13 Dec 2012
  # "12/13/2012".to_date # => ArgumentError: invalid date
  def to_date; end

  # Converts a string to a DateTime value.
  #
  # "1-1-2012".to_datetime            # => Sun, 01 Jan 2012 00:00:00 +0000
  # "01/01/2012 23:59:59".to_datetime # => Sun, 01 Jan 2012 23:59:59 +0000
  # "2012-12-13 12:50".to_datetime    # => Thu, 13 Dec 2012 12:50:00 +0000
  # "12/13/2012".to_datetime          # => ArgumentError: invalid date
  def to_datetime; end

  # Converts a string to a Time value.
  # The +form+ can be either :utc or :local (default :local).
  #
  # The time is parsed using Time.parse method.
  # If +form+ is :local, then the time is in the system timezone.
  # If the date part is missing then the current date is used and if
  # the time part is missing then it is assumed to be 00:00:00.
  #
  # "13-12-2012".to_time               # => 2012-12-13 00:00:00 +0100
  # "06:12".to_time                    # => 2012-12-13 06:12:00 +0100
  # "2012-12-13 06:12".to_time         # => 2012-12-13 06:12:00 +0100
  # "2012-12-13T06:12".to_time         # => 2012-12-13 06:12:00 +0100
  # "2012-12-13T06:12".to_time(:utc)   # => 2012-12-13 06:12:00 UTC
  # "12/13/2012".to_time               # => ArgumentError: argument out of range
  # "1604326192".to_time               # => ArgumentError: argument out of range
  def to_time(form = T.unsafe(nil)); end

  # Truncates a given +text+ after a given <tt>length</tt> if +text+ is longer than <tt>length</tt>:
  #
  # 'Once upon a time in a world far far away'.truncate(27)
  # # => "Once upon a time in a wo..."
  #
  # Pass a string or regexp <tt>:separator</tt> to truncate +text+ at a natural break:
  #
  # 'Once upon a time in a world far far away'.truncate(27, separator: ' ')
  # # => "Once upon a time in a..."
  #
  # 'Once upon a time in a world far far away'.truncate(27, separator: /\s/)
  # # => "Once upon a time in a..."
  #
  # The last characters will be replaced with the <tt>:omission</tt> string (defaults to "...")
  # for a total length not exceeding <tt>length</tt>:
  #
  # 'And they found that many people were sleeping better.'.truncate(25, omission: '... (continued)')
  # # => "And they f... (continued)"
  def truncate(truncate_at, options = T.unsafe(nil)); end # => 20 # >> "🔪🔪🔪🔪🔪🔪🔪🔪🔪🔪🔪🔪🔪🔪🔪🔪🔪🔪🔪🔪".bytesize # => 80 # >> "🔪🔪🔪🔪🔪🔪🔪🔪🔪🔪🔪🔪🔪🔪🔪🔪🔪🔪🔪🔪".truncate_bytes(20) # => "🔪🔪🔪🔪…" # # The truncated text ends with the <tt>:omission</tt> string, defaulting # to "…", for a total length not exceeding <tt>bytesize</tt>. # Truncates +text+ to at most <tt>bytesize</tt> bytes in length without # breaking string encoding by splitting multibyte characters or breaking # grapheme clusters ("perceptual characters") by truncating at combining # characters. # # >> "🔪🔪🔪🔪🔪🔪🔪🔪🔪🔪🔪🔪🔪🔪🔪🔪🔪🔪🔪🔪".size

  def truncate_bytes(truncate_at, omission: T.unsafe(nil)); end # Truncates a given +text+ after a given number of words (<tt>words_count</tt>): # # 'Once upon a time in a world far far away'.truncate_words(4) # # => "Once upon a time..." # # Pass a string or regexp <tt>:separator</tt> to specify a different separator of words: # # 'Once<br>upon<br>a<br>time<br>in<br>a<br>world'.truncate_words(5, separator: '<br>') # # => "Once<br>upon<br>a<br>time<br>in..." # # The last characters will be replaced with the <tt>:omission</tt> string (defaults to "..."): # # 'And they found that many people were sleeping better.'.truncate_words(5, omission: '... (continued)') # # => "And they found that many... (continued)"

  def truncate_words(words_count, options = T.unsafe(nil)); end # The reverse of +camelize+. Makes an underscored, lowercase form from the expression in the string. # # +underscore+ will also change '::' to '/' to convert namespaces to paths. # # 'ActiveModel'.underscore         # => "active_model" # 'ActiveModel::Errors'.underscore # => "active_model/errors" # See ActiveSupport::Inflector.underscore.

  #
  def underscore; end # Converts just the first character to uppercase. # # 'what a Lovely Day'.upcase_first # => "What a Lovely Day" # 'w'.upcase_first                 # => "W"

  # ''.upcase_first                  # => ""
  #
  # See ActiveSupport::Inflector.upcase_first.
  def upcase_first; end
end

String::BLANK_RE = T.let(T.unsafe(nil), Regexp)
String::ENCODED_BLANKS = T.let(T.unsafe(nil), Concurrent::Map)

class Struct
  include ::Enumerable

  def as_json(options = T.unsafe(nil)); end
end

Struct::Group = Etc::Group
Struct::HTMLElementDescription = Struct
Struct::Passwd = Etc::Passwd

class Symbol
  include ::Comparable
  include ::MessagePack::CoreExt

  def as_json(options = T.unsafe(nil)); end
end

class Time
  include ::Comparable
  include ::DateAndTime::Zones
  include ::DateAndTime::Calculations
  include ::DateAndTime::Compatibility

  def +(other); end # Time#- can also be used to determine the number of seconds between two Time instances. # We're layering on additional behavior so that ActiveSupport::TimeWithZone instances # are coerced into values that Time#- will recognize

  def -(other); end # Layers additional behavior on Time#<=> so that DateTime and ActiveSupport::TimeWithZone instances # can be chronologically compared with a Time

  def <=>(other); end # Duck-types as a Time-like class. See Object#acts_like?.

  def acts_like_time?; end # Uses Date to provide precise Time calculations for years, months, and days # according to the proleptic Gregorian calendar. The +options+ parameter # takes a hash with any of these keys: <tt>:years</tt>, <tt>:months</tt>, # <tt>:weeks</tt>, <tt>:days</tt>, <tt>:hours</tt>, <tt>:minutes</tt>, # <tt>:seconds</tt>. # # Time.new(2015, 8, 1, 14, 35, 0).advance(seconds: 1) # => 2015-08-01 14:35:01 -0700 # Time.new(2015, 8, 1, 14, 35, 0).advance(minutes: 1) # => 2015-08-01 14:36:00 -0700 # Time.new(2015, 8, 1, 14, 35, 0).advance(hours: 1)   # => 2015-08-01 15:35:00 -0700 # Time.new(2015, 8, 1, 14, 35, 0).advance(days: 1)    # => 2015-08-02 14:35:00 -0700 # Time.new(2015, 8, 1, 14, 35, 0).advance(weeks: 1)   # => 2015-08-08 14:35:00 -0700

  def advance(options); end # Returns a new Time representing the time a number of seconds ago, this is basically a wrapper around the Numeric extension

  def ago(seconds); end

  def as_json(options = T.unsafe(nil)); end # Returns a new Time representing the start of the day (0:00)

  def at_beginning_of_day; end # Returns a new Time representing the start of the hour (x:00)

  def at_beginning_of_hour; end # Returns a new Time representing the start of the minute (x:xx:00)

  def at_beginning_of_minute; end # Returns a new Time representing the end of the day, 23:59:59.999999

  def at_end_of_day; end # Returns a new Time representing the end of the hour, x:59:59.999999

  def at_end_of_hour; end # Returns a new Time representing the end of the minute, x:xx:59.999999

  def at_end_of_minute; end # Returns a new Time representing the middle of the day (12:00)

  def at_midday; end # Returns a new Time representing the middle of the day (12:00)

  def at_middle_of_day; end # Returns a new Time representing the start of the day (0:00)

  def at_midnight; end # Returns a new Time representing the middle of the day (12:00)

  def at_noon; end # Returns a new Time representing the start of the day (0:00)

  def beginning_of_day; end # Returns a new Time representing the start of the hour (x:00)

  def beginning_of_hour; end # Returns a new Time representing the start of the minute (x:xx:00)

  def beginning_of_minute; end # No Time is blank: # # Time.now.blank? # => false

  def blank?; end # Returns a new Time where one or more of the elements have been changed according # to the +options+ parameter. The time options (<tt>:hour</tt>, <tt>:min</tt>, # <tt>:sec</tt>, <tt>:usec</tt>, <tt>:nsec</tt>) reset cascadingly, so if only # the hour is passed, then minute, sec, usec and nsec is set to 0. If the hour # and minute is passed, then sec, usec and nsec is set to 0. The +options+ parameter # takes a hash with any of these keys: <tt>:year</tt>, <tt>:month</tt>, <tt>:day</tt>, # <tt>:hour</tt>, <tt>:min</tt>, <tt>:sec</tt>, <tt>:usec</tt>, <tt>:nsec</tt>, # <tt>:offset</tt>. Pass either <tt>:usec</tt> or <tt>:nsec</tt>, not both. # # Time.new(2012, 8, 29, 22, 35, 0).change(day: 1)              # => Time.new(2012, 8, 1, 22, 35, 0) # Time.new(2012, 8, 29, 22, 35, 0).change(year: 1981, day: 1)  # => Time.new(1981, 8, 1, 22, 35, 0) # Time.new(2012, 8, 29, 22, 35, 0).change(year: 1981, hour: 0) # => Time.new(1981, 8, 29, 0, 0, 0)

  def change(options); end # Layers additional behavior on Time#<=> so that DateTime and ActiveSupport::TimeWithZone instances # can be chronologically compared with a Time

  def compare_with_coercion(other); end # Returns a new Time representing the end of the day, 23:59:59.999999

  def end_of_day; end # Returns a new Time representing the end of the hour, x:59:59.999999

  def end_of_hour; end # Returns a new Time representing the end of the minute, x:xx:59.999999

  def end_of_minute; end # Layers additional behavior on Time#eql? so that ActiveSupport::TimeWithZone instances # can be eql? to an equivalent Time

  def eql?(other); end # can be eql? to an equivalent Time # Layers additional behavior on Time#eql? so that ActiveSupport::TimeWithZone instances

  def eql_with_coercion(other); end # Returns a formatted string of the offset from UTC, or an alternative # string if the time zone is already UTC. # # Time.local(2000).formatted_offset        # => "-06:00" # Time.local(2000).formatted_offset(false) # => "-0600"

  def formatted_offset(
    colon = T.unsafe(nil),
    alternate_utc_string = T.unsafe(nil)
  ); end # Returns a new Time representing the time a number of seconds since the instance time

  def in(seconds); end # Returns a new Time representing the middle of the day (12:00)

  def midday; end # Returns a new Time representing the middle of the day (12:00)

  def middle_of_day; end # Returns a new Time representing the start of the day (0:00)

  def midnight; end # Time#- can also be used to determine the number of seconds between two Time instances. # We're layering on additional behavior so that ActiveSupport::TimeWithZone instances # are coerced into values that Time#- will recognize

  def minus_with_coercion(other); end

  def minus_with_duration(other); end
  def minus_without_coercion(other); end # Returns a new time the specified number of days in the future.

  def next_day(days = T.unsafe(nil)); end # Returns a new time the specified number of months in the future.

  def next_month(months = T.unsafe(nil)); end # Returns a new time the specified number of years in the future.

  def next_year(years = T.unsafe(nil)); end # Returns a new Time representing the middle of the day (12:00)

  def noon; end

  def plus_with_duration(other); end # Returns a new time the specified number of days ago.

  def prev_day(days = T.unsafe(nil)); end # Returns a new time the specified number of months ago.

  def prev_month(months = T.unsafe(nil)); end # Returns a new time the specified number of years ago.

  def prev_year(years = T.unsafe(nil)); end # Returns the fraction of a second as a +Rational+ # # Time.new(2012, 8, 29, 0, 0, 0.5).sec_fraction # => (1/2)

  def sec_fraction; end # Returns the number of seconds since 00:00:00. # # Time.new(2012, 8, 29,  0,  0,  0).seconds_since_midnight # => 0.0 # Time.new(2012, 8, 29, 12, 34, 56).seconds_since_midnight # => 45296.0 # Time.new(2012, 8, 29, 23, 59, 59).seconds_since_midnight # => 86399.0

  def seconds_since_midnight; end # Returns the number of seconds until 23:59:59. # # Time.new(2012, 8, 29,  0,  0,  0).seconds_until_end_of_day # => 86399 # Time.new(2012, 8, 29, 12, 34, 56).seconds_until_end_of_day # => 41103 # Time.new(2012, 8, 29, 23, 59, 59).seconds_until_end_of_day # => 0

  def seconds_until_end_of_day; end # Returns a new Time representing the time a number of seconds since the instance time

  def since(seconds); end # Converts to a formatted string. See DATE_FORMATS for built-in formats. # # This method is aliased to <tt>to_fs</tt>. # # time = Time.now                    # => 2007-01-18 06:10:17 -06:00 # # time.to_formatted_s(:time)         # => "06:10" # time.to_fs(:time)                  # => "06:10" # # time.to_formatted_s(:db)           # => "2007-01-18 06:10:17" # time.to_formatted_s(:number)       # => "20070118061017" # time.to_formatted_s(:short)        # => "18 Jan 06:10" # time.to_formatted_s(:long)         # => "January 18, 2007 06:10" # time.to_formatted_s(:long_ordinal) # => "January 18th, 2007 06:10" # time.to_formatted_s(:rfc822)       # => "Thu, 18 Jan 2007 06:10:17 -0600" # time.to_formatted_s(:iso8601)      # => "2007-01-18T06:10:17-06:00" # # == Adding your own time formats to +to_formatted_s+ # You can add your own formats to the Time::DATE_FORMATS hash. # Use the format name as the hash key and either a strftime string # or Proc instance that takes a time argument as the value. # # config/initializers/time_formats.rb # Time::DATE_FORMATS[:month_and_year] = '%B %Y' # Time::DATE_FORMATS[:short_ordinal]  = ->(time) { time.strftime("%B #{time.day.ordinalize}") } #

  def to_formatted_s(format = T.unsafe(nil)); end # Converts to a formatted string. See DATE_FORMATS for built-in formats. # # This method is aliased to <tt>to_fs</tt>. # # time = Time.now                    # => 2007-01-18 06:10:17 -06:00 # # time.to_formatted_s(:time)         # => "06:10" # time.to_fs(:time)                  # => "06:10" # # time.to_formatted_s(:db)           # => "2007-01-18 06:10:17" # time.to_formatted_s(:number)       # => "20070118061017" # time.to_formatted_s(:short)        # => "18 Jan 06:10" # time.to_formatted_s(:long)         # => "January 18, 2007 06:10" # time.to_formatted_s(:long_ordinal) # => "January 18th, 2007 06:10" # time.to_formatted_s(:rfc822)       # => "Thu, 18 Jan 2007 06:10:17 -0600" # time.to_formatted_s(:iso8601)      # => "2007-01-18T06:10:17-06:00" # # == Adding your own time formats to +to_formatted_s+ # You can add your own formats to the Time::DATE_FORMATS hash. # Use the format name as the hash key and either a strftime string # or Proc instance that takes a time argument as the value. # # config/initializers/time_formats.rb # Time::DATE_FORMATS[:month_and_year] = '%B %Y' # Time::DATE_FORMATS[:short_ordinal]  = ->(time) { time.strftime("%B #{time.day.ordinalize}") } #

  def to_fs(format = T.unsafe(nil)); end # def to_s(format = T.unsafe(nil)); end # Either return +self+ or the time in the local system timezone depending # on the setting of +ActiveSupport.to_time_preserves_timezone+.

  def to_time; end

  class << self
    # Overriding case equality method so that it returns true for ActiveSupport::TimeWithZone instances
    def ===(other); end # Layers additional behavior on Time.at so that ActiveSupport::TimeWithZone and DateTime # instances can be used when called with a single argument # def at(*args, **kwargs); end # Layers additional behavior on Time.at so that ActiveSupport::TimeWithZone and DateTime # instances can be used when called with a single argument

    def at_with_coercion(*args, **kwargs); end # Returns <tt>Time.zone.now</tt> when <tt>Time.zone</tt> or <tt>config.time_zone</tt> are set, otherwise just returns <tt>Time.now</tt>.

    def current; end # Returns the number of days in the given month. # If no year is specified, it will use the current year.

    def days_in_month(month, year = T.unsafe(nil)); end # Returns the number of days in the given year. # If no year is specified, it will use the current year.

    def days_in_year(year = T.unsafe(nil)); end # Returns a TimeZone instance matching the time zone provided. # Accepts the time zone in any format supported by <tt>Time.zone=</tt>. # Returns +nil+ for invalid time zones. # # Time.find_zone "America/New_York" # => #<ActiveSupport::TimeZone @name="America/New_York" ...> # Time.find_zone "NOT-A-TIMEZONE"   # => nil

    def find_zone(time_zone); end # Returns a TimeZone instance matching the time zone provided. # Accepts the time zone in any format supported by <tt>Time.zone=</tt>. # Raises an +ArgumentError+ for invalid time zones. # # Time.find_zone! "EST"              # => #<ActiveSupport::TimeZone @name="EST" ...> # Time.find_zone! -5.hours           # => #<ActiveSupport::TimeZone @name="Bogota" ...> # Time.find_zone! nil                # => nil # Time.find_zone! false              # => false # Time.find_zone! "NOT-A-TIMEZONE"   # => ArgumentError: Invalid Timezone: NOT-A-TIMEZONE # Time.find_zone! "America/New_York" # => #<ActiveSupport::TimeZone @name="America/New_York" ...>

    def find_zone!(time_zone); end # Creates a +Time+ instance from an RFC 3339 string. # # # If the time or offset components are missing then an +ArgumentError+ will be raised. # # Time.rfc3339('1999-12-31') # => ArgumentError: invalid date # Time.rfc3339('1999-12-31T14:00:00-10:00') # => 2000-01-01 00:00:00 -1000

    def rfc3339(str); end # Allows override of <tt>Time.zone</tt> locally inside supplied block; # resets <tt>Time.zone</tt> to existing value when done. # class ApplicationController < ActionController::Base # around_action :set_time_zone # # private # # Time.use_zone(current_user.timezone) { yield } # end # # NOTE: This won't affect any <tt>ActiveSupport::TimeWithZone</tt> # objects that have already been created, e.g. any model timestamp # attributes that have been read before the block will remain in # the application's default timezone. # # def set_time_zone # end

    def use_zone(time_zone); end # Returns the TimeZone for the current request, if this has been set (via Time.zone=). # If <tt>Time.zone</tt> has not been set for the current request, returns the TimeZone specified in <tt>config.time_zone</tt>.

    def zone; end # Sets <tt>Time.zone</tt> to a TimeZone object for the current request/thread. # # This method accepts any of the following: # # * An identifier for a Rails TimeZone object (e.g., "Eastern Time (US & Canada)", <tt>-5.hours</tt>). # * A TZInfo::Timezone object. # * An identifier for a TZInfo::Timezone object (e.g., "America/New_York"). # # Here's an example of how you might set <tt>Time.zone</tt> on a per request basis and reset it when the request is done. # <tt>current_user.time_zone</tt> just needs to return a string identifying the user's preferred time zone: # # class ApplicationController < ActionController::Base # around_action :set_time_zone # # def set_time_zone # if logged_in? # Time.use_zone(current_user.time_zone) { yield } # else # yield # end # end # end # * A Rails TimeZone object.

    def zone=(time_zone); end # Returns the value of attribute zone_default.

    def zone_default; end # Sets the attribute zone_default

    def zone_default=(_arg0); end
  end
end

Time::COMMON_YEAR_DAYS_IN_MONTH = T.let(T.unsafe(nil), Array)
Time::DATE_FORMATS = T.let(T.unsafe(nil), Hash)
Time::NOT_SET = T.let(T.unsafe(nil), Object)

class TrueClass
  include ::JSON::Ext::Generator::GeneratorMethods::TrueClass
  include ::MessagePack::CoreExt
  include ::SafeType::BooleanMixin

  def as_json(options = T.unsafe(nil)); end # +true+ is not blank: # # true.blank? # => false

  def blank?; end # Returns +self+.

  def to_param; end
end

class URI::Generic
  include ::URI::RFC2396_REGEXP
  include ::URI

  def as_json(options = T.unsafe(nil)); end
end

class UnboundMethod
  include ::MethodSource::SourceLocation::UnboundMethodExtensions
  include ::MethodSource::MethodExtensions # Unbound methods are not duplicable: # # method(:puts).unbind.duplicable? # => false # method(:puts).unbind.dup         # => TypeError: allocator undefined for UnboundMethod

  def duplicable?; end
end
