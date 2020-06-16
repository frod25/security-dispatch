class User < ApplicationRecord
    has_secure_password
    validates :username, presence: true, length: { minimum: 3 }, uniqueness: { case_sensitive: false }
    validates :password, length: { minimum: 8 }, :if => :password
    
    has_many :comments, dependent: :destroy
    has_many :dispatches, dependent: :destroy
end
