class CreateDiscounts < ActiveRecord::Migration
  def change
    create_table :discounts, id: :uuid do |t|
      t.uuid :product_id
      t.float :discount
      t.datetime :start_date
      t.datetime :end_date
      t.datetime :date 
      t.string :loop_type
      
      t.timestamps
    end
  end
end
