class Plate < ActiveRecord::Base
  has_many :translations, dependent: :destroy
  validates :plate_number, :presence => true, length: { maximum: 9 }
  belongs_to :user
  accepts_nested_attributes_for :translations, :reject_if => :all_blank
#  :reject_if => lambda { |a| a[:meaning].blank? }
  attr_accessor :input_rating
#  mount_uploader :asset, AssetUploader
end
