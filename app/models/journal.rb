class Journal < ApplicationRecord
  belongs_to :author, class_name: "User", foreign_key: :author_id
  has_many :tags, as: :taggable

  validates :title, :body, presence: true

  TAGS = %w[musing journal note]
end
