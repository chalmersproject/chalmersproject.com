# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `addressable` gem.
# Please instead update this file by running `bin/tapioca gem addressable`.

# Addressable is a library for processing links and URIs.
module Addressable; end

module Addressable::IDNA
  class << self
    # Converts from a Unicode internationalized domain name to an ASCII
    # domain name as described in RFC 3490.
    def to_ascii(input); end

    # Converts from an ASCII domain name to a Unicode internationalized
    # domain name as described in RFC 3490.
    def to_unicode(input); end

    # Unicode normalization form KC.
    def unicode_normalize_kc(input); end

    private

    def lookup_unicode_combining_class(codepoint); end
    def lookup_unicode_compatibility(codepoint); end
    def lookup_unicode_composition(unpacked); end
    def lookup_unicode_lowercase(codepoint); end

    # Bias adaptation method
    def punycode_adapt(delta, numpoints, firsttime); end

    def punycode_basic?(codepoint); end
    def punycode_decode(punycode); end

    # Returns the numeric value of a basic codepoint
    # (for use in representing integers) in the range 0 to
    # base - 1, or PUNYCODE_BASE if codepoint does not represent a value.
    def punycode_decode_digit(codepoint); end

    def punycode_delimiter?(codepoint); end
    def punycode_encode(unicode); end
    def punycode_encode_digit(d); end
    def ucs4_to_utf8(char, buffer); end
    def unicode_compose(unpacked); end
    def unicode_compose_pair(ch_one, ch_two); end
    def unicode_decompose(unpacked); end
    def unicode_decompose_hangul(codepoint); end

    # Unicode aware downcase method.
    def unicode_downcase(input); end

    def unicode_sort_canonical(unpacked); end
  end
end

Addressable::IDNA::ACE_MAX_LENGTH = T.let(T.unsafe(nil), Integer)
Addressable::IDNA::ACE_PREFIX = T.let(T.unsafe(nil), String)
Addressable::IDNA::COMPOSITION_TABLE = T.let(T.unsafe(nil), Hash)
Addressable::IDNA::HANGUL_LBASE = T.let(T.unsafe(nil), Integer)
Addressable::IDNA::HANGUL_LCOUNT = T.let(T.unsafe(nil), Integer)

# 588
Addressable::IDNA::HANGUL_NCOUNT = T.let(T.unsafe(nil), Integer)

Addressable::IDNA::HANGUL_SBASE = T.let(T.unsafe(nil), Integer)

# 11172
Addressable::IDNA::HANGUL_SCOUNT = T.let(T.unsafe(nil), Integer)

Addressable::IDNA::HANGUL_TBASE = T.let(T.unsafe(nil), Integer)
Addressable::IDNA::HANGUL_TCOUNT = T.let(T.unsafe(nil), Integer)
Addressable::IDNA::HANGUL_VBASE = T.let(T.unsafe(nil), Integer)
Addressable::IDNA::HANGUL_VCOUNT = T.let(T.unsafe(nil), Integer)
Addressable::IDNA::PUNYCODE_BASE = T.let(T.unsafe(nil), Integer)
Addressable::IDNA::PUNYCODE_DAMP = T.let(T.unsafe(nil), Integer)
Addressable::IDNA::PUNYCODE_DELIMITER = T.let(T.unsafe(nil), Integer)
Addressable::IDNA::PUNYCODE_INITIAL_BIAS = T.let(T.unsafe(nil), Integer)
Addressable::IDNA::PUNYCODE_INITIAL_N = T.let(T.unsafe(nil), Integer)
Addressable::IDNA::PUNYCODE_MAXINT = T.let(T.unsafe(nil), Integer)
Addressable::IDNA::PUNYCODE_PRINT_ASCII = T.let(T.unsafe(nil), String)
Addressable::IDNA::PUNYCODE_SKEW = T.let(T.unsafe(nil), Integer)
Addressable::IDNA::PUNYCODE_TMAX = T.let(T.unsafe(nil), Integer)
Addressable::IDNA::PUNYCODE_TMIN = T.let(T.unsafe(nil), Integer)

# Input is invalid.
class Addressable::IDNA::PunycodeBadInput < ::StandardError; end

# Output would exceed the space provided.
class Addressable::IDNA::PunycodeBigOutput < ::StandardError; end

# Input needs wider integers to process.
class Addressable::IDNA::PunycodeOverflow < ::StandardError; end

