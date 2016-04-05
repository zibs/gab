class AddHtmlTitleToGabs < ActiveRecord::Migration
  def change
    add_column :gabs, :html_title, :text
  end
end
