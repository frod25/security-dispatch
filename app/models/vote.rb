class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :dispatch

  validates :user_id, uniqueness: { scope: :dispatch_id }
end
