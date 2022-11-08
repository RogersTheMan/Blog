class CreateComentarios < ActiveRecord::Migration[6.1]
  def change
    create_table :comentarios do |t|
      t.string :nome
      t.text :mensagem

      t.timestamps
    end
  end
end
