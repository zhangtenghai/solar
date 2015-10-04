class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.string :name
    end

    add_column :users, :position_id, :integer
  end
end
