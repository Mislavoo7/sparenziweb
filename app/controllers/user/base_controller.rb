class User::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :set_lists
  layout 'application'

  def set_lists
    redirect_to root_path if current_user.blank?
    @lists = current_user.lists
    @shop_names = current_user.lists.pluck(:shop_name).uniq
    @latest_date = current_user.lists.maximum(:taken_at)
    @earliest_date = @latest_date.beginning_of_month
    @today = DateTime.now
  end
end
