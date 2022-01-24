# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `marcel` gem.
# Please instead update this file by running `bin/tapioca gem marcel`.

# This file is auto-generated. Instead of editing this file, please
# add MIMEs to data/custom.xml or lib/marcel/mime_type/definitions.rb.
module Marcel; end

Marcel::EXTENSIONS = T.let(T.unsafe(nil), Hash)
Marcel::MAGIC = T.let(T.unsafe(nil), Array)

# Mime type detection
class Marcel::Magic
  # Mime type by type string
  def initialize(type); end

  # Allow comparison with string
  def ==(other); end

  def audio?; end

  # Returns true if type is child of parent type
  def child_of?(parent); end

  # Get mime comment
  def comment; end

  # Allow comparison with string
  def eql?(other); end

  # Get string list of file extensions
  def extensions; end

  def hash; end

  # Mediatype shortcuts
  def image?; end

  # Returns the value of attribute mediatype.
  def mediatype; end

  # Returns the value of attribute subtype.
  def subtype; end

  # Returns true if type is a text format
  def text?; end

  # Return type as string
  def to_s; end

  # Returns the value of attribute type.
  def type; end

  def video?; end

  class << self
    # Add custom mime type. Arguments:
    # * <i>type</i>: Mime type
    # * <i>options</i>: Options hash
    #
    # Option keys:
    # * <i>:extensions</i>: String list or single string of file extensions
    # * <i>:parents</i>: String list or single string of parent mime types
    # * <i>:magic</i>: Mime magic specification
    # * <i>:comment</i>: Comment string
    def add(type, options); end

    # Lookup all mime types by magic content analysis.
    # This is a slower operation.
    def all_by_magic(io); end

    # Lookup mime type by file extension
    def by_extension(ext); end

    # Lookup mime type by magic content analysis.
    # This is a slow operation.
    def by_magic(io); end

    # Lookup mime type by filename
    def by_path(path); end

    def child?(child, parent); end

    # Removes a mime type from the dictionary.  You might want to do this if
    # you're seeing impossible conflicts (for instance, application/x-gmc-link).
    # * <i>type</i>: The mime type to remove.  All associated extensions and magic are removed too.
    def remove(type); end

    private

    def magic_match(io, method); end
    def magic_match_io(io, matches, buffer); end
  end
end

class Marcel::MimeType
  class << self
    def extend(type, extensions: T.unsafe(nil), parents: T.unsafe(nil), magic: T.unsafe(nil)); end
    def for(pathname_or_io = T.unsafe(nil), name: T.unsafe(nil), extension: T.unsafe(nil), declared_type: T.unsafe(nil)); end

    private

    def for_data(pathname_or_io); end
    def for_declared_type(declared_type); end
    def for_extension(extension); end
    def for_name(name); end

    # For some document types (notably Microsoft Office) we recognise the main content
    # type with magic, but not the specific subclass. In this situation, if we can get a more
    # specific class using either the name or declared_type, we should use that in preference
    def most_specific_type(from_magic_type, fallback_type); end

    def parse_media_type(content_type); end
    def root_types(type); end
    def with_io(pathname_or_io, &block); end
  end
end

Marcel::MimeType::BINARY = T.let(T.unsafe(nil), String)
Marcel::TYPES = T.let(T.unsafe(nil), Hash)
Marcel::VERSION = T.let(T.unsafe(nil), String)
