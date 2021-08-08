class StatusUpdate < ApplicationRecord
    validates :name, presence: true
    validates :content, presence: true
    
    has_many :comment, dependent: :delete_all

    def as_json(options=nil)
        { id: self.id, name: self.name, content: self.content, pfp_url: self.pfp_url }
    end

    def get_comments
        Comment.where(:status_update_id => self.id)
    end
end
