class AddVisitCounterToPost < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :visit_counter, :integer, default: 0
  end
end
