class StoresController < ApplicationController
  before_action :set_store, only: [:show, :edit, :update, :destroy]

  # GET /stores
  # GET /stores.json
  def index
    @stores = Store.all
  end

  # GET /stores/1
  # GET /stores/1.json
  def show
    @category = Category.find(params[:category_id])
    @store = @category.stores.find(params[:id])
  end

  # GET /stores/new
  def new
    @category = Category.find(params[:category_id])
    @store = @category.stores.new
  end

  # GET /stores/1/edit
  def edit
    @category = Category.find(params[:category_id])
    @store = @category.stores.find(params[:id])
  end

  # POST /stores
  # POST /stores.json
  def create
    @category = Category.find(params[:category_id])
    @store = @category.stores.create(store_params)
    redirect_to category_path(@category)
  end

  # PATCH/PUT /stores/1
  # PATCH/PUT /stores/1.json
  def update
    @category = Category.find(params[:category_id])
    @store = @category.stores.find(params[:id])
    @store.update(store_params)
    redirect_to category_path(@category)
  end

  # DELETE /stores/1
  # DELETE /stores/1.json
  def destroy
    @category = Category.find(params[:category_id])
    @store.destroy
    redirect_to category_path(@category)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_store
      @store = Store.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def store_params
      params.require(:store).permit(:s_name, :s_num, :s_add, :category_id)
    end
end
