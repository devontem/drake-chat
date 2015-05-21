class Comment < ActiveRecord::Base
  #connects to the user model
  belongs_to :user
  
  #database validation for the body column of comment model
  validates :body, presence: true, length: {maximum: 2000}
end
