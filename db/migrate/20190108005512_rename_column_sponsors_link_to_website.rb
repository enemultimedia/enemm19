class RenameColumnSponsorsLinkToWebsite < ActiveRecord::Migration[5.2]
  def change
    rename_column :sponsors, :link, :website
  end
end
