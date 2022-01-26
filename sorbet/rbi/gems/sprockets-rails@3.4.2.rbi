# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `sprockets-rails` gem.
# Please instead update this file by running `bin/tapioca gem sprockets-rails`.

module Rails
  extend ::ActiveSupport::Autoload
  extend ::ActiveSupport::Benchmarkable

  class << self
    def app_class; end
    def app_class=(_arg0); end
    def application; end
    def application=(_arg0); end
    def autoloaders; end
    def backtrace_cleaner; end
    def cache; end
    def cache=(_arg0); end
    def configuration; end
    def env; end
    def env=(environment); end
    def error; end
    def gem_version; end
    def groups(*groups); end
    def initialize!(*_arg0, &_arg1); end
    def initialized?(*_arg0, &_arg1); end
    def logger; end
    def logger=(_arg0); end
    def public_path; end
    def root; end
    def version; end
  end
end

class Rails::Application < ::Rails::Engine
  def initialize(initial_variable_values = T.unsafe(nil), &block); end

  # Called from asset helpers to alert you if you reference an asset URL that
  # isn't precompiled and hence won't be available in production.
  def asset_precompiled?(logical_path); end

  # Returns Sprockets::Environment for app config.
  def assets; end

  # Returns Sprockets::Environment for app config.
  def assets=(_arg0); end

  # Returns Sprockets::Manifest for app config.
  def assets_manifest; end

  # Returns Sprockets::Manifest for app config.
  def assets_manifest=(_arg0); end

  def autoloaders; end
  def build_middleware_stack; end
  def config; end
  def config=(_arg0); end
  def config_for(name, env: T.unsafe(nil)); end
  def console(&blk); end
  def credentials; end
  def credentials=(_arg0); end
  def default_url_options(*_arg0, &_arg1); end
  def default_url_options=(arg); end
  def eager_load!; end
  def encrypted(path, key_path: T.unsafe(nil), env_key: T.unsafe(nil)); end
  def env_config; end
  def executor; end
  def generators(&blk); end
  def helpers_paths; end
  def initialize!(group = T.unsafe(nil)); end
  def initialized?; end
  def initializer(name, opts = T.unsafe(nil), &block); end
  def initializers; end
  def isolate_namespace(mod); end
  def key_generator; end
  def message_verifier(verifier_name); end
  def migration_railties; end

  # Lazy-load the precompile list so we don't cause asset compilation at app
  # boot time, but ensure we cache the list so we don't recompute it for each
  # request or test case.
  def precompiled_assets(clear_cache = T.unsafe(nil)); end

  def rake_tasks(&block); end
  def reload_routes!; end
  def reloader; end
  def reloaders; end
  def require_environment!; end
  def routes_reloader; end
  def run_load_hooks!; end
  def runner(&blk); end
  def sandbox; end
  def sandbox=(_arg0); end
  def sandbox?; end
  def secret_key_base; end
  def secrets; end
  def secrets=(_arg0); end
  def server(&blk); end
  def to_app; end
  def watchable_args; end

  protected

  def default_middleware_stack; end
  def ordered_railties; end
  def railties_initializers(current); end
  def run_console_blocks(app); end
  def run_generators_blocks(app); end
  def run_runner_blocks(app); end
  def run_server_blocks(app); end
  def run_tasks_blocks(app); end
  def validate_secret_key_base(secret_key_base); end

  private

  def build_middleware; end
  def build_request(env); end
  def coerce_same_site_protection(protection); end
  def generate_development_secret; end

  class << self
    def add_lib_to_load_path!(root); end
    def create(initial_variable_values = T.unsafe(nil), &block); end
    def find_root(from); end
    def inherited(base); end
    def instance; end
  end
end

