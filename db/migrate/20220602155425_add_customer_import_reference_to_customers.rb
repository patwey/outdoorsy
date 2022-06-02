class AddCustomerImportReferenceToCustomers < ActiveRecord::Migration[7.0]
  def change
    add_reference :customers, :customer_import, index: true
  end
end
