class Participation < ApplicationRecord
    belongs_to :student, class_name: "User"
    belongs_to :formaitonsession
end
