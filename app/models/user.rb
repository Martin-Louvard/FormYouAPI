class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :role, presence: true

  has_many :assigned_formations, foreign_key: 'teacher_id', class_name: "Formation"
  has_many :participations, foreign_key: 'student_id', class_name: "Participation"

  enum role: { student: "student", admin: "admin", teacher: "teacher"}

end
