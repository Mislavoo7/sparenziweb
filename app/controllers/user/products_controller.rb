class User::ProductsController < User::BaseController
  before_action :set_list, except: [:update, :destroy]
  before_action :set_product, only: [:edit, :update, :destroy, :visibility]

  def index
    @products = current_user.products
  end

  def new
    @product = Product.new
    respond_to do |format|
      format.js
    end
  end

  def create
    change_price_to_cent
    @product = Product.new(product_params)
    @list.products << @product

    # to metch js's Date.now().toString()
    @product.save
    respond_to do |format|
      format.js
    end
  end

  def edit
    respond_to do |format|
      format.js
    end
  end

  def update
    change_price_to_cent
    @product.update(product_params)
  # need to get the @price liste late (not in the before_actio) bc recalculating total price will happen after update/save/destroy
    set_list 
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @product.destroy
  # need to get the @price liste late (not in the before_actio) bc recalculating total price will happen after update/save/destroy
    set_list 
    respond_to do |format|
      format.js
    end
  end

  def sort
    params[:ids].each_with_index do |id, index|
      Product.where(id: id).update_all(position: index + 1)
    end
  end

  def visibility
    if @product.update_column(:is_visible, !@product.is_visible)
      flash.now[:notice] = @product.is_visible ? t("product.is_now_visible") : t("product.is_now_invisible")
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def set_list
    @list = List.find(params[:list_id])
  end

  def product_params
    params.require(:product).permit(:price_for_enter, :price_in_cent, :product_name, :company)
  end

  def change_price_to_cent
    price = params[:product]["price_for_enter"].gsub(",", ".")
    params[:product]["price_in_cent"] = price.to_f * 100
  end
end
