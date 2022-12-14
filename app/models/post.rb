class Post < ApplicationRecord
    has_many :comentario

    include ImageUploader::Attachment(:image)
    validates :titulo, presence:true
    validates :corpo, presence:true
    validates :image, presence:true
end
