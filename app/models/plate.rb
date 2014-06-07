class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_and_belongs_to_many :tags
  has_and_belongs_to_many :watchers, :join_table => "post_watchers", :class_name => "User"
  attr_accessor :tag_names
  validates :title, :presence => true,
  length: { minimum: 6 }
  validates :content, :presence => true
  validates :author, :presence => true
  mount_uploader :asset, AssetUploader
  
  before_create :associate_tags
  private
    def associate_tags
      if tag_names
        tag_names.split(" ").each do |name|
          self.tags << Tag.find_or_create_by(name: name)
        end
      end
    end
end