# Hack: We need to remove Rails' built in config.assets so we can
# do our own thing.
class Rails::Application::Configuration < ::Rails::Engine::Configuration
  def initialize(*_arg0); end

  def add_autoload_paths_to_load_path; end
  def add_autoload_paths_to_load_path=(_arg0); end
  def allow_concurrency; end
  def allow_concurrency=(_arg0); end
  def annotations; end
  def api_only; end
  def api_only=(value); end
  def asset_host; end
  def asset_host=(_arg0); end
  def autoflush_log; end
  def autoflush_log=(_arg0); end
  def beginning_of_week; end
  def beginning_of_week=(_arg0); end
  def cache_classes; end
  def cache_classes=(_arg0); end
  def cache_store; end
  def cache_store=(_arg0); end
  def colorize_logging; end
  def colorize_logging=(val); end
  def consider_all_requests_local; end
  def consider_all_requests_local=(_arg0); end
  def console; end
  def console=(_arg0); end
  def content_security_policy(&block); end
  def content_security_policy_nonce_directives; end
  def content_security_policy_nonce_directives=(_arg0); end
  def content_security_policy_nonce_generator; end
  def content_security_policy_nonce_generator=(_arg0); end
  def content_security_policy_report_only; end
  def content_security_policy_report_only=(_arg0); end
  def credentials; end
  def credentials=(_arg0); end
  def database_configuration; end
  def debug_exception_response_format; end
  def debug_exception_response_format=(_arg0); end
  def default_log_file; end
  def disable_sandbox; end
  def disable_sandbox=(_arg0); end
  def eager_load; end
  def eager_load=(_arg0); end
  def enable_dependency_loading; end
  def enable_dependency_loading=(_arg0); end
  def encoding; end
  def encoding=(value); end
  def exceptions_app; end
  def exceptions_app=(_arg0); end
  def file_watcher; end
  def file_watcher=(_arg0); end
  def filter_parameters; end
  def filter_parameters=(_arg0); end
  def filter_redirect; end
  def filter_redirect=(_arg0); end
  def force_ssl; end
  def force_ssl=(_arg0); end
  def helpers_paths; end
  def helpers_paths=(_arg0); end
  def host_authorization; end
  def host_authorization=(_arg0); end
  def hosts; end
  def hosts=(_arg0); end
  def load_database_yaml; end
  def load_defaults(target_version); end
  def loaded_config_version; end
  def log_formatter; end
  def log_formatter=(_arg0); end
  def log_level; end
  def log_level=(_arg0); end
  def log_tags; end
  def log_tags=(_arg0); end
  def logger; end
  def logger=(_arg0); end
  def paths; end
  def permissions_policy(&block); end
  def public_file_server; end
  def public_file_server=(_arg0); end
  def railties_order; end
  def railties_order=(_arg0); end
  def rake_eager_load; end
  def rake_eager_load=(_arg0); end
  def read_encrypted_secrets; end
  def read_encrypted_secrets=(_arg0); end
  def relative_url_root; end
  def relative_url_root=(_arg0); end
  def reload_classes_only_on_change; end
  def reload_classes_only_on_change=(_arg0); end
  def require_master_key; end
  def require_master_key=(_arg0); end
  def secret_key_base; end
  def secret_key_base=(_arg0); end
  def server_timing; end
  def server_timing=(_arg0); end
  def session_options; end
  def session_options=(_arg0); end
  def session_store(new_session_store = T.unsafe(nil), **options); end
  def session_store?; end
  def ssl_options; end
  def ssl_options=(_arg0); end
  def time_zone; end
  def time_zone=(_arg0); end
  def x; end
  def x=(_arg0); end

  private

  def credentials_available_for_current_env?; end
  def default_credentials_content_path; end
  def default_credentials_key_path; end
end

Rails::Application::INITIAL_VARIABLES = T.let(T.unsafe(nil), Array)