Addressable::IDNA::UNICODE_DATA = T.let(T.unsafe(nil), Hash)
Addressable::IDNA::UNICODE_DATA_CANONICAL = T.let(T.unsafe(nil), Integer)
Addressable::IDNA::UNICODE_DATA_COMBINING_CLASS = T.let(T.unsafe(nil), Integer)
Addressable::IDNA::UNICODE_DATA_COMPATIBILITY = T.let(T.unsafe(nil), Integer)
Addressable::IDNA::UNICODE_DATA_EXCLUSION = T.let(T.unsafe(nil), Integer)
Addressable::IDNA::UNICODE_DATA_LOWERCASE = T.let(T.unsafe(nil), Integer)
Addressable::IDNA::UNICODE_DATA_TITLECASE = T.let(T.unsafe(nil), Integer)
Addressable::IDNA::UNICODE_DATA_UPPERCASE = T.let(T.unsafe(nil), Integer)
Addressable::IDNA::UNICODE_MAX_LENGTH = T.let(T.unsafe(nil), Integer)
Addressable::IDNA::UNICODE_TABLE = T.let(T.unsafe(nil), String)
Addressable::IDNA::UTF8_REGEX = T.let(T.unsafe(nil), Regexp)
Addressable::IDNA::UTF8_REGEX_MULTIBYTE = T.let(T.unsafe(nil), Regexp)

