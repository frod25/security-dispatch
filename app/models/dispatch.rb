class Dispatch < ApplicationRecord
    belongs_to :user
    has_many :comments, dependent: :destroy
    has_many :votes, dependent: :destroy
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

    def upvotes
        self.votes.sum(:upvote)
    end

    def downvotes
        self.votes.sum(:downvote)
    end

    def calc_score
        self.points = self.upvotes - self.downvotes
        time_since_posted = ((Time.now - self.created_at) / 3600).round
        time_weighted_score = score(points, time_since_posted)
        update_attributes(points: points, score: time_weighted_score)
    end

    def score(points, time_since_posted, gravity = 1.8)
        (points - 1) / (time_since_posted + 2) ** gravity    
    end

    def self.best_scores
        self.all.order(score: :desc)
    end
end
