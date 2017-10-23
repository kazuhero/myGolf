class MasterscoresController < ApplicationController

	def index
		
	end
	
	def show
    @masterscore = Masterscore.find(params[:id])
  end
	
	def new
		@masterscore = Masterscore.new
		@name = params[:name]
		@url = params[:url]
	end
	
	def create
    @masterscore = Masterscore.new(masterscore_params) 
 
    if @masterscore.save 
      flash[:success] = 'スコアを登録しました。' 
      redirect_to @user
    else 
      flash.now[:danger] = 'スコアの登録に失敗しました。' 
      render :new
    end 
    
  end
  
  private 
 
  def masterscore_params 
    params.require(:masterscore).permit(:user_id, :course_id, :total_score, :date) 
  end 
	
end
