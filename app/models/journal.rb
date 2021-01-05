class Journal < ApplicationRecord
  belongs_to :author, class_name: "User"
  has_rich_text :body
  has_many :tags, as: :taggable

  TAGS = %w[musing journal note]
end
