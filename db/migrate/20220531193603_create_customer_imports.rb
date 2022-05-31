class CreateCustomerImports < ActiveRecord::Migration[7.0]
  def change
    create_table :customer_imports do |t|
      t.json :metadata
      t.string :status
      t.timestamps
    end
  end
end
