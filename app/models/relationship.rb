class Relationship < ActiveRecord::Base
   belongs_to :follower, class_name: "User"
   belongs_to :followed, class_name: "Deputy"
   validates :followed_id, presence: true
   validates :follower_id, presence: true
end
