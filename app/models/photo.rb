class Photo < ApplicationRecord
  belongs_to :user
  has_many :tags, as: :taggable
  has_one_attached :image

  validates :image, attached: true
  validates :image, content_type: { in: %w[image/jpeg, image/gif, image/png],
                                    message: "Must be a valid image type" },
                                    size: { less_than: 10.megabytes, message: "Must be 10mg or smaller" }
  validates :summary, presence: true
  validates :summary, length: { maximum: 150 }

  def show_image
    image.variant(resize_to_limit: [500, 500])
  end

end