# This is an implementation of a URI parser based on
# <a href="http://www.ietf.org/rfc/rfc3986.txt">RFC 3986</a>,
# <a href="http://www.ietf.org/rfc/rfc3987.txt">RFC 3987</a>.
class Addressable::URI
  # Creates a new uri object from component parts.
  def initialize(options = T.unsafe(nil)); end

  # Joins two URIs together.
  def +(uri); end

  # Returns <code>true</code> if the URI objects are equal. This method
  # normalizes both URIs before doing the comparison.
  def ==(uri); end

  # Returns <code>true</code> if the URI objects are equal. This method
  # normalizes both URIs before doing the comparison, and allows comparison
  # against <code>Strings</code>.
  def ===(uri); end

  # Determines if the URI is absolute.
  def absolute?; end

  # The authority component for this URI.
  # Combines the user, password, host, and port components.
  def authority; end

  # Sets the authority component for this URI.
  def authority=(new_authority); end

  # The basename, if any, of the file in the path component.
  def basename; end

  # The default port for this URI's scheme.
  # This method will always returns the default port for the URI's scheme
  # regardless of the presence of an explicit port in the URI.
  def default_port; end

  # This method allows you to make several changes to a URI simultaneously,
  # which separately would cause validation errors, but in conjunction,
  # are valid.  The URI will be revalidated as soon as the entire block has
  # been executed.
  def defer_validation; end

  # Creates a URI suitable for display to users. If semantic attacks are
  # likely, the application should try to detect these and warn the user.
  # See <a href="http://www.ietf.org/rfc/rfc3986.txt">RFC 3986</a>,
  # section 7.6 for more information.
  def display_uri; end

  # Returns the public suffix domain for this host.
  def domain; end

  # Clones the URI object.
  def dup; end

  # Determines if the URI is an empty string.
  def empty?; end

  # Returns <code>true</code> if the URI objects are equal. This method
  # does NOT normalize either URI before doing the comparison.
  def eql?(uri); end

  # The extname, if any, of the file in the path component.
  # Empty string if there is no extension.
  def extname; end

  # The fragment component for this URI.
  def fragment; end

  # Sets the fragment component for this URI.
  def fragment=(new_fragment); end

  # Freeze URI, initializing instance variables.
  def freeze; end

  # A hash value that will make a URI equivalent to its normalized
  # form.
  def hash; end

  # The host component for this URI.
  def host; end

  # Sets the host component for this URI.
  def host=(new_host); end

  # This method is same as URI::Generic#host except
  # brackets for IPv6 (and 'IPvFuture') addresses are removed.
  def hostname; end

  # This method is same as URI::Generic#host= except
  # the argument can be a bare IPv6 address (or 'IPvFuture').
  def hostname=(new_hostname); end

  # The inferred port component for this URI.
  # This method will normalize to the default port for the URI's scheme if
  # the port isn't explicitly specified in the URI.
  def inferred_port; end

  # Returns a <code>String</code> representation of the URI object's state.
  def inspect; end

  # Determines if the scheme indicates an IP-based protocol.
  def ip_based?; end

  # Joins two URIs together.
  def join(uri); end

  # Destructive form of <code>join</code>.
  def join!(uri); end

  # Merges a URI with a <code>Hash</code> of components.
  # This method has different behavior from <code>join</code>. Any
  # components present in the <code>hash</code> parameter will override the
  # original components. The path component is not treated specially.
  def merge(hash); end

  # Destructive form of <code>merge</code>.
  def merge!(uri); end

  # Returns a normalized URI object.
  #
  # NOTE: This method does not attempt to fully conform to specifications.
  # It exists largely to correct other people's failures to read the
  # specifications, and also to deal with caching issues since several
  # different URIs may represent the same resource and should not be
  # cached multiple times.
  def normalize; end

  # Destructively normalizes this URI object.
  def normalize!; end

  # The authority component for this URI, normalized.
  def normalized_authority; end

  # The fragment component for this URI, normalized.
  def normalized_fragment; end

  # The host component for this URI, normalized.
  def normalized_host; end

  # The password component for this URI, normalized.
  def normalized_password; end

  # The path component for this URI, normalized.
  def normalized_path; end

  # The port component for this URI, normalized.
  def normalized_port; end

  # The query component for this URI, normalized.
  def normalized_query(*flags); end

  # The scheme component for this URI, normalized.
  def normalized_scheme; end

  # The normalized combination of components that represent a site.
  # Combines the scheme, user, password, host, and port components.
  # Primarily useful for HTTP and HTTPS.
  #
  # For example, <code>"http://example.com/path?query"</code> would have a
  # <code>site</code> value of <code>"http://example.com"</code>.
  def normalized_site; end

  # The user component for this URI, normalized.
  def normalized_user; end

  # The userinfo component for this URI, normalized.
  def normalized_userinfo; end

  # Omits components from a URI.
  def omit(*components); end

  # Destructive form of omit.
  def omit!(*components); end

  # The origin for this URI, serialized to ASCII, as per
  # RFC 6454, section 6.2.
  def origin; end

  # Sets the origin for this URI, serialized to ASCII, as per
  # RFC 6454, section 6.2. This assignment will reset the `userinfo`
  # component.
  def origin=(new_origin); end

  # The password component for this URI.
  def password; end

  # Sets the password component for this URI.
  def password=(new_password); end

  # The path component for this URI.
  def path; end

  # Sets the path component for this URI.
  def path=(new_path); end

  # The port component for this URI.
  # This is the port number actually given in the URI. This does not
  # infer port numbers from default values.
  def port; end

  # Sets the port component for this URI.
  def port=(new_port); end

  # The query component for this URI.
  def query; end

  # Sets the query component for this URI.
  def query=(new_query); end

  # Converts the query component to a Hash value.
  def query_values(return_type = T.unsafe(nil)); end

  # Sets the query component for this URI from a Hash object.
  # An empty Hash or Array will result in an empty query string.
  def query_values=(new_query_values); end

  # Determines if the URI is relative.
  def relative?; end

  # The HTTP request URI for this URI.  This is the path and the
  # query string.
  def request_uri; end

  # Sets the HTTP request URI for this URI.
  def request_uri=(new_request_uri); end

  # Returns the shortest normalized relative form of this URI that uses the
  # supplied URI as a base for resolution. Returns an absolute URI if
  # necessary. This is effectively the opposite of <code>route_to</code>.
  def route_from(uri); end

  # Returns the shortest normalized relative form of the supplied URI that
  # uses this URI as a base for resolution. Returns an absolute URI if
  # necessary. This is effectively the opposite of <code>route_from</code>.
  def route_to(uri); end

  # The scheme component for this URI.
  def scheme; end

  # Sets the scheme component for this URI.
  def scheme=(new_scheme); end

  # The combination of components that represent a site.
  # Combines the scheme, user, password, host, and port components.
  # Primarily useful for HTTP and HTTPS.
  #
  # For example, <code>"http://example.com/path?query"</code> would have a
  # <code>site</code> value of <code>"http://example.com"</code>.
  def site; end

  # Sets the site value for this URI.
  def site=(new_site); end

  # Returns the top-level domain for this host.
  def tld; end

  # Sets the top-level domain for this URI.
  def tld=(new_tld); end

  # Returns a Hash of the URI components.
  def to_hash; end

  # Converts the URI to a <code>String</code>.
  def to_s; end

  # Converts the URI to a <code>String</code>.
  # URI's are glorified <code>Strings</code>. Allow implicit conversion.
  def to_str; end

  # The user component for this URI.
  def user; end

  # Sets the user component for this URI.
  def user=(new_user); end

  # The userinfo component for this URI.
  # Combines the user and password components.
  def userinfo; end

  # Sets the userinfo component for this URI.
  def userinfo=(new_userinfo); end

  protected

  # Resets composite values for the entire URI
  def remove_composite_values; end

  # Replaces the internal state of self with the specified URI's state.
  # Used in destructive operations to avoid massive code repetition.
  def replace_self(uri); end

  # Splits path string with "/" (slash).
  # It is considered that there is empty string after last slash when
  # path ends with slash.
  def split_path(path); end

  # Ensures that the URI is valid.
  def validate; end

  class << self
    # Converts a path to a file scheme URI. If the path supplied is
    # relative, it will be returned as a relative URI. If the path supplied
    # is actually a non-file URI, it will parse the URI as if it had been
    # parsed with <code>Addressable::URI.parse</code>. Handles all of the
    # various Microsoft-specific formats for specifying paths.
    def convert_path(path); end

    # Percent encodes any special characters in the URI.
    def encode(uri, return_type = T.unsafe(nil)); end

    # Percent encodes a URI component.
    #
    # '9' to be percent encoded. If a <code>Regexp</code> is passed, the
    # value <code>/[^b-zB-Z0-9]/</code> would have the same effect. A set of
    # useful <code>String</code> values may be found in the
    # <code>Addressable::URI::CharacterClasses</code> module. The default
    # value is the reserved plus unreserved character classes specified in
    # <a href="http://www.ietf.org/rfc/rfc3986.txt">RFC 3986</a>.
    def encode_component(component, character_class = T.unsafe(nil), upcase_encoded = T.unsafe(nil)); end

    # Percent encodes any special characters in the URI.
    def escape(uri, return_type = T.unsafe(nil)); end

    # Percent encodes a URI component.
    #
    # '9' to be percent encoded. If a <code>Regexp</code> is passed, the
    # value <code>/[^b-zB-Z0-9]/</code> would have the same effect. A set of
    # useful <code>String</code> values may be found in the
    # <code>Addressable::URI::CharacterClasses</code> module. The default
    # value is the reserved plus unreserved character classes specified in
    # <a href="http://www.ietf.org/rfc/rfc3986.txt">RFC 3986</a>.
    def escape_component(component, character_class = T.unsafe(nil), upcase_encoded = T.unsafe(nil)); end

    # Encodes a set of key/value pairs according to the rules for the
    # <code>application/x-www-form-urlencoded</code> MIME type.
    def form_encode(form_values, sort = T.unsafe(nil)); end

    # Decodes a <code>String</code> according to the rules for the
    # <code>application/x-www-form-urlencoded</code> MIME type.
    def form_unencode(encoded_value); end

    # Converts an input to a URI. The input does not have to be a valid
    # URI — the method will use heuristics to guess what URI was intended.
    # This is not standards-compliant, merely user-friendly.
    def heuristic_parse(uri, hints = T.unsafe(nil)); end

    # Returns an array of known ip-based schemes. These schemes typically
    # use a similar URI form:
    # <code>//<user>:<password>@<host>:<port>/<url-path></code>
    def ip_based_schemes; end

    # Joins several URIs together.
    def join(*uris); end

    # Normalizes the encoding of a URI component.
    def normalize_component(component, character_class = T.unsafe(nil), leave_encoded = T.unsafe(nil)); end

    # Resolves paths to their simplest form.
    def normalize_path(path); end

    # Normalizes the encoding of a URI. Characters within a hostname are
    # not percent encoded to allow for internationalized domain names.
    def normalized_encode(uri, return_type = T.unsafe(nil)); end

    # Returns a URI object based on the parsed string.
    def parse(uri); end

    # Returns a hash of common IP-based schemes and their default port
    # numbers. Adding new schemes to this hash, as necessary, will allow
    # for better URI normalization.
    def port_mapping; end

    # Unencodes any percent encoded characters within a URI component.
    # This method may be used for unencoding either components or full URIs,
    # however, it is recommended to use the <code>unencode_component</code>
    # alias when unencoding components.
    def unencode(uri, return_type = T.unsafe(nil), leave_encoded = T.unsafe(nil)); end

    # Unencodes any percent encoded characters within a URI component.
    # This method may be used for unencoding either components or full URIs,
    # however, it is recommended to use the <code>unencode_component</code>
    # alias when unencoding components.
    def unencode_component(uri, return_type = T.unsafe(nil), leave_encoded = T.unsafe(nil)); end

    # Unencodes any percent encoded characters within a URI component.
    # This method may be used for unencoding either components or full URIs,
    # however, it is recommended to use the <code>unencode_component</code>
    # alias when unencoding components.
    def unescape(uri, return_type = T.unsafe(nil), leave_encoded = T.unsafe(nil)); end

    # Unencodes any percent encoded characters within a URI component.
    # This method may be used for unencoding either components or full URIs,
    # however, it is recommended to use the <code>unencode_component</code>
    # alias when unencoding components.
    def unescape_component(uri, return_type = T.unsafe(nil), leave_encoded = T.unsafe(nil)); end
  end
