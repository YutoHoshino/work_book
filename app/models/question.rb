class Question < ApplicationRecord
  has_many :question_similars, dependent: :destroy
  accepts_nested_attributes_for :question_similars, allow_destroy: true
  
  validates :question, presence: true

  def self.search(search)
    if search
      Question.where('question LIKE(?)', "%#{search}%")
    else
      Question.all
    end
  end
  
end