class Rails::Engine < ::Rails::Railtie
  include ::ActiveSupport::Callbacks
  extend ::ActiveSupport::Callbacks::ClassMethods

  def initialize; end

  def __callbacks; end
  def __callbacks?; end
  def _load_seed_callbacks; end
  def _run_load_seed_callbacks(&block); end
  def app; end
  def call(env); end
  def config; end
  def eager_load!; end
  def endpoint; end
  def engine_name(*_arg0, &_arg1); end
  def env_config; end
  def helpers; end
  def helpers_paths; end
  def isolated?(*_arg0, &_arg1); end
  def load_console(app = T.unsafe(nil)); end
  def load_generators(app = T.unsafe(nil)); end
  def load_runner(app = T.unsafe(nil)); end
  def load_seed; end
  def load_server(app = T.unsafe(nil)); end
  def load_tasks(app = T.unsafe(nil)); end
  def middleware(*_arg0, &_arg1); end
  def paths(*_arg0, &_arg1); end
  def railties; end
  def root(*_arg0, &_arg1); end
  def routes(&block); end
  def routes?; end

  protected

  def run_tasks_blocks(*_arg0); end

  private

  def _all_autoload_once_paths; end
  def _all_autoload_paths; end
  def _all_load_paths(add_autoload_paths_to_load_path); end
  def build_middleware; end
  def build_request(env); end
  def default_middleware_stack; end
  def has_migrations?; end
  def load_config_initializer(initializer); end

  class << self
    def __callbacks; end
    def __callbacks=(value); end
    def __callbacks?; end
    def _load_seed_callbacks; end
    def _load_seed_callbacks=(value); end
    def called_from; end
    def called_from=(_arg0); end
    def eager_load!(*_arg0, &_arg1); end
    def endpoint(endpoint = T.unsafe(nil)); end
    def engine_name(name = T.unsafe(nil)); end
    def find(path); end
    def find_root(from); end
    def find_root_with_flag(flag, root_path, default = T.unsafe(nil)); end
    def inherited(base); end
    def isolate_namespace(mod); end
    def isolated; end
    def isolated=(_arg0); end
    def isolated?; end
  end
end

# Define some basic Sprockets error classes
module Sprockets
  extend ::Sprockets::Utils
  extend ::Sprockets::URIUtils
  extend ::Sprockets::PathUtils
  extend ::Sprockets::DigestUtils
  extend ::Sprockets::PathDigestUtils
  extend ::Sprockets::Dependencies
  extend ::Sprockets::Compressing
  extend ::Sprockets::Exporting
  extend ::Sprockets::ProcessorUtils
  extend ::Sprockets::Processing
  extend ::Sprockets::HTTPUtils
  extend ::Sprockets::Transformers
  extend ::Sprockets::Mime
  extend ::Sprockets::Paths
  extend ::Sprockets::Configuration
end

module Sprockets::Rails; end

# Resolve assets referenced in CSS `url()` calls and replace them with the digested paths
class Sprockets::Rails::AssetUrlProcessor
  class << self
    def call(input); end
  end
end

Sprockets::Rails::AssetUrlProcessor::REGEX = T.let(T.unsafe(nil), Regexp)

module Sprockets::Rails::Context
  include ::ActionView::Helpers::AssetUrlHelper
  include ::ActionView::Helpers::CaptureHelper
  include ::ActionView::Helpers::OutputSafetyHelper
  include ::ActionView::Helpers::TagHelper
  include ::ActionView::Helpers::AssetTagHelper
  include GeneratedInstanceMethods

  mixes_in_class_methods GeneratedClassMethods

  def compute_asset_path(path, options = T.unsafe(nil)); end

  class << self
    def included(klass); end
  end

  module GeneratedClassMethods
    def assets_prefix; end
    def assets_prefix=(value); end
    def assets_prefix?; end
    def config; end
    def config=(value); end
    def config?; end
    def digest_assets; end
    def digest_assets=(value); end
    def digest_assets?; end
  end

  module GeneratedInstanceMethods
    def assets_prefix; end
    def assets_prefix=(value); end
    def assets_prefix?; end
    def config; end
    def config=(value); end
    def config?; end
    def digest_assets; end
    def digest_assets=(value); end
    def digest_assets?; end
  end
end

