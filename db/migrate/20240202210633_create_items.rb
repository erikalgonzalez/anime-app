class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string :name
      t.string :image_url
      t.text :description
      t.string :category

      t.timestamps
    end
  end
end
