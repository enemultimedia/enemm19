class AddRenderAsHtmlToFaqs < ActiveRecord::Migration[5.2]
  def up
    add_column :faqs, :render_as_html, :boolean, default: false, allow_nil: false
  end

  def down
    remove_column :faqs, :render_as_html
  end
end
