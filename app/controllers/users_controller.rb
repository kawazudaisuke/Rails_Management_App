class UsersController < ApplicationController
  
  before_action :date
  
  def index
    @users = User.all
    @count = User.count
  end
  
  def new
    @user = User.new
    
  end

  def create
    @user = User.new(params.require(:user).permit(:content, :start, :end, :allday, :notes))
    if @user.save
      flash[:notice] = "予定を新規登録しました"
      redirect_to :users
    else
      render "new"
    end
  end

  def show
    @user = User.find(params[:id])

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(params.require(:user).permit(:content, :start, :end, :allday, :notes))
       flash[:notice] = "予定表を変更しました"
       redirect_to :users
    else
       render "edit"
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "予定を削除しました"
    redirect_to :users
  end
  
  private
  
  def date
    @date = Date.current.strftime("%Y年 %-m月 %-d日")
  end
end
