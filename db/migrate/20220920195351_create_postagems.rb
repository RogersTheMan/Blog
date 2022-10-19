class CreatePostagems < ActiveRecord::Migration[6.1]
  def change
    create_table :postagems do |t|
      t.string :titulo
      t.string :corpo

      t.timestamps
    end
  end
end
