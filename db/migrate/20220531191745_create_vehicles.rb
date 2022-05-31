class CreateVehicles < ActiveRecord::Migration[7.0]
  def change
    create_table :vehicles do |t|
      t.string :name
      t.string :type
      t.integer :length
      t.references :customer, index: true
      t.timestamps
    end
  end
end
