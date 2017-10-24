class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:show] 
  
  def index
  end

  def show
    @user = User.find(params[:id])
    @masterscores = Masterscore.where(user_id: params[:id])
    
    if @masterscores.count > 0
      @average = @masterscores.average(:total_score).round(1)
      @best = @masterscores.minimum(:total_score)
    else
      @average = '-'
      @best = '-'
    end


  end

  def new
    @user = User.new 
  end

  def create
    @user = User.new(user_params) 
 
    if @user.save 
      flash[:success] = 'ユーザを登録しました。' 
      redirect_to @user 
    else 
      flash.now[:danger] = 'ユーザの登録に失敗しました。' 
      render :new 
    end 

  end
  
  private 
 
  def user_params 
    params.require(:user).permit(:name, :email, :password, :password_confirmation) 
  end 
 
end
