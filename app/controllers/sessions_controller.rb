class SessionsController < ApplicationController
  def new
  end

  def create
    user = login(params[:email], params[:password], params[:remember_me])
    if user
      redirect_back_or_to new_article_path
    else
      flash.now.alert = 'Invalid email or password'
      redirect_to :back
    end
  end

  def destroy
    logout
    redirect_to action: 'new'
  end
end
