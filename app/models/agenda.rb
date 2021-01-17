class Agenda < ApplicationRecord
  belongs_to :user
  has_rich_text :body
  has_many :tags, as: :taggable
end
