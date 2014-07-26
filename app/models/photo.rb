# == Schema Information
#
# Table name: photos
#
#  id                 :uuid             not null, primary key
#  owner_id           :uuid
#  deleted_at         :datetime
#  photo_file_name    :string(255)
#  photo_content_type :string(255)
#  photo_file_size    :integer
#  photo_updated_at   :datetime
#  attachable_type    :string(255)
#  attachable_id      :uuid
#

class Photo < ActiveRecord::Base
  acts_as_paranoid

  has_attached_file :photo
  attr_accessible :photo_file_name, :photo_content_type, :photo_file_size, :photo_updated_at
  attr_accessible :photo, :owner
  attr_accessible :attachable_id, :attachable_type

  belongs_to :owner, :foreign_key => 'owner_id', :class_name => "User"
  belongs_to :attachable, polymorphic: true

end
