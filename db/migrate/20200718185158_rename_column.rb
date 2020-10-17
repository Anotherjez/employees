class RenameColumn < ActiveRecord::Migration[6.0]
  def self.up
    rename_column :nominas, :total, :total_amount
  end
end
