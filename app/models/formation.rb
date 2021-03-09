class Formation < ApplicationRecord
    belongs_to :teacher, class_name: "User"
    has_and_belongs_to_many :categories, dependent: :destroy
    has_many :formationsessions, dependent: :destroy
  
    validates :title, presence: true
end
