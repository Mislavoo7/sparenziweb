class User::ListsController < User::BaseController
  before_action :set_list, only: [:edit, :update, :destroy, :visibility]

  def index
    @currency = params[:currency] || current_user.currency
    lists = current_user.lists
    @lists = lists.where(currency: @currency)
    @currencies = lists.pluck(:currency).uniq
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    current_user.lists << @list
    if @list.save
      redirect_to user_root_path, notice: t('message.created')
    else
      render :new
    end
  end

  def update
    if @list.update(list_params)
      redirect_to user_root_path, notice: t('message.updated')
    else
      render :show
    end
  end

  def destroy
    @list.destroy
    respond_to do |format|
      format.js
    end
  end

  def sort
    params[:ids].each_with_index do |id, index|
      List.where(id: id).update_all(position: index + 1)
    end
  end

  def visibility
    if @list.update_column(:is_visible, !@list.is_visible)
      flash.now[:notice] = @list.is_visible ? t("list.is_now_visible") : t("list.is_now_invisible")
    end
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:shop_name, :currency, :taken_at, :total_price_in_cent)
  end
end