module Sprockets::Rails::Helper
  include ::ActionView::Helpers::AssetUrlHelper
  include ::ActionView::Helpers::CaptureHelper
  include ::ActionView::Helpers::OutputSafetyHelper
  include ::ActionView::Helpers::TagHelper
  include ::ActionView::Helpers::AssetTagHelper
  include ::Sprockets::Rails::Utils
  include GeneratedInstanceMethods

  mixes_in_class_methods GeneratedClassMethods

  # Expand asset path to digested form.
  #
  # path    - String path
  # options - Hash options
  #
  # Returns String path or nil if no asset was found.
  def asset_digest_path(path, options = T.unsafe(nil)); end

  # Experimental: Get integrity for asset path.
  #
  # path    - String path
  # options - Hash options
  #
  # Returns String integrity attribute or nil if no asset was found.
  def asset_integrity(path, options = T.unsafe(nil)); end

  # Writes over the built in ActionView::Helpers::AssetUrlHelper#compute_asset_path
  # to use the asset pipeline.
  def compute_asset_path(path, options = T.unsafe(nil)); end

  # Override javascript tag helper to provide debugging support.
  #
  # Eventually will be deprecated and replaced by source maps.
  def javascript_include_tag(*sources); end

  # Resolve the asset path against the Sprockets manifest or environment.
  # Returns nil if it's an asset we don't know about.
  def resolve_asset_path(path, allow_non_precompiled = T.unsafe(nil)); end

  # Override stylesheet tag helper to provide debugging support.
  #
  # Eventually will be deprecated and replaced by source maps.
  def stylesheet_link_tag(*sources); end

  protected

  # List of resolvers in `config.assets.resolve_with` order.
  def asset_resolver_strategies; end

  # This is awkward: `integrity` is a boolean option indicating whether
  # we want to include or omit the subresource integrity hash, but the
  # options hash is also passed through as literal tag attributes.
  # That means we have to delete the shortcut boolean option so it
  # doesn't bleed into the tag attributes, but also check its value if
  # it's boolean-ish.
  def compute_integrity?(options); end

  # Append ?body=1 if debug is on and we're on old Sprockets.
  def legacy_debug_path(path, debug); end

  # Internal method to support multifile debugging. Will
  # eventually be removed w/ Sprockets 3.x.
  def lookup_debug_asset(path, options = T.unsafe(nil)); end

  # compute_asset_extname is in AV::Helpers::AssetUrlHelper
  def path_with_extname(path, options); end

  # Enable split asset debugging. Eventually will be deprecated
  # and replaced by source maps in Sprockets 3.x.
  def request_debug_assets?; end

  # Try each asset resolver and return the first non-nil result.
  def resolve_asset; end

  # Only serve integrity metadata for HTTPS requests:
  # http://www.w3.org/TR/SRI/#non-secure-contexts-remain-non-secure
  def secure_subresource_integrity_context?; end

  class << self
    def extended(obj); end
    def included(klass); end
  end

  module GeneratedClassMethods
    def assets_environment; end
    def assets_environment=(value); end
    def assets_environment?; end
    def assets_manifest; end
    def assets_manifest=(value); end
    def assets_manifest?; end
    def assets_precompile; end
    def assets_precompile=(value); end
    def assets_precompile?; end
    def assets_prefix; end
    def assets_prefix=(value); end
    def assets_prefix?; end
    def check_precompiled_asset; end
    def check_precompiled_asset=(value); end
    def check_precompiled_asset?; end
    def debug_assets; end
    def debug_assets=(value); end
    def debug_assets?; end
    def digest_assets; end
    def digest_assets=(value); end
    def digest_assets?; end
    def precompiled_asset_checker; end
    def precompiled_asset_checker=(value); end
    def precompiled_asset_checker?; end
    def resolve_assets_with; end
    def resolve_assets_with=(value); end
    def resolve_assets_with?; end
    def unknown_asset_fallback; end
    def unknown_asset_fallback=(value); end
    def unknown_asset_fallback?; end
  end

  module GeneratedInstanceMethods
    def assets_environment; end
    def assets_environment=(value); end
    def assets_environment?; end
    def assets_manifest; end
    def assets_manifest=(value); end
    def assets_manifest?; end
    def assets_precompile; end
    def assets_precompile=(value); end
    def assets_precompile?; end
    def assets_prefix; end
    def assets_prefix=(value); end
    def assets_prefix?; end
    def check_precompiled_asset; end
    def check_precompiled_asset=(value); end
    def check_precompiled_asset?; end
    def debug_assets; end
    def debug_assets=(value); end
    def debug_assets?; end
    def digest_assets; end
    def digest_assets=(value); end
    def digest_assets?; end
    def precompiled_asset_checker; end
    def precompiled_asset_checker=(value); end
    def precompiled_asset_checker?; end
    def resolve_assets_with; end
    def resolve_assets_with=(value); end
    def resolve_assets_with?; end
    def unknown_asset_fallback; end
    def unknown_asset_fallback=(value); end
    def unknown_asset_fallback?; end
  end
