class TaskList < ApplicationRecord
    validates :status, presence: true, length: {maximum: 10}
    
    def select(keyword)
        words = { done: 1, yet: 2 }
        self.status = words[keyword.to_sym].to_i
    end
end
