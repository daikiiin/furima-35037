class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :name,                        null: false
      t.text       :explain,                     null: false
      t.integer    :category_id,                 null: false
      t.integer    :item_status_id,              null: false
      t.integer    :shipping_fee_status_id,      null: false
      t.integer    :shipping_fee_destination_id, null: false
      t.integer    :shipping_fee_day_id,         null: false
      t.integer    :cost,                        null: false 
      t.references :user,                        foreign_key:true

      t.timestamps
    end
  end
end
