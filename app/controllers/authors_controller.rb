class AuthorsController < ApplicationController
  layout 'admin'

  def edit
    @author = current_user
  end

  def update
    @author = current_user

    if @author.update(author_params)
      redirect_to new_article_path
    else
      render 'edit'
    end
  end

  private
    def author_params
      params.require(:author).permit(:name, :email, :avatar)
    end
end
