class Comment < ApplicationRecord
    belongs_to :status_update

    def as_json(options=nil)
        { id: self.id, content: self.content, created_at: self.created_at }
    end
end
