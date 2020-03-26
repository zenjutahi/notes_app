class Category < ActiveRecord::Base
    has_many :notes
    belongs_to :user

    validates :name,
            presence: { message: 'is a required field' },
            uniqueness: { case_sensitive: false, message: 'has already been taken' },
            length: { in: 3..20, message: 'is either too short or too long' }
end
