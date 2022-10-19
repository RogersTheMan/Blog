class Post < ApplicationRecord
    include ImageUploader::Attachment(:image)
    validates :titulo, presence:true
    validates :corpo, presence:true
    validates :image, presence:true
end
