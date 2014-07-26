class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products, id: :uuid do |t|
      t.uuid :product_type_id
      t.uuid :product_category_id
      t.string :name, null: false
      t.string :slug
      t.text :short_desc
      t.text :description
      t.float :price

      t.datetime :deleted_at

      t.timestamps
    end

    add_index :products, :slug
  end
end
