class Post < ApplicationRecord
  acts_as_taggable_on :tags

  belongs_to :author
  has_many :elements
  has_many :comments

  has_one_attached :header_image

  validates_presence_of :title, :description
  # validates_length_of :description, within: 50..150

  

  scope :published, -> do
    where(published: true)
  end

  scope :most_recently_published, -> do
    order(publish_date: :desc)
  end  

  

end
