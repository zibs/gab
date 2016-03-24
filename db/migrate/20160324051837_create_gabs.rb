class CreateGabs < ActiveRecord::Migration
  def change
    create_table :gabs do |t|
      t.text :title
      t.string :uuid_url
      t.text :body
      t.references :user, index: true, foreign_key: true
      t.string :images
      t.string :slug

      t.timestamps null: false
    end
    add_index :gabs, :slug, unique: true
  end
end
