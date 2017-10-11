class Photo < ApplicationRecord

  include ImageUploader::Attachment.new(:image) # adds an `image` virtual attribute
  belongs_to :user
  has_many :comments
  acts_as_votable
end
