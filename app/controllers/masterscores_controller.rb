class MasterscoresController < ApplicationController

	def index
		
	end
	
	def show
    @masterscore = Masterscore.find(params[:id])
  end
	
	def new
		@masterscore = Masterscore.new
		18.times {@masterscore.scores.build}
		
		@name = params[:name]
		@url = params[:url]
		@course_code = params[:course_code]
		
	end
	
	def create
	  
	  @masterscore = current_user.masterscores.build(masterscore_params)
    binding.pry

    if @masterscore.save 
      flash[:success] = 'スコアを登録しました。' 
      redirect_to user_path(id: current_user.id)
    else 
      flash[:danger] = 'スコアの登録に失敗しました。' 
      redirect_to new_course_path
    end 
    
  end
  
  private 
 
  def masterscore_params 
    params.require(:masterscore).permit(:user_id, :course_code, :total_score, :date, scores_attributes: [:hole_no, :hole_score]) 
  end 
	
end
