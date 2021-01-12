class PhotosController < ApplicationController
  before_action :find_photo, except: [:index, :new, :create]

  def index
    @photos = current_user.photos
  end

  def new
    @photo = current_user.photos.build
  end

  def create
    @photo = current_user.photos.build(photo_params)
    @photo.image.attach(params[:photo][:image])

    if @photo.save
      flash[:notice] = "Add tags to make this entry searchable!"
      redirect_to edit_photo_path(@photo.id)
    else
      flash[:notice] = "Something went wrong, please try again"
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @photo.update(permitted_params)
    tags.each { |tag| @photo.tags.create(name: tag) }
  end

  def destroy
    @photo.destroy
    flash[:notice] = "Photo successfulyl removed"
    redirect_to my_photos_path
  end

  private

    def find_photo
      @photo = Photo.find(params[:id])
    end

    def photo_params
      permitted_params.except(:tags)
    end

    def permitted_params
      params.require(:photo).permit(:title, :summary, :image, :tags)
    end

    def tags
      permitted_params.slice(:tags).reject(&:empty?)
    end

end
