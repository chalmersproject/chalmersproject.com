# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `promise.rb` gem.
# Please instead update this file by running `bin/tapioca gem promise.rb`.

class Promise
  include ::Promise::Progress
  include ::Promise::Observer

  def initialize; end

  def catch(&block); end
  def fulfill(value = T.unsafe(nil)); end
  def fulfilled?; end
  def pending?; end

  # Returns the value of attribute reason.
  def reason; end

  def reject(reason = T.unsafe(nil)); end
  def rejected?; end
  def rescue(&block); end

  # Returns the value of attribute source.
  def source; end

  # Sets the attribute source
  def source=(_arg0); end

  # Returns the value of attribute state.
  def state; end

  # Subscribe the given `observer` for status changes of a `Promise`.
  #
  # The observer will be notified about state changes of the promise
  # by calls to its `#promise_fulfilled` or `#promise_rejected` methods.
  #
  # These methods will be called with two arguments,
  # the first being the observed `Promise`, the second being the
  # `on_fulfill_arg` or `on_reject_arg` given to `#subscribe`.
  def subscribe(observer, on_fulfill_arg, on_reject_arg); end

  def sync; end
  def then(on_fulfill = T.unsafe(nil), on_reject = T.unsafe(nil), &block); end

  # Returns the value of attribute value.
  def value; end

  # Override to support sync on a promise without a source or to wait
  # for deferred callbacks on the source
  def wait; end

  protected

  # Override to defer calling the callback for Promises/A+ spec compliance
  def defer; end

  def promise_fulfilled(value, on_fulfill); end
  def promise_rejected(reason, on_reject); end

  private

  def notify_fulfillment; end
  def notify_rejection; end
  def reason_coercion(reason); end
  def settle_from_handler(value); end

  class << self
    def all(enumerable); end
    def map_value(obj); end
    def resolve(obj = T.unsafe(nil)); end
    def sync(obj); end
  end
end

class Promise::BrokenError < ::Promise::Error; end
class Promise::Error < ::RuntimeError; end

class Promise::Group
  include ::Promise::Observer

  def initialize(result_promise, inputs); end

  # Returns the value of attribute promise.
  def promise; end

  def promise_fulfilled(_value = T.unsafe(nil), _arg = T.unsafe(nil)); end
  def promise_rejected(reason, _arg = T.unsafe(nil)); end

  # Returns the value of attribute source.
  def source; end

  # Sets the attribute source
  def source=(_arg0); end

  def wait; end

  private

  def chain_inputs; end
  def count_promises; end
  def each_promise; end
  def promise?(obj); end
end

# The `Promise::Observer` module allows an object to be
# notified of `Promise` state changes.
#
# See `Promise#subscribe`.
module Promise::Observer
  def promise_fulfilled(_value, _on_fulfill_arg); end
  def promise_rejected(_reason, _on_reject_arg); end
end

module Promise::Progress
  def on_progress(&block); end
  def progress(status); end
end

Promise::VERSION = T.let(T.unsafe(nil), String)
