class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :name
      t.string :address
      t.integer :port

      t.timestamps
    end
  end
end
