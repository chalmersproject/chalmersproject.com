# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for dynamic methods in `Trestle::ApplicationController`.
# Please instead update this file by running `bin/tapioca dsl Trestle::ApplicationController`.

class Trestle::ApplicationController
  sig { returns(HelperProxy) }
  def helpers; end

  module HelperMethods
    include ::ActionText::ContentHelper
    include ::ActionText::TagHelper
    include ::ActionController::Base::HelperMethods
    include ::Trestle::AvatarHelper
    include ::Trestle::CardHelper
    include ::Trestle::ContainerHelper
    include ::Trestle::DisplayHelper
    include ::Trestle::FlashHelper
    include ::Trestle::FormHelper
    include ::Trestle::FormatHelper
    include ::Trestle::GridHelper
    include ::Trestle::HeadingsHelper
    include ::Trestle::Hook::Helpers
    include ::Trestle::HookHelper
    include ::Trestle::I18nHelper
    include ::Trestle::IconHelper
    include ::Trestle::LayoutHelper
    include ::Trestle::NavigationHelper
    include ::Trestle::PaginationHelper
    include ::Trestle::ParamsHelper
    include ::Trestle::SortHelper
    include ::Trestle::StatusHelper
    include ::Trestle::TabHelper
    include ::Trestle::TableHelper
    include ::Trestle::TimestampHelper
    include ::Trestle::TitleHelper
    include ::Trestle::ToolbarsHelper
    include ::Trestle::UrlHelper

    sig { params(label: T.untyped, path: T.untyped).returns(T.untyped) }
    def breadcrumb(label, path = T.unsafe(nil)); end

    sig { returns(T.untyped) }
    def breadcrumbs; end

    sig { returns(T.untyped) }
    def default_title; end

    sig { returns(T.untyped) }
    def dialog_request?; end

    sig { params(name: T.untyped, options: T.untyped, block: T.untyped).returns(T.untyped) }
    def toolbar(name, options = T.unsafe(nil), &block); end

    sig { returns(T.untyped) }
    def toolbars; end
  end

  class HelperProxy < ::ActionView::Base
    include HelperMethods
  end
end