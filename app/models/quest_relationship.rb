class QuestRelationship < ActiveRecord::Base
  belongs_to :challenged, class_name: "User"
  belongs_to :challenger, class_name: "Quest"
  validates :challenged_id, presence: true
  validates :challenger_id, presence: true
end
