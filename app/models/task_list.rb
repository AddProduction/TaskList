class TaskList < ApplicationRecord
  belongs_to :user
  
  validates :content, presence: true
  validates :status, length: {maximum: 10}
end
