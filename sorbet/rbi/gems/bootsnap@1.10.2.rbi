# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `bootsnap` gem.
# Please instead update this file by running `bin/tapioca gem bootsnap`.

module Bootsnap
  extend ::Bootsnap

  def bundler?; end

  private

  def instrumentation_enabled=(_arg0); end

  class << self
    def _instrument(event, path); end
    def absolute_path?(path); end
    def default_setup; end
    def instrumentation=(callback); end
    def instrumentation_enabled=(_arg0); end
    def iseq_cache_supported?; end
    def log!; end

    # Returns the value of attribute logger.
    def logger; end

    def logger=(logger); end
    def setup(cache_dir:, development_mode: T.unsafe(nil), load_path_cache: T.unsafe(nil), autoload_paths_cache: T.unsafe(nil), disable_trace: T.unsafe(nil), compile_cache_iseq: T.unsafe(nil), compile_cache_yaml: T.unsafe(nil), compile_cache_json: T.unsafe(nil)); end
  end
end

module Bootsnap::CompileCache
  class << self
    def permission_error(path); end
    def setup(cache_dir:, iseq:, yaml:, json:); end
    def supported?; end
  end
end

class Bootsnap::CompileCache::Error < ::StandardError; end

module Bootsnap::CompileCache::ISeq
  class << self
    # Returns the value of attribute cache_dir.
    def cache_dir; end

    def cache_dir=(cache_dir); end
    def compile_option_updated; end
    def fetch(path, cache_dir: T.unsafe(nil)); end
    def input_to_output(_data, _kwargs); end
    def input_to_storage(_, path); end
    def install!(cache_dir); end
    def precompile(path); end
    def storage_to_output(binary, _args); end
  end
end

module Bootsnap::CompileCache::ISeq::InstructionSequenceMixin
  def compile_option=(hash); end
  def load_iseq(path); end
end

module Bootsnap::CompileCache::JSON
  class << self
    # Returns the value of attribute cache_dir.
    def cache_dir; end

    def cache_dir=(cache_dir); end
    def init!; end
    def input_to_output(data, kwargs); end
    def input_to_storage(payload, _); end
    def install!(cache_dir); end

    # Returns the value of attribute msgpack_factory.
    def msgpack_factory; end

    # Sets the attribute msgpack_factory
    def msgpack_factory=(_arg0); end

    def precompile(path); end
    def storage_to_output(data, kwargs); end

    # Returns the value of attribute supported_options.
    def supported_options; end

    # Sets the attribute supported_options
    def supported_options=(_arg0); end
  end
end

module Bootsnap::CompileCache::JSON::Patch
  def load_file(path, *args); end
end

module Bootsnap::CompileCache::Native
  private

  def compile_option_crc32=(_arg0); end
  def coverage_running?; end
  def fetch(_arg0, _arg1, _arg2, _arg3); end
  def precompile(_arg0, _arg1, _arg2); end

  class << self
    def compile_option_crc32=(_arg0); end
    def coverage_running?; end
    def fetch(_arg0, _arg1, _arg2, _arg3); end
    def precompile(_arg0, _arg1, _arg2); end
  end
end

class Bootsnap::CompileCache::PermissionError < ::Bootsnap::CompileCache::Error; end
Bootsnap::CompileCache::UNCOMPILABLE = T.let(T.unsafe(nil), BasicObject)

module Bootsnap::CompileCache::YAML
  class << self
    # Returns the value of attribute cache_dir.
    def cache_dir; end

    def cache_dir=(cache_dir); end

    # Returns the value of attribute implementation.
    def implementation; end

    def init!; end
    def install!(cache_dir); end

    # Returns the value of attribute msgpack_factory.
    def msgpack_factory; end

    # Sets the attribute msgpack_factory
    def msgpack_factory=(_arg0); end

    def patch; end
    def precompile(path); end
    def strict_load(payload); end
    def strict_visitor; end

    # Returns the value of attribute supported_options.
    def supported_options; end

    # Sets the attribute supported_options
    def supported_options=(_arg0); end
  end
end

module Bootsnap::CompileCache::YAML::Psych3
  extend ::Bootsnap::CompileCache::YAML::Psych3

  def input_to_output(data, kwargs); end
  def input_to_storage(contents, _); end
  def storage_to_output(data, kwargs); end
