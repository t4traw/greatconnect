class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.integer :user_id
      t.string :product
      t.integer :price
      t.string :description
      t.string :image

      t.timestamps
    end
  end
end
