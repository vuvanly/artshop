class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos, id: :uuid do |t|
      t.uuid :owner_id
      t.datetime :deleted_at
      t.attachment :photo
      t.string :attachable_type
      t.uuid :attachable_id
    end
  end
end
