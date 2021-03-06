# typed: strict

class ActiveRecord::Base
  include ActiveStorage::Attached::Model
end

class ActiveStorage::Attached::One
  sig { returns(T::Boolean) }
  def blank?; end
end

class ActiveStorage::Attached::Many
  # Returns all attached blobs.
  sig { returns(T::Array[T.untyped]) }
  def blobs; end
end

module ActiveStorage::Attached::Model
  mixes_in_class_methods(ActiveStorage::Attached::Model::ClassMethods)
end

class ActiveStorage::Attachment < ActiveStorage::Record
  # These aren't technically included, but Attachment delegates any missing
  # methods to Blob, which means it effectively inherits methods from Blob.
  # This is essentially a hack to make it easier to maintain the
  # ActiveStorage signatures. We can't include Blob directly because
  # it's a class, so `include`ing it doesn't work.
  include ActiveStorage::Blob::Analyzable
  include ActiveStorage::Blob::Identifiable
  include ActiveStorage::Blob::Representable
end

class ActiveStorage::Blob < ActiveStorage::Record
  include ActiveStorage::Blob::Analyzable
  include ActiveStorage::Blob::Identifiable
  include ActiveStorage::Blob::Representable

  sig do
    params(
        expires_in: T.untyped,
        disposition: Symbol,
        filename: T.nilable(String),
        options: T.untyped,
      )
      .returns(String)
  end
  def url(
    expires_in: ActiveStorage.service_urls_expire_in,
    disposition: :inline,
    filename: nil,
    **options
  ); end
end

module ActiveStorage
  sig { returns(Gem::Version) }
  def self.gem_version; end

  sig { returns(Gem::Version) }
  def self.version; end
end

class ActiveStorage::Attached::One
  # These aren't technically included, but Attached::One delegates any missing
  # methods to Attachment, which in turn delegates to Blob. This is essentially
  # a hack to make it easier to maintain the ActiveStorage signatures. We can't
  #include Blob directly because it's a class, so `include`ing it doesn't work.
  include ActiveStorage::Blob::Analyzable
  include ActiveStorage::Blob::Identifiable
  include ActiveStorage::Blob::Representable

  # Attaches an `attachable` to the record.
  #
  # If the record is persisted and unchanged, the attachment is saved to
  # the database immediately. Otherwise, it'll be saved to the DB when the
  # record is next saved.
  #
  # ```ruby
  # person.avatar.attach(params[:avatar]) # ActionDispatch::Http::UploadedFile object
  # person.avatar.attach(params[:signed_blob_id]) # Signed reference to blob from direct upload
  # person.avatar.attach(io: File.open("/path/to/face.jpg"), filename: "face.jpg", content_type: "image/jpg")
  # person.avatar.attach(avatar_blob) # ActiveStorage::Blob object
  # ```
  sig { params(attachable: T.untyped).void }
  def attach(attachable); end

  # Returns `true` if an attachment has been made.
  #
  # ```ruby
  # class User < ApplicationRecord
  #   has_one_attached :avatar
  # end
  #
  # User.new.avatar.attached? # => false
  # ```
  sig { returns(T::Boolean) }
  def attached?; end

  # Returns the associated attachment record.
  #
  # You don't have to call this method to access the attachment's methods as
  # they are all available at the model level.
  sig { returns(T.nilable(ActiveStorage::Attachment)) }
  def attachment; end

  # # Deletes the attachment without purging it, leaving its blob in place.
  # sig { void }
  # def detach; end

  # # Directly purges the attachment (i.e. destroys the blob and
  # # attachment and deletes the file on the service).
  # sig { void }
  # def purge; end

  # # Purges the attachment through the queuing system.
  # sig { void }
  # def purge_later; end
end

class ActiveStorage::Attached::Many
  # These aren't technically included, but Attached::Many delegates any missing
  # methods to Attachment, which in turn delegates to Blob. This is essentially
  # a hack to make it easier to maintain the ActiveStorage signatures. We can't
  # include Blob directly because it's a class, so `include`ing it doesn't work.
  include ActiveStorage::Blob::Analyzable
  include ActiveStorage::Blob::Identifiable
  include ActiveStorage::Blob::Representable

  # Attaches one or more `attachables` to the record.
  #
  # If the record is persisted and unchanged, the attachments are saved to
  # the database immediately. Otherwise, they'll be saved to the DB when the
  # record is next saved.
  #
  # ```ruby
  # document.images.attach(params[:images]) # Array of ActionDispatch::Http::UploadedFile objects
  # document.images.attach(params[:signed_blob_id]) # Signed reference to blob from direct upload
  # document.images.attach(io: File.open("/path/to/racecar.jpg"), filename: "racecar.jpg", content_type: "image/jpg")
  # document.images.attach([ first_blob, second_blob ])
  # ```
  sig { params(attachables: T.untyped).void }
  def attach(*attachables); end

  # Returns `true` if any attachments have been made.
  #
  # ```ruby
  # class Gallery < ApplicationRecord
  #   has_many_attached :photos
  # end
  #
  # Gallery.new.photos.attached? # => false
  # ```
  sig { returns(T::Boolean) }
  def attached?; end

  # Returns all the associated attachment records.
  #
  # All methods called on this proxy object that aren't listed here will automatically be delegated to `attachments`.
  sig { returns(T.nilable(T::Array[ActiveStorage::Attachment])) }
  def attachments; end

  # # Deletes associated attachments without purging them, leaving their respective blobs in place.
  # sig { void }
  # def detach; end

  # # Directly purges each associated attachment (i.e. destroys the blobs and
  # # attachments and deletes the files on the service).
  # sig { void }
  # def purge; end

  # # Purges each associated attachment through the queuing system.
  # sig { void }
  # def purge_later; end
end

module ActiveStorage::Blob::Representable
  # Returns an ActiveStorage::Variant instance with the set of `transformations` provided. This is only relevant for image
  # files, and it allows any image to be transformed for size, colors, and the like. Example:
  #
  # ```ruby
  # avatar.variant(resize_to_limit: [100, 100]).processed.service_url
  # ```
  #
  # This will create and process a variant of the avatar blob that's constrained to a height and width of 100px.
  # Then it'll upload said variant to the service according to a derivative key of the blob and the transformations.
  #
  # Frequently, though, you don't actually want to transform the variant right away. But rather simply refer to a
  # specific variant that can be created by a controller on-demand. Like so:
  #
  # ```ruby
  # <%= image_tag Current.user.avatar.variant(resize_to_limit: [100, 100]) %>
  # ```
  #
  # This will create a URL for that specific blob with that specific variant, which the ActiveStorage::RepresentationsController
  # can then produce on-demand.
  #
  # Raises ActiveStorage::InvariableError if ImageMagick cannot transform the blob. To determine whether a blob is
  # variable, call ActiveStorage::Blob#variable?.
  sig { params(transformations: T.untyped).returns(ActiveStorage::Variant) }
  def variant(transformations); end
end
