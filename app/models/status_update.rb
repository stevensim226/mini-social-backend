class StatusUpdate < ApplicationRecord
    validates :name, presence: true
    validates :content, presence: true
    
    has_many :comment, dependent: :delete_all

    def as_json(options=nil)
        { 
            id: self.id, name: self.name, 
            content: self.content, pfp_url: self.pfp_url, 
            comment_count: self.get_comment_count,
            created_at: self.created_at
        }
    end

    def get_comments
        Comment.where(:status_update_id => self.id)
    end

    def get_comment_count
        Comment.where(:status_update_id => self.id).length
    end
end
