class Note < ActiveRecord::Base
    belongs_to :category

    validates :name,
        presence: { message: 'is a required field' },
        uniqueness: { case_sensitive: false, message: 'has already been taken' },
        length: { in: 3..20, message: 'is either too short or too long' }

    validates :description,
        presence: { message: 'is a required field' },
        length: { minimum: 10, message: 'is too short' }
end
