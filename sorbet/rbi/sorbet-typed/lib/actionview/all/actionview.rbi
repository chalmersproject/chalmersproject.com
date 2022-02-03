# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi sorbet-typed
#
# If you would like to make changes to this file, great! Please upstream any changes you make here:
#
#   https://github.com/sorbet/sorbet-typed/edit/master/lib/actionview/all/actionview.rbi
#
# typed: strong

module ActionView
  class ActionViewError < StandardError; end
  class EncodingError < StandardError; end
  class WrongEncodingError < EncodingError; end

  class MissingTemplate < ActionViewError
    sig { returns(String) }
    def path; end
  end

  class Template
    class Error < ActionViewError; end
  end

  TemplateError = T.type_alias {Template::Error}

  class SyntaxErrorInTemplate < Template::Error; end
end


ActionView::Base::NULL = T.let(T.unsafe(nil), Object)

ActionView::Helpers::AssetUrlHelper::ASSET_EXTENSIONS = T.let(T.unsafe(nil), T::Hash[T.untyped, T.untyped])

ActionView::Helpers::AssetUrlHelper::ASSET_PUBLIC_DIRECTORIES = T.let(T.unsafe(nil), T::Hash[T.untyped, T.untyped])

ActionView::Helpers::AssetUrlHelper::URI_REGEXP = T.let(T.unsafe(nil), Regexp)

ActionView::Helpers::AtomFeedHelper::AtomBuilder::XHTML_TAG_NAMES = T.let(T.unsafe(nil), T::Set[T.untyped])

ActionView::Helpers::ControllerHelper::CONTROLLER_DELEGATES = T.let(T.unsafe(nil), T::Array[T.untyped])

ActionView::Helpers::DateHelper::MINUTES_IN_QUARTER_YEAR = T.let(T.unsafe(nil), Integer)

ActionView::Helpers::DateHelper::MINUTES_IN_THREE_QUARTERS_YEAR = T.let(T.unsafe(nil), Integer)

ActionView::Helpers::DateHelper::MINUTES_IN_YEAR = T.let(T.unsafe(nil), Integer)

ActionView::Helpers::DateTimeSelector::AMPM_TRANSLATION = T.let(T.unsafe(nil), T::Hash[T.untyped, T.untyped])

ActionView::Helpers::DateTimeSelector::DEFAULT_PREFIX = T.let(T.unsafe(nil), String)

ActionView::Helpers::DateTimeSelector::POSITION = T.let(T.unsafe(nil), T::Hash[T.untyped, T.untyped])

ActionView::Helpers::JavaScriptHelper::JS_ESCAPE_MAP = T.let(T.unsafe(nil), T::Hash[T.untyped, T.untyped])

class ActionView::Helpers::FormBuilder
  sig { returns(T.untyped) }
  def object; end
end

module ActionView::Helpers::NumberHelper
  # These will return nil if given nil and a string otherwise. Ideally we'd be able to encode
  # that via sig overload but that's only supported for ruby stdlib.

  sig { params(number: T.untyped, options: T::Hash[T.untyped, T.untyped]).returns(T.nilable(String)) }
  def number_to_currency(number, options = T.unsafe(nil)); end

  sig { params(number: T.untyped, options: T::Hash[T.untyped, T.untyped]).returns(T.nilable(String)) }
  def number_to_human(number, options = T.unsafe(nil)); end

  sig { params(number: T.untyped, options: T::Hash[T.untyped, T.untyped]).returns(T.nilable(String)) }
  def number_to_human_size(number, options = T.unsafe(nil)); end

  sig { params(number: T.untyped, options: T::Hash[T.untyped, T.untyped]).returns(T.nilable(String)) }
  def number_to_percentage(number, options = T.unsafe(nil)); end

  sig { params(number: T.untyped, options: T::Hash[T.untyped, T.untyped]).returns(T.nilable(String)) }
  def number_to_phone(number, options = T.unsafe(nil)); end

  sig { params(number: T.untyped, options: T::Hash[T.untyped, T.untyped]).returns(T.nilable(String)) }
  def number_with_delimiter(number, options = T.unsafe(nil)); end

  sig { params(number: T.untyped, options: T::Hash[T.untyped, T.untyped]).returns(T.nilable(String)) }
  def number_with_precision(number, options = T.unsafe(nil)); end
