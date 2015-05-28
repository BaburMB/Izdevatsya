class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
      sign_in user
      remember user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      flash[:info] = 'Hi, ' + user[:name] + '!'
      redirect_back_or user
    else
      # Create an error message.
      flash.now[:danger] = 'Invalid inputs'
      render 'new'
    end
  end

  def destroy
    sign_out if signed_in?

    redirect_to root_url
  end
end
