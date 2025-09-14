class Api::V1::ListsController < Api::V1::BaseController
  include PaginationHandler 
  before_action :authenticate_user
  before_action :set_list, only: [:show, :update, :destroy]
  # GET /api/v1/lists
  def index
    get_lists
    render json: {
      success: true,
      page: params["page"],
      total_lists: @lists.total_pages,
      lists: @lists.map do |list|
        make_body(list)
      end
    }, status: :ok
  end
  # GET /api/v1/lists/:id
  def show
    render json: {
      success: true,
      list: make_body(@list),
      products: @list.products.map do |product|
        make_product_body(product)
      end 
    }, status: :ok
  end
  # POST /api/v1/lists
  def create
    @list = current_user.lists.build(list_params)
    if @list.save
      render json: {
        success: true,
        message: 'List created successfully',
        list: make_body(@list)
      }, status: :created
    else
      render json: {
        success: false,
        message: 'Failed to create list',
        errors: @list.errors.full_messages
      }, status: :unprocessable_entity
    end
  end
  # PATCH/PUT /api/v1/lists/:id
  def update
    if @list.update(list_params)
      get_lists
      render json: {
        success: true,
        lists: @lists.map do |list|
          make_body(list)
        end
      }, status: :ok
    else
      render json: {
        success: false,
        message: 'Failed to update list',
        errors: @list.errors.full_messages
      }, status: :unprocessable_entity
    end
  end
  # DELETE /api/v1/lists/:id
  def destroy
    if @list.destroy
      get_lists
      render json: {
        success: true,
        lists: @lists.map do |list|
          make_body(list)
        end
      }, status: :ok
    else
      render json: {
        success: false,
        message: 'Failed to delete list'
      }, status: :unprocessable_entity
    end
  end
  private
  def set_list
    @list = current_user.lists.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: {
      success: false,
      message: 'List not found'
    }, status: :not_found
  end
  def list_params
    params.require(:list).permit(:shop_name, :taken_at, :currency,
                                 products_attributes: [:company, :price_in_cent, :product_name, :app_id]
                                )
  end
  def get_lists
    @all_lists = current_user.lists.order(created_at: :desc)
    @lists = apply_pagination(@all_lists, 6)
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
      app_id: product.app_id,
      list_id: product.list_id,
      created_at: product.created_at,
      updated_at: product.updated_at
    }
  end
end
