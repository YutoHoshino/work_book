class HomesController < ApplicationController

  def index
    @question = Question.count
  end

end
