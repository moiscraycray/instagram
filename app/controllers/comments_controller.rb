class CommentsController < ApplicationController

  def index
    @photo = Photo.find(params[:photo_id])
    @comments = @photo.comments
    @comment = Comment.new
  end

  # def create
  #   @photo = Photo.new(photo_params)
  #   @photo.user = current_user # devise method
  #   respond_to do |format|
  #     if @photo.save
  #       format.html { redirect_to @photo, notice: 'Photo was successfully created.' }
  #       format.json { render :show, status: :created, location: @photo }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @photo.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end # end create method

end
