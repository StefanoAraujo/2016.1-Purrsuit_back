
class User < ActiveRecord::Base
  acts_as :person
  belongs_to :level
  has_many :active_relationships, class_name: "Relationship",
                                  foreign_key: "follower_id",
                                  dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_secure_password

  validates :email, presence: true, length: {maximum: 255}
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
	validates :nickname, presence: true, length: { maximum: 20 }, uniqueness: true
# :nocov:
  def admin?
    self.role_admin
  end
# :nocov:
  def follow(deputy)
    active_relationships.create(followed_id: deputy.id)
    deputy.followers_count += 1
    deputy.save
  end

  def unfollow(deputy)
    active_relationships.find_by(followed_id: deputy.id).destroy
    deputy.followers_count -= 1
    deputy.save
  end

  def following?(deputy)
    following.include?(deputy)
  end

end
