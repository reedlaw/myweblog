class UsersController < ActionController::Base
  before_filter :registration_open

  # render new.rhtml
  def new
  end

  def create
    @user = User.new(params[:user])
    @user.save!
    self.current_user = @user
    redirect_back_or_default('/')
    flash[:notice] = "Thanks for signing up!"
  rescue ActiveRecord::RecordInvalid
    render :action => 'new'
  end

  def registration_open
    if User.find(:all)
      redirect_back_or_default('/')
    end
  end
end
