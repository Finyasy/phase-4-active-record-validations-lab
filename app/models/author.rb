class Author < ApplicationRecord
     # Basic validations
    # is expected to validate that :name cannot be empty/falsy (FAILED - 1)
    validates :name, presence: true
    # is expected to validate that :name is case-sensitively unique (FAILED - 2)
    validates :name, uniqueness: true
    # is expected to validate that the length of :phone_number is 10 (FAILED - 3)
    validates :phone_number, length: { is: 10 }
end
