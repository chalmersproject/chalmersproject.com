# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `rainbow` gem.
# Please instead update this file by running `bin/tapioca gem rainbow`.

module Rainbow
  class << self
    def enabled; end
    def enabled=(value); end
    def global; end
    def new; end
    def uncolor(string); end
  end
end

class Rainbow::Color
  # Returns the value of attribute ground.
  def ground; end

  class << self
    def build(ground, values); end
    def parse_hex_color(hex); end
  end
end

class Rainbow::Color::Indexed < ::Rainbow::Color
  def initialize(ground, num); end

  def codes; end

  # Returns the value of attribute num.
  def num; end
end

class Rainbow::Color::Named < ::Rainbow::Color::Indexed
  def initialize(ground, name); end

  class << self
    def color_names; end
    def valid_names; end
  end
end

Rainbow::Color::Named::NAMES = T.let(T.unsafe(nil), Hash)

class Rainbow::Color::RGB < ::Rainbow::Color::Indexed
  def initialize(ground, *values); end

  # Returns the value of attribute b.
  def b; end

  def codes; end

  # Returns the value of attribute g.
  def g; end

  # Returns the value of attribute r.
  def r; end

  private

  def code_from_rgb; end

  class << self
    def to_ansi_domain(value); end
  end
end

class Rainbow::Color::X11Named < ::Rainbow::Color::RGB
  include ::Rainbow::X11ColorNames

  def initialize(ground, name); end

  class << self
    def color_names; end
    def valid_names; end
  end
end

class Rainbow::NullPresenter < ::String
  def background(*_values); end
  def bg(*_values); end
  def black; end
  def blink; end
  def blue; end
  def bold; end
  def bright; end
  def color(*_values); end
  def cross_out; end
  def cyan; end
  def dark; end
  def faint; end
  def fg(*_values); end
  def foreground(*_values); end
  def green; end
  def hide; end
  def inverse; end
  def italic; end
  def magenta; end
  def method_missing(method_name, *args); end
  def red; end
  def reset; end
  def strike; end
  def underline; end
  def white; end
  def yellow; end

  private

  def respond_to_missing?(method_name, *args); end
end

class Rainbow::Presenter < ::String
  # Sets background color of this text.
  def background(*values); end

  # Sets background color of this text.
  def bg(*values); end

  def black; end

  # Turns on blinking attribute for this text (not well supported by terminal
  # emulators).
  def blink; end

  def blue; end

  # Turns on bright/bold for this text.
  def bold; end

  # Turns on bright/bold for this text.
  def bright; end

  # Sets color of this text.
  def color(*values); end

  def cross_out; end
  def cyan; end

  # Turns on faint/dark for this text (not well supported by terminal
  # emulators).
  def dark; end

  # Turns on faint/dark for this text (not well supported by terminal
  # emulators).
  def faint; end

  # Sets color of this text.
  def fg(*values); end

  # Sets color of this text.
  def foreground(*values); end

  def green; end

  # Hides this text (set its color to the same as background).
  def hide; end

  # Inverses current foreground/background colors.
  def inverse; end

  # Turns on italic style for this text (not well supported by terminal
  # emulators).
  def italic; end

  def magenta; end

  # We take care of X11 color method call here.
  # Such as #aqua, #ghostwhite.
  def method_missing(method_name, *args); end

  def red; end

  # Resets terminal to default colors/backgrounds.
  #
  # It shouldn't be needed to use this method because all methods
  # append terminal reset code to end of string.
  def reset; end

  def strike; end

  # Turns on underline decoration for this text.
  def underline; end

  def white; end
  def yellow; end

  private

  def respond_to_missing?(method_name, *args); end
  def wrap_with_sgr(codes); end
end

Rainbow::Presenter::TERM_EFFECTS = T.let(T.unsafe(nil), Hash)

class Rainbow::StringUtils
  class << self
    def uncolor(string); end
    def wrap_with_sgr(string, codes); end
  end
end

class Rainbow::Wrapper
  def initialize(enabled = T.unsafe(nil)); end

  # Returns the value of attribute enabled.
  def enabled; end

  # Sets the attribute enabled
  def enabled=(_arg0); end

  def wrap(string); end
end

module Rainbow::X11ColorNames; end
Rainbow::X11ColorNames::NAMES = T.let(T.unsafe(nil), Hash)