end

# Container for the character classes specified in
# <a href="http://www.ietf.org/rfc/rfc3986.txt">RFC 3986</a>.
module Addressable::URI::CharacterClasses; end

Addressable::URI::CharacterClasses::ALPHA = T.let(T.unsafe(nil), String)
Addressable::URI::CharacterClasses::AUTHORITY = T.let(T.unsafe(nil), String)
Addressable::URI::CharacterClasses::DIGIT = T.let(T.unsafe(nil), String)
Addressable::URI::CharacterClasses::FRAGMENT = T.let(T.unsafe(nil), String)
Addressable::URI::CharacterClasses::GEN_DELIMS = T.let(T.unsafe(nil), String)
Addressable::URI::CharacterClasses::HOST = T.let(T.unsafe(nil), String)
Addressable::URI::CharacterClasses::PATH = T.let(T.unsafe(nil), String)
Addressable::URI::CharacterClasses::PCHAR = T.let(T.unsafe(nil), String)
Addressable::URI::CharacterClasses::QUERY = T.let(T.unsafe(nil), String)
Addressable::URI::CharacterClasses::RESERVED = T.let(T.unsafe(nil), String)
Addressable::URI::CharacterClasses::SCHEME = T.let(T.unsafe(nil), String)
Addressable::URI::CharacterClasses::SUB_DELIMS = T.let(T.unsafe(nil), String)
Addressable::URI::CharacterClasses::UNRESERVED = T.let(T.unsafe(nil), String)
Addressable::URI::EMPTY_STR = T.let(T.unsafe(nil), String)

