class Admin::ProductsController < Admin::BaseController
  before_action :set_list
  before_action :set_product, only: [:edit, :update, :destroy, :visibility]

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @list.products << @product
    if @product.save
      redirect_to admin_products_path, notice: t('message.created')
    else
      render :new
    end
  end

  def update
    if @product.update(product_params)
      redirect_to admin_products_path, notice: t('message.updated')
    else
      render :show
    end
  end

  def destroy
    @product.destroy
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
    @list = List.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:company, :price_in_cent, :product_name, :app_id)
  end
end