end

module ActionView::Helpers::SanitizeHelper
  mixes_in_class_methods(::ActionView::Helpers::SanitizeHelper::ClassMethods)
end

module ActionView::Helpers::SanitizeHelper::ClassMethods; end

ActionView::Helpers::TagHelper::BOOLEAN_ATTRIBUTES = T.let(T.unsafe(nil), T::Array[T.untyped])

ActionView::Helpers::TagHelper::PRE_CONTENT_STRINGS = T.let(T.unsafe(nil), T::Hash[T.untyped, T.untyped])

ActionView::Helpers::TagHelper::TAG_PREFIXES = T.let(T.unsafe(nil), T::Array[T.untyped])

ActionView::Helpers::TagHelper::TagBuilder::VOID_ELEMENTS = T.let(T.unsafe(nil), T::Array[T.untyped])

# Provides a set of methods for making links and getting URLs that
# depend on the routing subsystem (see ActionDispatch::Routing).
# This allows you to use the same format for links in views
# and controllers.
module ActionView::Helpers::UrlHelper
  extend(::ActiveSupport::Concern)

  include(::ActionView::Helpers::TagHelper)

  mixes_in_class_methods(::ActionView::Helpers::UrlHelper::ClassMethods)

  # True if the current request URI was generated by the given `options`.
  #
  # #### Examples
  # Let's say we're in the `http://www.example.com/shop/checkout?order=desc&page=1` action.
  #
  # ```ruby
  # current_page?(action: 'process')
  # # => false
  #
  # current_page?(action: 'checkout')
  # # => true
  #
  # current_page?(controller: 'library', action: 'checkout')
  # # => false
  #
  # current_page?(controller: 'shop', action: 'checkout')
  # # => true
  #
  # current_page?(controller: 'shop', action: 'checkout', order: 'asc')
  # # => false
  #
  # current_page?(controller: 'shop', action: 'checkout', order: 'desc', page: '1')
  # # => true
  #
  # current_page?(controller: 'shop', action: 'checkout', order: 'desc', page: '2')
  # # => false
  #
  # current_page?('http://www.example.com/shop/checkout')
  # # => true
  #
  # current_page?('http://www.example.com/shop/checkout', check_parameters: true)
  # # => false
  #
  # current_page?('/shop/checkout')
  # # => true
  #
  # current_page?('http://www.example.com/shop/checkout?order=desc&page=1')
  # # => true
  # ```
  #
  # Let's say we're in the `http://www.example.com/products` action with method POST in case of invalid product.
  #
  # ```ruby
  # current_page?(controller: 'product', action: 'index')
  # # => false
  # ```
  #
  # We can also pass in the symbol arguments instead of strings.
  sig { params(options: T.untyped, check_parameters: T::Boolean).returns(T::Boolean) }
  def current_page?(options, check_parameters: false); end

  # Creates an anchor element of the given `name` using a URL created by the set of `options`.
  # See the valid options in the documentation for `url_for`. It's also possible to
  # pass a String instead of an options hash, which generates an anchor element that uses the
  # value of the String as the href for the link. Using a `:back` Symbol instead
  # of an options hash will generate a link to the referrer (a JavaScript back link
  # will be used in place of a referrer if none exists). If `nil` is passed as the name
  # the value of the link itself will become the name.
  #
  # #### Signatures
  #
  # ```ruby
  # link_to(body, url, html_options = {})
  #   # url is a String; you can use URL helpers like
  #   # posts_path
  #
  # link_to(body, url_options = {}, html_options = {})
  #   # url_options, except :method, is passed to url_for
  #
  # link_to(options = {}, html_options = {}) do
  #   # name
  # end
  #
  # link_to(url, html_options = {}) do
  #   # name
  # end
  # ```
  #
  # #### Options
  # * `:data` - This option can be used to add custom data attributes.
  # * `method: symbol of HTTP verb` - This modifier will dynamically
  #   create an HTML form and immediately submit the form for processing using
  #   the HTTP verb specified. Useful for having links perform a POST operation
  #   in dangerous actions like deleting a record (which search bots can follow
  #   while spidering your site). Supported verbs are `:post`, `:delete`, `:patch`, and `:put`.
  #   Note that if the user has JavaScript disabled, the request will fall back
  #   to using GET. If `href: '#'` is used and the user has JavaScript
  #   disabled clicking the link will have no effect. If you are relying on the
  #   POST behavior, you should check for it in your controller's action by using
  #   the request object's methods for `post?`, `delete?`, `patch?`, or `put?`.
  # * `remote: true` - This will allow the unobtrusive JavaScript
  #   driver to make an Ajax request to the URL in question instead of following
  #   the link. The drivers each provide mechanisms for listening for the
  #   completion of the Ajax request and performing JavaScript operations once
  #   they're complete
  #
  # #### Data attributes
  #
  # * `confirm: 'question?'` - This will allow the unobtrusive JavaScript
  #   driver to prompt with the question specified (in this case, the
  #   resulting text would be `question?`. If the user accepts, the
  #   link is processed normally, otherwise no action is taken.
  # * `:disable_with` - Value of this parameter will be used as the
  #   name for a disabled version of the link. This feature is provided by
  #   the unobtrusive JavaScript driver.
  #
  # #### Examples
  # Because it relies on `url_for`, `link_to` supports both older-style controller/action/id arguments
  # and newer RESTful routes. Current Rails style favors RESTful routes whenever possible, so base
  # your application on resources and use
  #
  # ```ruby
  # link_to "Profile", profile_path(@profile)
  # # => <a href="/profiles/1">Profile</a>
  # ```
  #
  # or the even pithier
  #
  # ```ruby
  # link_to "Profile", @profile
  # # => <a href="/profiles/1">Profile</a>
  # ```
  #
  # in place of the older more verbose, non-resource-oriented
  #
  # ```ruby
  # link_to "Profile", controller: "profiles", action: "show", id: @profile
  # # => <a href="/profiles/show/1">Profile</a>
  # ```
  #
  # Similarly,
  #
  # ```ruby
  # link_to "Profiles", profiles_path
  # # => <a href="/profiles">Profiles</a>
  # ```
  #
  # is better than
  #
  # ```ruby
  # link_to "Profiles", controller: "profiles"
  # # => <a href="/profiles">Profiles</a>
  # ```
  #
  # When name is `nil` the href is presented instead
  #
  # ```ruby
  # link_to nil, "http://example.com"
  # # => <a href="http://www.example.com">http://www.example.com</a>
  # ```
  #
  # You can use a block as well if your link target is hard to fit into the name parameter. ERB example:
  #
  # ```html
  # <%= link_to(@profile) do %>
  #   <strong><%= @profile.name %></strong> -- <span>Check it out!</span>
  # <% end %>
  # # => <a href="/profiles/1">
  #         <strong>David</strong> -- <span>Check it out!</span>
  #       </a>
  # ```
  #
  # Classes and ids for CSS are easy to produce:
  #
  # ```ruby
  # link_to "Articles", articles_path, id: "news", class: "article"
  # # => <a href="/articles" class="article" id="news">Articles</a>
  # ```
  #
  # Be careful when using the older argument style, as an extra literal hash is needed:
  #
  # ```ruby
  # link_to "Articles", { controller: "articles" }, id: "news", class: "article"
  # # => <a href="/articles" class="article" id="news">Articles</a>
  # ```
  #
  # Leaving the hash off gives the wrong link:
  #
  # ```ruby
  # link_to "WRONG!", controller: "articles", id: "news", class: "article"
  # # => <a href="/articles/index/news?class=article">WRONG!</a>
  # ```
  #
  # `link_to` can also produce links with anchors or query strings:
  #
  # ```ruby
  # link_to "Comment wall", profile_path(@profile, anchor: "wall")
  # # => <a href="/profiles/1#wall">Comment wall</a>
  #
  # link_to "Ruby on Rails search", controller: "searches", query: "ruby on rails"
  # # => <a href="/searches?query=ruby+on+rails">Ruby on Rails search</a>
  #
  # link_to "Nonsense search", searches_path(foo: "bar", baz: "quux")
  # # => <a href="/searches?foo=bar&amp;baz=quux">Nonsense search</a>
  # ```
  #
  # The only option specific to `link_to` (`:method`) is used as follows:
  #
  # ```ruby
  # link_to("Destroy", "http://www.example.com", method: :delete)
  # # => <a href='http://www.example.com' rel="nofollow" data-method="delete">Destroy</a>
  # ```
  #
  # You can also use custom data attributes using the `:data` option:
  #
  # ```ruby
  # link_to "Visit Other Site", "http://www.rubyonrails.org/", data: { confirm: "Are you sure?" }
  # # => <a href="http://www.rubyonrails.org/" data-confirm="Are you sure?">Visit Other Site</a>
  # ```
  #
  # Also you can set any link attributes such as `target`, `rel`, `type`:
  #
  # ```ruby
  # link_to "External link", "http://www.rubyonrails.org/", target: "_blank", rel: "nofollow"
  # # => <a href="http://www.rubyonrails.org/" target="_blank" rel="nofollow">External link</a>
  # ```
  sig do
    params(
      name: String,
      options: T.untyped,
      html_options: T.untyped,
      block: T.untyped
    ).returns(ActiveSupport::SafeBuffer)
  end
  def link_to(name = nil, options = nil, html_options = nil, &block); end

  # Creates a link tag of the given `name` using a URL created by the set of
  # `options` if `condition` is true, otherwise only the name is
  # returned. To specialize the default behavior, you can pass a block that
  # accepts the name or the full argument list for `link_to_unless` (see the examples
  # in `link_to_unless`).
  #
  # #### Examples
  # ```ruby
  # <%= link_to_if(@current_user.nil?, "Login", { controller: "sessions", action: "new" }) %>
  # # If the user isn't logged in...
  # # => <a href="/sessions/new/">Login</a>
  # ```
  #
  # ```ruby
  # <%=
  #    link_to_if(@current_user.nil?, "Login", { controller: "sessions", action: "new" }) do
  #      link_to(@current_user.login, { controller: "accounts", action: "show", id: @current_user })
  #    end
  # %>
  # # If the user isn't logged in...
  # # => <a href="/sessions/new/">Login</a>
  # # If they are logged in...
  # # => <a href="/accounts/show/3">my_username</a>
  # ```
  sig do
    params(
      condition: T.untyped,
      name: String,
      options: T.untyped,
      html_options: T.untyped,
      block: T.untyped
    ).returns(T.untyped)
  end
  def link_to_if(condition, name, options = {}, html_options = {}, &block); end
end

module ActionView::Helpers::UrlHelper::ClassMethods; end

ActionView::Helpers::UrlHelper::BUTTON_TAG_METHOD_VERBS = T.let(T.unsafe(nil), T::Array[T.untyped])

ActionView::Helpers::UrlHelper::STRINGIFIED_COMMON_METHODS = T.let(T.unsafe(nil), T::Hash[T.untyped, T.untyped])

module ActionView::Layouts
  mixes_in_class_methods(::ActionView::Layouts::ClassMethods)
end

module ActionView::Layouts::ClassMethods; end

ActionView::RecordIdentifier::JOIN = T.let(T.unsafe(nil), String)

ActionView::RecordIdentifier::NEW = T.let(T.unsafe(nil), String)

module ActionView::Rendering
  mixes_in_class_methods(ActionView::Rendering::ClassMethods)
end

module ActionView::Rendering::ClassMethods
end

module ActionView::ViewPaths
  mixes_in_class_methods(ActionView::ViewPaths::ClassMethods)
end

module ActionView::ViewPaths::ClassMethods
  sig do
    params(
      value: T.any(String, T::Array[String])
    ).void
  end
  def append_view_path(value); end
end
