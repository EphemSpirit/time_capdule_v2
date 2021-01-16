class TagsController < ApplicationController

  def create
    @tag = @taggable.tags.new(tag_params)
    @tag.save
    redirect_to my_dashboard_path
    flash[:notice] = "Entry added!"
  end

  def search
    @results = Tag.all.includes(:taggable).select{ |x| x.name.include?(params[:tags][:tag]) }.map{ |x| x.taggable }
  end


  private

    def tag_params
      params.require(:tag).permit(:name)
    end

end
