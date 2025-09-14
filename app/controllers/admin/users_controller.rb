class Admin::UsersController < Admin::BaseController
  before_action :set_user, only: [:block, :destroy]

  def index
    @users = User.all 
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.js
    end
  end

  def block
    if @user.blocked?
      @user.update(blocked_at: nil)
    else
      @user.update(blocked_at: Time.now)
    end

    respond_to do |format|
      format.js
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
