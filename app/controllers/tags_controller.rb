class TagsController < ApplicationController

  def create
    @tag = @taggable.tags.create(tag_params)
    @tag.save
    redirect_to my_dashboard_path
    flash[:notice] = "Entry added!"
  end


  private

    def tag_params
      params.require(:tag).permit(:name)
    end

end
