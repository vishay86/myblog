class PagesController < ApplicationController
  def home
    if current_user
      flash[:success] = 'Welcome'
      redirect_to articles_path
    end
  end
end
