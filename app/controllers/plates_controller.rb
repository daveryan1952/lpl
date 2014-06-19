class PlatesController < ApplicationController
  def index
    @plates = Plate.all
  end
  
  def new
    @plate = Plate.new
    @plate.translations.build
  end

#def new
#  @survey = Survey.new
#  3.times do
#    question = @survey.questions.build
#    4.times { question.answers.build }
#  end
#end

  def create
    #@plate = Plate.new(params[:plate])
    #@translation = Translation.new(plate_params[:meaning].merge(plate_id: :id, user_id: 1))
    if plate_params[:meaning] then vote = 1 else vote = 0 end
      puts plate_params
    @plate = Plate.new(plate_params.merge(user_id: 1, rated_count: 1, rating: :input_rating, translation_votes: vote, translations_attributes: [ { plate_id: :id, user_id: 1, 
      votes: 1 }]))
#    @plate = Plate.new(plate_params.merge(user_id: 1, rated_count: 1, rating: :input_rating, #translation_votes: vote, translations_attributes: [ { plate_id: :id }, { user_id: 1 }, 
#      { meaning: :meaning }, { votes: 1 }]))
    if @plate.save
      flash[:notice] = "Plate has been created."
      #redirect_to index
      redirect_to plate_path(@plate)
    else
      flash[:alert] = "Plate has not been created"
      #flash[:error] = "Failed to create post."
      #redirect_to new_post_path
      render "new"
    end
  end
  
  def show
    @plate = Plate.find(params[:id])
  end
  
  private
  
  def plate_params
#    params.require(:plate).permit(:plate_number, :plate_image, :state, :input_rating,                # translations_attributes: [ :meaning ])
    params.require(:plate).permit!
  end
end
