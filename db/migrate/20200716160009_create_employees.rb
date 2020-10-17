class CreateEmployees < ActiveRecord::Migration[6.0]
  def change
    create_table :employees do |t|

      t.string :cedula, null: false
      t.string :name
      t.string :lastname
      t.string :phone
      t.string :email
      t.string :department
      t.string :position
      t.datetime :date_entry
      t.float :salary

      t.timestamps
    end
  end
end