end

class Sprockets::Rails::Helper::AssetNotFound < ::StandardError; end
class Sprockets::Rails::Helper::AssetNotPrecompiled < ::StandardError; end

class Sprockets::Rails::Helper::AssetNotPrecompiledError < ::Sprockets::Rails::Helper::AssetNotPrecompiled
  include ::Sprockets::Rails::Utils

  def initialize(source); end
end

Sprockets::Rails::Helper::VIEW_ACCESSORS = T.let(T.unsafe(nil), Array)

# Use a separate module since Helper is mixed in and we needn't pollute
# the class namespace with our internals.
module Sprockets::Rails::HelperAssetResolvers
  class << self
    def [](name); end
  end
end

class Sprockets::Rails::HelperAssetResolvers::Environment
  def initialize(view); end

  def asset_path(path, digest, allow_non_precompiled = T.unsafe(nil)); end
  def digest_path(path, allow_non_precompiled = T.unsafe(nil)); end
  def find_asset(path, options = T.unsafe(nil)); end
  def find_debug_asset(path); end
  def integrity(path); end

  private

  def precompiled?(path); end
  def raise_unless_precompiled_asset(path); end
end

class Sprockets::Rails::HelperAssetResolvers::Manifest
  def initialize(view); end

  def asset_path(path, digest, allow_non_precompiled = T.unsafe(nil)); end
  def digest_path(path, allow_non_precompiled = T.unsafe(nil)); end
  def find_debug_asset(path); end
  def integrity(path); end

  private

  def metadata(path); end
end

class Sprockets::Rails::QuietAssets
  def initialize(app); end

  def call(env); end
end

module Sprockets::Rails::RouteWrapper
  def internal?; end
  def internal_assets_path?; end

  class << self
    def included(klass); end
  end
end

# Rewrites source mapping urls with the digested paths and protect against semicolon appending with a dummy comment line
class Sprockets::Rails::SourcemappingUrlProcessor
  class << self
    def call(input); end

    private

    def combine_sourcemap_logical_path(sourcefile:, sourcemap:); end
    def removed_sourcemap_comment(sourcemap_logical_path, filename:, env:); end
    def resolved_sourcemap_comment(sourcemap_logical_path, context:); end
    def sourcemap_asset_path(sourcemap_logical_path, context:); end
  end
end

Sprockets::Rails::SourcemappingUrlProcessor::REGEX = T.let(T.unsafe(nil), Regexp)

module Sprockets::Rails::Utils
  def using_sprockets4?; end
end

Sprockets::Rails::VERSION = T.let(T.unsafe(nil), String)

class Sprockets::Railtie < ::Rails::Railtie
  include ::Sprockets::Rails::Utils

  def build_environment(app, initialized = T.unsafe(nil)); end

  class << self
    def build_manifest(app); end
  end
end

Sprockets::Railtie::LOOSE_APP_ASSETS = T.let(T.unsafe(nil), Proc)

class Sprockets::Railtie::ManifestNeededError < ::StandardError
  def initialize; end
end

class Sprockets::Railtie::OrderedOptions < ::ActiveSupport::OrderedOptions
  def configure(&block); end
end

Sprockets::VERSION = T.let(T.unsafe(nil), String)
