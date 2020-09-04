class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,          null: false
      t.text :instruction,          null: false
      t.integer :postage_id,          null: false
      t.integer :price,          null: false
      t.integer :category_id,          null: false
      t.integer :shipping_day_id,          null: false
      t.integer :item_status_id,          null: false
      t.integer :prefecture_id,          null: false
      t.boolean :sold
      t.references :user,          null: false, foreign_key: true
      t.references  :order,          null: false, foreign_key: true
      t.timestamps
    end
  end
end
