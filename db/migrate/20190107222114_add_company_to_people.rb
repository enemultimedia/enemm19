class AddCompanyToPeople < ActiveRecord::Migration[5.2]
  def change
    add_column :people, :company, :string, default: '', null: false
  end
end
