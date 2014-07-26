class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles, id: :uuid do |t|
      t.string :name, null: false, unique: true

      t.timestamps
    end

    add_index :roles, :name
  end
end
