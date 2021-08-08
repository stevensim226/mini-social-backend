class StatusUpdate < ApplicationRecord
    validates :name, presence: true
    validates :content, presence: true
    
    has_many :comment

    def as_json(options=nil)
        { id: self.id, name: self.name, content: self.content, pfp_url: self.pfp_url }
    end
end