end

module Bootsnap::CompileCache::YAML::Psych3::Patch
  def load_file(path, *args); end
  def unsafe_load_file(path, *args); end
end

module Bootsnap::CompileCache::YAML::Psych4
  extend ::Bootsnap::CompileCache::YAML::Psych4

  def input_to_storage(contents, _); end
end

module Bootsnap::CompileCache::YAML::Psych4::Patch
  def load_file(path, *args); end
  def unsafe_load_file(path, *args); end
end

module Bootsnap::CompileCache::YAML::Psych4::SafeLoad
  extend ::Bootsnap::CompileCache::YAML::Psych4::SafeLoad

  def input_to_output(data, kwargs); end
  def input_to_storage(contents, _); end
  def storage_to_output(data, kwargs); end
end

module Bootsnap::CompileCache::YAML::Psych4::UnsafeLoad
  extend ::Bootsnap::CompileCache::YAML::Psych4::UnsafeLoad

  def input_to_output(data, kwargs); end
  def input_to_storage(contents, _); end
  def storage_to_output(data, kwargs); end
end

class Bootsnap::CompileCache::YAML::UnsupportedTags < ::StandardError; end

module Bootsnap::ExplicitRequire
  class << self
    def from_archdir(feature); end
    def from_rubylibdir(feature); end
    def from_self(feature); end

    # Given a set of gems, run a block with the LOAD_PATH narrowed to include
    # only core ruby source paths and these gems -- that is, roughly,
    # temporarily remove all gems not listed in this call from the LOAD_PATH.
    #
    # This is useful before bootsnap is fully-initialized to load gems that it
    # depends on, without forcing full LOAD_PATH traversals.
    def with_gems(*gems); end
  end
end

Bootsnap::ExplicitRequire::ARCHDIR = T.let(T.unsafe(nil), String)
Bootsnap::ExplicitRequire::DLEXT = T.let(T.unsafe(nil), String)
Bootsnap::ExplicitRequire::RUBYLIBDIR = T.let(T.unsafe(nil), String)
class Bootsnap::InvalidConfiguration < ::StandardError; end

module Bootsnap::LoadPathCache
  class << self
    # Returns the value of attribute load_path_cache.
    def load_path_cache; end

    # Returns the value of attribute loaded_features_index.
    def loaded_features_index; end

    # Returns the value of attribute realpath_cache.
    def realpath_cache; end

    def setup(cache_path:, development_mode:); end
    def supported?; end
  end
end

Bootsnap::LoadPathCache::CACHED_EXTENSIONS = T.let(T.unsafe(nil), Array)

class Bootsnap::LoadPathCache::Cache
  def initialize(store, path_obj, development_mode: T.unsafe(nil)); end

  # Try to resolve this feature to an absolute path without traversing the
  # loadpath.
  def find(feature, try_extensions: T.unsafe(nil)); end

  # What is the path item that contains the dir as child?
  # e.g. given "/a/b/c/d" exists, and the path is ["/a/b"], load_dir("c/d")
  # is "/a/b".
  def load_dir(dir); end

  def push_paths(sender, *paths); end
  def reinitialize(path_obj = T.unsafe(nil)); end
  def unshift_paths(sender, *paths); end

  private

  def dir_changed?; end
  def expand_path(feature); end
  def maybe_append_extension(feature); end
  def now; end
  def push_paths_locked(*paths); end
  def search_index(feature, try_extensions: T.unsafe(nil)); end
  def stale?; end
  def try_ext(feature); end
  def try_index(feature); end
  def unshift_paths_locked(*paths); end
end

# seconds
Bootsnap::LoadPathCache::Cache::AGE_THRESHOLD = T.let(T.unsafe(nil), Integer)

# { 'enumerator' => nil, 'enumerator.so' => nil, ... }
Bootsnap::LoadPathCache::Cache::BUILTIN_FEATURES = T.let(T.unsafe(nil), Hash)

module Bootsnap::LoadPathCache::ChangeObserver
  class << self
    def register(observer, arr); end
  end
end

