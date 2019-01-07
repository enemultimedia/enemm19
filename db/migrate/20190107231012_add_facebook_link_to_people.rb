class AddFacebookLinkToPeople < ActiveRecord::Migration[5.2]
  def change
    add_column :people, :facebook_link, :string, default: '', null: false
  end
end
