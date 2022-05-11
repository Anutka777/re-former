class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    # @user = User.new(username: params[:username], email: params[:email], password: params[:password])

    if @user.save
      redirect_to new_user_path, notice: "Thank you. Your profile has been created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
