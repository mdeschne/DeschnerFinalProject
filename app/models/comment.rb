class Comment < ApplicationRecord

  validates :user_id, :medium_id, :body, :presence => true

  belongs_to :medium
  belongs_to(:user, class_name: "User", foreign_key: "user_id")

end
