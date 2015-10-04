class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :position, :string
    add_column :users, :entry_at, :datetime
    add_column :users, :turnover_at, :datetime
    add_column :users, :sex, :string
    add_column :users, :cid, :string
    add_column :users, :birthday, :datetime
    add_column :users, :contract_effectived_at, :datetime
    add_column :users, :contract_expired_at, :datetime
    add_column :users, :salary_record, :text
    add_column :users, :bank_no, :string
    add_column :users, :school, :string
    add_column :users, :education, :string
    add_column :users, :major, :string
    add_column :users, :certificate, :string
    add_column :users, :history_company1, :string
    add_column :users, :history_position1, :string
    add_column :users, :history_company2, :string
    add_column :users, :history_position2, :string
    add_column :users, :history_company3, :string
    add_column :users, :history_position3, :string
    add_column :users, :address, :string
    add_column :users, :nation, :string
    add_column :users, :faith, :string
    add_column :users, :marital_status, :string
    add_column :users, :spouse_name, :string
    add_column :users, :spouse_company, :string
    add_column :users, :has_children, :boolean
    add_column :users, :emergency_contact, :string
    add_column :users, :emergency_phone, :string
  end
end
