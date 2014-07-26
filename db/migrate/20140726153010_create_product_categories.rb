class CreateProductCategories < ActiveRecord::Migration
  def change
    create_table :product_categories, id: :uuid do |t|
      t.string :name, null: false
      t.string :slug
      t.text :description
      t.integer :position, default: -1

      t.datetime :deleted_at

      t.timestamps
    end

    add_index :product_categories, :slug
  end
end
