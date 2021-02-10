class Journal < ApplicationRecord
  #belongs_to :author, class_name: "User", foreign_key: :author_id
  belongs_to :user
  has_many :tags, as: :taggable

  validates :title, :body, presence: true

  TAGS = %w[musing journal note]
end
