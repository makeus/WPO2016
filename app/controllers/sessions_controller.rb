class SessionsController < ApplicationController
  def new
  end

  def create
    if user.nil?
      redirect_to :back, notice: "User #{params[:username]} does not exist!"
    else
      user = User.find_by username: params[:username]
      session[:user_id] = user.id if not user.nil?
      redirect_to user
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to :root
  end
end