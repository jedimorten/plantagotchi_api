class Admin::UsersController < Admin::BaseController
  def index
	@users = User.all(:order => "email")
  end

  def new
	@user = User.new
  end

  def create
	@user = User.new(params[:user])
	if @user.save
	  flash[:notice] = "User has been create."
	  redirect_to admin_users_path
	else
	  flash[:alert] = "User was not created"
	  render :action => "new"
	end
  end
end
