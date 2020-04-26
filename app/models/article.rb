class Article < ApplicationRecord
    has_many :comments, dependent: :destroy
    has_many :taggings, dependent: :destroy
    has_many :tags, through: :taggings

    def tag_list
        self.tags.collect do |tag|
            tag.name
        end.join(", ")
    end

    def tag_list=(tag_strings)
        tag_names = tag_strings.split(",").collect { |tag_string| tag_string.strip.downcase }.uniq
        new_or_found_tags = tag_names.collect { |name| Tag.find_or_create_by(name: name) }
        self.tags = new_or_found_tags
    end
end
