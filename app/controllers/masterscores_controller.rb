class MasterscoresController < ApplicationController

	def index
		
	end
	
	def show
    @masterscore = Masterscore.find(params[:id])
    @scores = @masterscore.scores
  end
	
	def new
		@masterscore = Masterscore.new
		18.times {@masterscore.scores.build}
		
		@url = params[:url]
		@course_code = params[:course_code]
		@course_name = params[:name]

	end
	
	def create
	  
	  @masterscore = current_user.masterscores.build(masterscore_params)

    if @masterscore.save
      flash[:success] = 'スコアを登録しました。' 
      redirect_to user_path(id: current_user.id)
    else 
      flash[:danger] = 'スコアの登録に失敗しました。' 
      redirect_to new_course_path
    end 
    
  end
  
  def edit
    @masterscore = Masterscore.find(params[:id])
    @scores = @masterscore.scores
  end
  
  def update
    @masterscore = Masterscore.find(params[:id])


    if @masterscore.update(update_masterscore_params)
      flash[:success] = 'スコアを登録しました。' 
      redirect_to @masterscore
    else 
      flash[:danger] = 'スコアの登録に失敗しました。' 
      redirect_to @masterscore
    end 
    
  end
  
  def destroy
    @masterscore = Masterscore.find(params[:id])
    @masterscore.destroy
    
    flash[:success] = 'スコアは正常に削除されました' 
    redirect_to user_path(id: current_user.id)
    
  end
  
  private 
 
  def masterscore_params 
    params.require(:masterscore).permit(:user_id, :total_score, :date, :course_code, :course_name , scores_attributes: [:masterscore_id, :hole_no, :hole_score, :_destroy]) 
  end 
  
  # def masterscore_information
  #   masterscore_params.merge(@masterscore.total_score)
  # end
	
	def update_masterscore_params 
    params.require(:masterscore).permit(:user_id, :total_score, :date, :course_code, :course_name , scores_attributes: [:masterscore_id, :hole_no, :hole_score, :_destroy, :id]) 
  end 
	
end
