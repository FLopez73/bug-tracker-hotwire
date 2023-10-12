class Bug < ApplicationRecord
    validates :description, :priority, :assignee, presence:true
end
