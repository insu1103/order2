class MenusController < ApplicationController
  before_action :set_menu, only: [:show, :edit, :update, :destroy]

  # GET /menus
  # GET /menus.json
  def index
    @menus = Menu.all
    @menu_new = Menu.new
  end

  # GET /menus/1
  # GET /menus/1.json
  def show
  end

  # GET /menus/new
  def new
    @category = Category.find(params[:category_id])
    @store = @category.stores.find(params[:store_id])
    @menu = @store.menus.new
  end

  # GET /menus/1/edit
  def edit
    @category = Category.find(params[:category_id])
    @store = @category.stores.find(params[:store_id])
    @menu = @store.menus.find(params[:id])
  end

  # POST /menus
  # POST /menus.json
  def create
    @category = Category.find(params[:category_id])
    @store = @category.stores.find(params[:store_id])
    @menu = @store.menus.create(menu_params)
    redirect_to category_store_menus(@category,@store)
  end
  
  # PATCH/PUT /menus/1
  # PATCH/PUT /menus/1.json
  def update
    @category = Category.find(params[:category_id])
    @store = @category.stores.find(params[:store_id])
    @menu = @store.menus.find(params[:id])
    redirect_to category_stores_path(@store)
  end

  # DELETE /menus/1
  # DELETE /menus/1.json
  def destroy
    @category = Category.find(params[:category_id])
    @store = @category.stores.find(params[:store_id])
    @menu.destroy
    redirect_to category_stores_path(@store)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu
      @menu = Menu.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def menu_params
      params.require(:menu).permit(:f_name, :price, :store_id)
    end
end
