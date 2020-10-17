class CreateNominas < ActiveRecord::Migration[6.0]
  def change
    create_table :nominas do |t|
      t.string :age
      t.string :month
      t.float  :total

      t.timestamps
    end
  end
end
