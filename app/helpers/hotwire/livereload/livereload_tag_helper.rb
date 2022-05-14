# typed: false
# frozen_string_literal: true

module Hotwire::Livereload::LivereloadTagHelper
  def hotwire_livereload_tag
    return unless Rails.env.development?

    javascript_include_tag("hotwire-livereload", defer: true)
  end
end