module Bootsnap::LoadPathCache::ChangeObserver::ArrayMixin
  # For each method that adds items to one end or another of the array
  # (<<, push, unshift, concat), override that method to also notify the
  # observer of the change.
  def <<(entry); end

  def []=(*args, &block); end
  def append(*entries); end
  def clear(*args, &block); end
  def collect!(*args, &block); end
  def compact!(*args, &block); end
  def concat(entries); end
  def delete(*args, &block); end
  def delete_at(*args, &block); end
  def delete_if(*args, &block); end
  def fill(*args, &block); end
  def flatten!(*args, &block); end
  def insert(*args, &block); end
  def keep_if(*args, &block); end
  def map!(*args, &block); end
  def pop(*args, &block); end
  def prepend(*entries); end
  def push(*entries); end
  def reject!(*args, &block); end
  def replace(*args, &block); end
  def reverse!(*args, &block); end
  def rotate!(*args, &block); end
  def select!(*args, &block); end
  def shift(*args, &block); end
  def shuffle!(*args, &block); end
  def slice!(*args, &block); end
  def sort!(*args, &block); end
  def sort_by!(*args, &block); end

  # uniq! keeps the first occurrence of each path, otherwise preserving
  # order, preserving the effective load path
  def uniq!(*args); end

  def unshift(*entries); end
end

Bootsnap::LoadPathCache::DLEXT = T.let(T.unsafe(nil), String)
Bootsnap::LoadPathCache::DL_EXTENSIONS = T.let(T.unsafe(nil), Array)
Bootsnap::LoadPathCache::DOT_RB = T.let(T.unsafe(nil), String)
Bootsnap::LoadPathCache::DOT_SO = T.let(T.unsafe(nil), String)
Bootsnap::LoadPathCache::FALLBACK_SCAN = T.let(T.unsafe(nil), BasicObject)

# LoadedFeaturesIndex partially mirrors an internal structure in ruby that
# we can't easily obtain an interface to.
#
# This works around an issue where, without bootsnap, *ruby* knows that it
# has already required a file by its short name (e.g. require 'bundler') if
# a new instance of bundler is added to the $LOAD_PATH which resolves to a
# different absolute path. This class makes bootsnap smart enough to
# realize that it has already loaded 'bundler', and not just
# '/path/to/bundler'.
#
# If you disable LoadedFeaturesIndex, you can see the problem this solves by:
#
# 1. `require 'a'`
# 2. Prepend a new $LOAD_PATH element containing an `a.rb`
# 3. `require 'a'`
#
# Ruby returns false from step 3.
# With bootsnap but with no LoadedFeaturesIndex, this loads two different
# `a.rb`s.
# With bootsnap and with LoadedFeaturesIndex, this skips the second load,
# returning false like ruby.
class Bootsnap::LoadPathCache::LoadedFeaturesIndex
  def initialize; end

  def cursor(short); end
  def identify(short, cursor); end
  def key?(feature); end

  # We've optimized for initialize and register to be fast, and purge to be tolerable.
  # If access patterns make this not-okay, we can lazy-invert the LFI on
  # first purge and work from there.
  def purge(feature); end

  def purge_multi(features); end

  # There is a relatively uncommon case where we could miss adding an
  # entry:
  #
  # If the user asked for e.g. `require 'bundler'`, and we went through the
  # `FALLBACK_SCAN` pathway in `kernel_require.rb` and therefore did not
  # pass `long` (the full expanded absolute path), then we did are not able
  # to confidently add the `bundler.rb` form to @lfi.
  #
  # We could either:
  #
  # 1. Just add `bundler.rb`, `bundler.so`, and so on, which is close but
  # not quite right; or
  # 2. Inspect $LOADED_FEATURES upon return from yield to find the matching
  # entry.
  def register(short, long); end

  private

  # Might Ruby automatically search for this extension if
  # someone tries to 'require' the file without it? E.g. Ruby
  # will implicitly try 'x.rb' if you ask for 'x'.
  #
  # This is complex and platform-dependent, and the Ruby docs are a little
  # handwavy about what will be tried when and in what order.
  # So optimistically pretend that all known elidable extensions
  # will be tried on all platforms, and that people are unlikely
  # to name files in a way that assumes otherwise.
  # (E.g. It's unlikely that someone will know that their code
  # will _never_ run on MacOS, and therefore think they can get away
  # with calling a Ruby file 'x.dylib.rb' and then requiring it as 'x.dylib'.)
  #
  # See <https://ruby-doc.org/core-2.6.4/Kernel.html#method-i-require>.
  def extension_elidable?(feature); end

  def strip_extension_if_elidable(feature); end
