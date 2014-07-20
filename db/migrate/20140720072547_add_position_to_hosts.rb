class AddPositionToHosts < ActiveRecord::Migration
  def change
    add_column :hosts, :position, :integer
  end
end
