class Post < ApplicationRecord

  extend FriendlyId
  friendly_id :title, use: [:slugged, :history, :finders]

  is_impressionable

  belongs_to :author
  has_many :elements
  has_many :order_items

  has_one_attached :header_image, dependent: :destroy
  validates :header_image, content_type: [:png, :jpg, :jpeg]

  def should_generate_new_friendly_id?
    title_changed?
  end
end
