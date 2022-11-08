class Comentario < ApplicationRecord
    belongs_to :post
    belongs_to :parent, class_name: 'Comentario', optional: true
    has_many :replies, class_name: 'Comentario', foreign_key: :parent_id, dependent: :destroy

    validates :nome, presence:true
    validates :mensagem, presence:true
end
