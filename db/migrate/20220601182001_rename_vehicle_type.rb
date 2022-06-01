class RenameVehicleType < ActiveRecord::Migration[7.0]
  def change
    rename_column :vehicles, :type, :kind
  end
end
