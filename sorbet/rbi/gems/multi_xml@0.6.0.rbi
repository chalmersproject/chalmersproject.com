# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `multi_xml` gem.
# Please instead update this file by running `bin/tapioca gem multi_xml`.

module MultiXml
  class << self
    # The default parser based on what you currently
    # have loaded and installed. First checks to see
    # if any parsers are already loaded, then checks
    # to see which are installed if none are loaded.
    #
    # @raise [NoParserError]
    def default_parser; end

    # Parse an XML string or IO into Ruby.
    #
    # <b>Options</b>
    #
    # <tt>:symbolize_keys</tt> :: If true, will use symbols instead of strings for the keys.
    #
    # <tt>:disallowed_types</tt> :: Types to disallow from being typecasted. Defaults to `['yaml', 'symbol']`. Use `[]` to allow all types.
    #
    # <tt>:typecast_xml_value</tt> :: If true, won't typecast values for parsed document
    def parse(xml, options = T.unsafe(nil)); end

    # Get the current parser class.
    def parser; end

    # Set the XML parser utilizing a symbol, string, or class.
    # Supported by default are:
    #
    # * <tt>:libxml</tt>
    # * <tt>:nokogiri</tt>
    # * <tt>:ox</tt>
    # * <tt>:rexml</tt>
    # * <tt>:oga</tt>
    def parser=(new_parser); end

    private

    # TODO: Add support for other encodings
    def parse_binary(binary, entity); end

    def parse_file(file, entity); end
    def symbolize_keys(params); end
    def typecast_xml_value(value, disallowed_types = T.unsafe(nil)); end
    def undasherize_keys(params); end
  end
end

MultiXml::CONTENT_ROOT = T.let(T.unsafe(nil), String)
MultiXml::DEFAULT_OPTIONS = T.let(T.unsafe(nil), Hash)
MultiXml::DISALLOWED_XML_TYPES = T.let(T.unsafe(nil), Array)

class MultiXml::DisallowedTypeError < ::StandardError
  # @return [DisallowedTypeError] a new instance of DisallowedTypeError
  def initialize(type); end
end

class MultiXml::NoParserError < ::StandardError; end
MultiXml::PARSING = T.let(T.unsafe(nil), Hash)
class MultiXml::ParseError < ::StandardError; end
MultiXml::REQUIREMENT_MAP = T.let(T.unsafe(nil), Array)
MultiXml::TYPE_NAMES = T.let(T.unsafe(nil), Hash)
