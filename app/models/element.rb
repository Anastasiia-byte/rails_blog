class Element < ApplicationRecord
  belongs_to :post

  validates :element_type, inclusion: { in: ['paragraph', 'video-embed', 'image']}

  has_rich_text :content
end