end

Bootsnap::LoadPathCache::LoadedFeaturesIndex::STRIP_EXTENSION = T.let(T.unsafe(nil), Regexp)

class Bootsnap::LoadPathCache::Path
  def initialize(path); end

  # Return a list of all the requirable files and all of the subdirectories
  # of this +Path+.
  def entries_and_dirs(store); end

  def expanded_path; end

  # True if the path exists, but represents a non-directory object
  def non_directory?; end

  # Returns the value of attribute path.
  def path; end

  def relative?; end

  # A path is considered 'stable' if it is part of a Gem.path or the ruby
  # distribution. When adding or removing files in these paths, the cache
  # must be cleared before the change will be noticed.
  def stable?; end

  # A path is considered volatile if it doesn't live under a Gem.path or
  # the ruby distribution root. These paths are scanned for new additions
  # more frequently.
  def volatile?; end

  private

  # last time a directory was modified in this subtree. +dirs+ should be a
  # list of relative paths to directories under +path+. e.g. for /a/b and
  # /a/b/c, pass ('/a/b', ['c'])
  def latest_mtime(path, dirs); end

  # (expensive) returns [entries, dirs]
  def scan!; end

  def stability; end
end

# Built-in ruby lib stuff doesn't change, but things can occasionally be
# installed into sitedir, which generally lives under libdir.
Bootsnap::LoadPathCache::Path::RUBY_LIBDIR = T.let(T.unsafe(nil), String)

Bootsnap::LoadPathCache::Path::RUBY_SITEDIR = T.let(T.unsafe(nil), String)

# a Path can be either stable of volatile, depending on how frequently we
# expect its contents may change. Stable paths aren't rescanned nearly as
# often.
Bootsnap::LoadPathCache::Path::STABLE = T.let(T.unsafe(nil), Symbol)

Bootsnap::LoadPathCache::Path::VOLATILE = T.let(T.unsafe(nil), Symbol)

module Bootsnap::LoadPathCache::PathScanner
  class << self
    def call(path); end
    def os_path(path); end
    def walk(absolute_dir_path, relative_dir_path, &block); end
  end
end

Bootsnap::LoadPathCache::PathScanner::ALTERNATIVE_NATIVE_EXTENSIONS_PATTERN = T.let(T.unsafe(nil), Regexp)
Bootsnap::LoadPathCache::PathScanner::BUNDLE_PATH = T.let(T.unsafe(nil), String)
Bootsnap::LoadPathCache::PathScanner::REQUIRABLE_EXTENSIONS = T.let(T.unsafe(nil), Array)

class Bootsnap::LoadPathCache::RealpathCache
  def initialize; end

  def call(*key); end

  private

  def find_file(name); end
  def realpath(caller_location, path); end
end

Bootsnap::LoadPathCache::SLASH = T.let(T.unsafe(nil), String)

class Bootsnap::LoadPathCache::Store
  def initialize(store_path); end

  def fetch(key); end
  def get(key); end
  def set(key, value); end
  def transaction; end

  private

  def commit_transaction; end
  def default_data; end
  def dump_data; end
  def load_data; end
end

Bootsnap::LoadPathCache::Store::CURRENT_VERSION = T.let(T.unsafe(nil), String)
class Bootsnap::LoadPathCache::Store::NestedTransactionError < ::StandardError; end
class Bootsnap::LoadPathCache::Store::SetOutsideTransactionNotAllowed < ::StandardError; end
Bootsnap::LoadPathCache::Store::VERSION_KEY = T.let(T.unsafe(nil), String)
Bootsnap::VERSION = T.let(T.unsafe(nil), String)

module Kernel
  private

  def load(path, wrap = T.unsafe(nil)); end
  def require_relative(path); end
  def zeitwerk_original_require(path); end

  class << self
    def load(path, wrap = T.unsafe(nil)); end
    def require_relative(path); end
  end
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

  def autoload(const, path); end
end

Module::DELEGATION_RESERVED_KEYWORDS = T.let(T.unsafe(nil), Array)
Module::DELEGATION_RESERVED_METHOD_NAMES = T.let(T.unsafe(nil), Set)
Module::RUBY_RESERVED_KEYWORDS = T.let(T.unsafe(nil), Array)
