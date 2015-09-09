class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :role, :string
    add_column :users, :name, :string
    add_column :users, :no, :string
    add_column :users, :department, :string
    add_column :users, :locked_at, :datetime
    add_column :users, :no_job, :boolean, default: false
    add_column :users, :memo, :string
    add_column :users, :level, :string
    add_column :users, :company_id, :integer
  end
end
