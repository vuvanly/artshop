class AddFieldsToAdmin < ActiveRecord::Migration
  def change
    add_column :admins, :username, :string
    add_column :admins, :role_id, :integer
  end
end
