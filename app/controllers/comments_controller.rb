class CommentsController < ApplicationController

before_action :set_post, only: [:show, :edit, :update, :destroy]
  def index
    @photo = Photo.find(params[:photo_id])
    @comments = @photo.comments
    @comment = Comment.new
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    
  end

  # GET /comments/1/edit
  def edit
  end

  def create
    @photo = Photo.find(params[:photo_id])
    @new_comment = Comment.new(comment_params)
    # @new_comment = @photo.comment.build(comment_params)
    @new_comment.user = current_user
    @new_comment.photo = @photo

    respond_to do |format|
      if @new_comment.save
        format.html { redirect_to photo_comments_url(@photo), notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @new_comment }
      else # Validation errors
        format.html { render :index }
        format.json { render json: @new_comment.errors, status: :unprocessable_entity }
      end
    end

  end # end create method

  private
  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_post
    @photo = Photo.find(params[:photo_id])
  end
end
