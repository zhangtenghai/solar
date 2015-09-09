class CreateCompany < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :leader
      t.string :phone
      t.timestamps
    end
  end
end
