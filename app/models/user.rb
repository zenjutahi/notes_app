class User < ActiveRecord::Base
    has_many :categories
    has_secure_password
    validates :email, presence: { message: 'is a required field' },
        uniqueness: { message: 'has already been taken' }

    validates :username, uniqueness: { message: 'has already been taken' },
                        presence: { message: 'is a required field' }
end
