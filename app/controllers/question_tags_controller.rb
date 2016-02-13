class QuestionTagsController < ApplicationController

  def index
    @tags = Tag.all
  end



end
