class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :item_title, null: false
      t.text :item_text, null: false
      t.integer :item_price, null: false 
      t.integer :category_id, null: false
      t.integer :condition_id, null: false
      t.integer :shipping_fee, null: false
      t.integer :shipping_area_od, null: false
      t.integer :shipping_days_id, null: false
      t.references :user, foreign_key:true
      t.timestamps
    end
  end
end