# Raised if something other than a uri is supplied.
class Addressable::URI::InvalidURIError < ::StandardError; end

Addressable::URI::NORMPATH = T.let(T.unsafe(nil), Regexp)
module Addressable::URI::NormalizeCharacterClasses; end
Addressable::URI::NormalizeCharacterClasses::FRAGMENT = T.let(T.unsafe(nil), Regexp)
Addressable::URI::NormalizeCharacterClasses::HOST = T.let(T.unsafe(nil), Regexp)
Addressable::URI::NormalizeCharacterClasses::PCHAR = T.let(T.unsafe(nil), Regexp)
Addressable::URI::NormalizeCharacterClasses::QUERY = T.let(T.unsafe(nil), Regexp)
Addressable::URI::NormalizeCharacterClasses::SCHEME = T.let(T.unsafe(nil), Regexp)
Addressable::URI::NormalizeCharacterClasses::UNRESERVED = T.let(T.unsafe(nil), Regexp)
Addressable::URI::PARENT = T.let(T.unsafe(nil), String)
Addressable::URI::PORT_MAPPING = T.let(T.unsafe(nil), Hash)
Addressable::URI::RULE_2A = T.let(T.unsafe(nil), Regexp)
Addressable::URI::RULE_2B_2C = T.let(T.unsafe(nil), Regexp)
Addressable::URI::RULE_2D = T.let(T.unsafe(nil), Regexp)
Addressable::URI::RULE_PREFIXED_PARENT = T.let(T.unsafe(nil), Regexp)
Addressable::URI::SELF_REF = T.let(T.unsafe(nil), String)

# Tables used to optimize encoding operations in `self.encode_component`
# and `self.normalize_component`
Addressable::URI::SEQUENCE_ENCODING_TABLE = T.let(T.unsafe(nil), Hash)

Addressable::URI::SEQUENCE_UPCASED_PERCENT_ENCODING_TABLE = T.let(T.unsafe(nil), Hash)
Addressable::URI::SLASH = T.let(T.unsafe(nil), String)
Addressable::URI::URIREGEX = T.let(T.unsafe(nil), Regexp)
module Addressable::VERSION; end
Addressable::VERSION::MAJOR = T.let(T.unsafe(nil), Integer)
Addressable::VERSION::MINOR = T.let(T.unsafe(nil), Integer)
Addressable::VERSION::STRING = T.let(T.unsafe(nil), String)
Addressable::VERSION::TINY = T.let(T.unsafe(nil), Integer)