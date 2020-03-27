class Note < ActiveRecord::Base
    belongs_to :category

    validates :title,
        presence: { message: 'is a required field' },
        length: { in: 3..20, message: 'is either too short or too long' }

    validates :description,
        presence: { message: 'is a required field' },
        length: { minimum: 10, message: 'is too short' }
end
