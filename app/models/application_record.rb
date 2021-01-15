class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.tagged_with(name)
    Tag.find_by!(name: name).journals
  end

  def tag_list
    tags.map(&:name).join(", ")
  end

  def tag_list=(names)
    self.tags = names.split(",").map { |n| Tag.where name: n.strip.first_or_create! }
  end

  def clean_tags
    self.tags.map(&:name).reject(&:nil?)[0].split(", ")
  end

end
