class AddParentIdToComentario < ActiveRecord::Migration[6.1]
  def change
    add_column :comentarios, :parent_id, :integer
  end
end
