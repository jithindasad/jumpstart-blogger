class Tag < ApplicationRecord
    has_many :taggings
    has_many :articles, through: :taggings

    # fetch tag_list array overriding Tag#to_s method
    # def to_s
    #     name
    # end
end
