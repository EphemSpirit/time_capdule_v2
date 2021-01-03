class Tag < ApplicationRecord
  belongs_to :taggable, polymorphic: true
  belogns_to :journal
end
