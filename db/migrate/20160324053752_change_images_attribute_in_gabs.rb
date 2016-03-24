class ChangeImagesAttributeInGabs < ActiveRecord::Migration
  def change
    remove_column :gabs, :images, :text
    add_column :gabs, :images, :text, array:true, default: []
  end
end
