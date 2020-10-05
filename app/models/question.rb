class Question < ApplicationRecord
  has_many :question_similars, dependent: :destroy
  

  def self.search(search)
    if search
      Question.where('question LIKE(?)', "%#{search}%")
    else
      Question.all
    end
  end
end
