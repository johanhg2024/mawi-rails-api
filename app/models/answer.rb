class Answer < ApplicationRecord
    belongs_to :question,  foreign_key: "question_id", primary_key: "id"
    belongs_to :user,  foreign_key: "user_id", primary_key: "id"    
end
