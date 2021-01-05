class TagsController < ApplicationController

  def new
    @tag = taggable.tags.new
  end

  def create
    @tag = taggable.tags.create(tag_params)

    if @tag.save?
      redirect_to my_entries_path
    else
      render :new
    end
  end


  private

    def tag_params
      params.require(:tag).permit(:name)
    end

end
