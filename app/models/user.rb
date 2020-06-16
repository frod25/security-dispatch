class User < ApplicationRecord
    has_secure_password
    validates :username, presence: true, length: { minimum: 3 }, uniqueness: { case_sensitive: false }
    validates :password, length: { minimum: 8 }, :if => :password
    
    has_many :comments, dependent: :destroy
    has_many :dispatches, dependent: :destroy
    has_many :votes

    def upvote(dispatch)
        self.votes.create(upvote: 1, dispatch: dispatch)
    end

    def upvoted?(dispatch)
        self.votes.exists?(upvote: 1, dispatch: dispatch)
    end

    def remove_vote(dispatch)
        self.votes.find_by(dispatch: dispatch).destroy
    end

    def downvote(dispatch)
        self.votes.create(dispatch_id: dispatch.id, downvote: 1)
    end
      
    def downvoted?(dispatch)
        self.votes.exists?(downvote: 1, dispatch: dispatch)
    end
end
