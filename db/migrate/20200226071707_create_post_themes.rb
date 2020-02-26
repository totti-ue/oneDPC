class CreatePostThemes < ActiveRecord::Migration[5.2]
  def change
    create_table :post_themes do |t|
      t.references :post, index: true, foreign_key: true
      t.references :theme, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
