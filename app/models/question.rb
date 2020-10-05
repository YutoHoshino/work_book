class Question < ApplicationRecord

  def self.search(search)
    if search
      Question.where('question LIKE(?)', "%#{search}%")
    else
      Question.all
    end
  end
end
