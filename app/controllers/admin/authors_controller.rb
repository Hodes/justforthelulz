class Admin::AuthorsController < AdminController
  before_filter :require_login

  def edit
    @author = current_user
  end

  def update
    @author = current_user

    if @author.update(author_params)
      flash.now[:success] = 'Saved!'
    else
      flash.now[:error] = 'Ops! An error occurred'
    end

    render 'edit'
  end

  private
    def author_params
      params.require(:author).permit(:name, :email, :avatar)
    end
end
