class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/', notice: 'User registered and logged in!'
    else
      redirect_to '/signup'
    end
    # @user = User.new(user_params)

    # if @user.save
    #   redirect_to [:user, :categories], notice: 'User registered and logged in!'
    # else
    #   render :new
    # end
  end

  private

  def user_params
    params.require(:user).permit(
      :firtname,
      :lastname,
      :email,
      :password,
      :password_confirmation
    )
  end

end
