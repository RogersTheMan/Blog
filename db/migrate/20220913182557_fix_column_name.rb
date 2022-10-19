class FixColumnName < ActiveRecord::Migration[6.1]
  def self.up
    rename_column :usuarios, :password, :password_digest
  end

  def self.down
  end
end
