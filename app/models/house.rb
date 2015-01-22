# == Schema Information
#
# Table name: houses
#
#  id                     :integer          not null, primary key
#  location               :string(255)
#  numberOfBedRooms       :integer
#  numberOfBathRooms      :integer
#  numberOfReceptionRooms :integer
#  size                   :integer
#  security               :string(255)
#  price                  :decimal(8, 2)    default(0.0)
#  created_at             :datetime
#  updated_at             :datetime
#

class House < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader
end
