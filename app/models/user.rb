class User < ApplicationRecord
    has_secure_password
    validates :username, presence: true, length: { minimum: 3 }, uniqueness: { case_sensitive: false }
    validates :password, length: { minimum: 8 }
    
    has_many :comments
    has_many :dispatches
    # has_many :dispatches, through: :comments
    # has_many :comments, through: :dispatches
end
