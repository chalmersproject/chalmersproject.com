# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `kaminari-actionview` gem.
# Please instead update this file by running `bin/tapioca gem kaminari-actionview`.

module Kaminari
  class << self
    def config; end
    def configure; end

    # Wrap an Array object to make it paginatable
    # ==== Options
    # * <tt>:limit</tt> - limit
    # * <tt>:offset</tt> - offset
    # * <tt>:total_count</tt> - total_count
    # * <tt>:padding</tt> - padding
    def paginate_array(array, limit: T.unsafe(nil), offset: T.unsafe(nil), total_count: T.unsafe(nil), padding: T.unsafe(nil)); end
  end
end

# = Helpers
module Kaminari::ActionViewExtension; end

# Monkey-patching AV::LogSubscriber not to log each render_partial
module Kaminari::ActionViewExtension::LogSubscriberSilencer
  def render_partial(*_arg0); end
end

module Kaminari::Actionview; end
Kaminari::Actionview::VERSION = T.let(T.unsafe(nil), String)
