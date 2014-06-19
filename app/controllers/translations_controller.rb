class TranslationsController < ApplicationController
  before_action :set_plate
  before_action :set_translation, only: [:show, :edit, :update, :destroy]
#  before_action :sign_in_as!(user)
#  before_action :require_signin!, except: [:show, :index]
 
  def new
    @translation = @plate.translations.build
  end
  
# def edit
#    @comment = Comment.find(comment_params)
#   @comment = @post.comments.find(params[:id])
# end
  
  def create
    @translation = @plate.translations.build(translation_params)
    @translation.user = current_user
    if @translation.save
      flash[:notice] = "Translation has been saved."
      redirect_to @plate
    else
      flash[:alert] = "Translation has not been saved."
      render "new"
    end
  end
  
  def update
    if @translation.update(translation_params)
      flash[:notice] = "Translation has been updated."
      redirect_to @plate
    else
      flash[:alert] = "Translation has not been updated."
      render "new"
    end
  end
  
#  def destroy
#  @post = Post.find(params[:post_id])
#   @comment = @post.comments.find(params[:id])
#   @comment.destroy
#   redirect_to post_path(@post)
    
    def destroy
      @translation.destroy
      flash[:notice] = "Translation has been deleted."
      redirect_to @plate

  end
  
  private
  def set_plate
    @plate = Plate.find(params[:plate_id])
  end
  
  def set_translation
#   @comment = Comment.find(params)
#   @comment = Comment.find(params[:id])
    @translation = @plate.translations.find(params[:id])
  end
  
  def translation_params
    params.require(:meaning)
  end
end