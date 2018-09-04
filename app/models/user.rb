class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :questions
  has_many :answers
  has_many :thanks
  has_many :question_likes
  has_many :questions, through: :question_likes
  has_many :answer_likes
  has_many :answers, through: :answer_likes

end
