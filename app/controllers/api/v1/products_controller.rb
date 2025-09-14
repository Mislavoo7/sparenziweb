class Api::V1::ProductsController < Api::V1::BaseController
  before_action :authenticate_user
  before_action :set_list
  before_action :set_product, only: [:destroy]
  
  # POST /api/v1/products
  def create
    @product = Product.new(product_params)
    @list.products << @product
    
    # Set app_id to current timestamp if not provided
    @product.app_id = product_params[:app_id] || Time.now.to_i.to_s
    
    if @product.save
      # Recalculate total price for the list
      @list.update(total_price_in_cent: @list.products.sum(:price_in_cent))
      
      render json: {
        success: true,
        list: make_body(@list),
        products: @list.products.map { |product| make_product_body(product) }
      }, status: :created
    else
      render json: {
        success: false,
        message: 'Failed to create product',
        errors: @product.errors.full_messages
      }, status: :unprocessable_entity
    end
  rescue => e
    Rails.logger.error "Error creating product: #{e.message}"
    render json: {
      success: false,
      message: 'An error occurred while creating the product'
    }, status: :internal_server_error
  end
  
  # DELETE /api/v1/products/:id
  def destroy
    if @product.destroy
      @list.update(total_price_in_cent: @list.products.sum(:price_in_cent))
      
      render json: {
        success: true,
        list: make_body(@list),
        products: @list.products.map { |product| make_product_body(product) }
      }, status: :ok
    else
      render json: {
        success: false,
        message: 'Failed to delete product'
      }, status: :unprocessable_entity
    end
  rescue => e
    Rails.logger.error "Error deleting product: #{e.message}"
    render json: {
      success: false,
      message: 'An error occurred while deleting the product'
    }, status: :internal_server_error
  end
  
  private
  
  def set_product
    @product = @list.products.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: {
      success: false,
      message: 'Product not found'
    }, status: :not_found
  end
  
  def set_list
    @list = current_user.lists.find(params[:list_id])
  rescue ActiveRecord::RecordNotFound
    render json: {
      success: false,
      message: 'List not found'
    }, status: :not_found
  end
  
  def make_body(list)
    {
      id: list.id,
      currency: list.currency,
      shop_name: list.shop_name,
      taken_at: list.taken_at.strftime("%Y-%m-%d"),
      total_price_in_cent: list.total_price_in_cent,
      created_at: list.created_at,
      updated_at: list.updated_at
    }
  end
  
  def make_product_body(product)
    {
      id: product.id,
      company: product.company,
      price_in_cent: product.price_in_cent,
      product_name: product.product_name,
      app_id: product.app_id.to_s,
      list_id: product.list_id,
      created_at: product.created_at,
      updated_at: product.updated_at
    }
  end
  
  def product_params
    params.require(:product).permit(:company, :price_in_cent, :product_name, :app_id)
  end
end
