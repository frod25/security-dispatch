class Dispatch < ApplicationRecord
    belongs_to :user
    has_many :comments
    has_many :users, through: :comments

    validates :title, presence: true

    def full_url
        if self.url.strip == ""
            self.url = nil
        elsif !self.url.include?("http://")
            self.url = "https://" + self.url.strip
        end
        self.url
    end
end
