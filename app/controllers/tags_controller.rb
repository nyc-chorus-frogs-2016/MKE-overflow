class TagsController < ApplicationController


  def index
    @tags = Tag.all
    @tags = sort_tags(@tags)
  end

  def show
    @tag = Tag.find(params[:id])
  end


end
