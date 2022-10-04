class Post < ApplicationRecord
    validate :is_clickbait?
    # Post
    # can be created with valid data (FAILED - 1)
    # Basic validations
    #   is expected to validate that :title cannot be empty/falsy (FAILED - 2)
    validates :title, presence: true
    #   is expected to validate that the length of :content is at least 250 (FAILED - 3)
    validates :content, length: { minimum: 250 }
    #   is expected to validate that the length of :summary is at most 250 (FAILED - 4)
    validates :summary, length: { maximum: 250 }
    #   is expected to validate that :category is either ‹"Fiction"› or ‹"Non-Fiction"› (FAILED - 5)
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    # Custom validations: title is clickbait
    #   is expected to allow :title to be ‹"You Won't Believe These True Facts"› (FAILED - 6)
    #   is expected not to allow :title to be ‹"True Facts"› (FAILED - 7)
    def is_clickbait?
        if title && !title.match(/Won't Believe|Secret|Top [0-9]|Guess/)
            errors.add(:title, "must be clickbait")
        end
    end
end
