class Journal < ApplicationRecord
  belongs_to :author, class_name: "User"
  has_many :tags, as: :taggable

  validates :title, :body, presence: true

  TAGS = %w[musing journal note]
end
