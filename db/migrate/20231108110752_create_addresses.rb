class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string     :postal_code,   null: false
      t.integer    :shipping_area_id,    null: false
      t.string     :municipalities,    null: false
      t.string     :building_name 
      t.string     :street_address ,null: false
      t.string     :tell ,null: false
      t.references :order,      null: false, foreign_key: true
      t.references :user,      null: false, foreign_key: true
      t.references :item,      null: false, foreign_key: true
      t.timestamps
    end
  end
end
