class Task < ApplicationRecord

    validates :title, presence: true
    validates :description, presence: true
    
    def soft_delete
        update(deleted_at: DateTime.now)
    end
end
