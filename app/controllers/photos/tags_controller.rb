class Photos::TagsController < TagsController
  before_action :set_taggable

  private

    def set_taggable
      @taggable = Photo.find(params[:photo_id])
    end
    
end
