class AddPostIdToComentario < ActiveRecord::Migration[6.1]
  def change
    add_column :comentarios, :post_id, :integer
  end
end
