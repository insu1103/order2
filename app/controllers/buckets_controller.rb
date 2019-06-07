class BucketsController < ApplicationController
  before_action :set_bucket, only: [:show, :edit, :update, :destroy]

  # GET /buckets
  # GET /buckets.json
  def index
    @buckets = Bucket.all

  end

  # GET /buckets/1
  # GET /buckets/1.json
  def show
  end

  # GET /buckets/new
  def new
    @bucket = Bucket.new
  end

  # GET /buckets/1/edit
  def edit
  end

  # POST /buckets
  # POST /buckets.json
  def create
    @bucket = Bucket.new(bucket_params)

    respond_to do |format|
      if @bucket.save
        format.html { redirect_to @bucket, notice: 'Bucket was successfully created.' }
        format.json { render :show, status: :created, location: @bucket }
      else
        format.html { render :new }
        format.json { render json: @bucket.errors, status: :unprocessable_entity }
      end
    end
  end

  def create_bucket
      @bucket = Bucket.new()
      @bucket.store_id = params[:store_id]
      @bucket.menu_id = params[:menu_id]
      @bucket.save

      respond_to do |format|
        format.js {render inline: "location.reload();"}
      end
  end

  def change_acount1
    @bucket = Bucket.find(params[:bucket_id])
    #@bucket.increment!(:acount)
    @bucket.increment!(:acount)
    respond_to do |format|
        format.js {render inline: "location.reload();"}
      end
  end

    def change_acount2
    @bucket = Bucket.find(params[:bucket_id])
    @bucket.decrement!(:acount)
    respond_to do |format|
        format.js {render inline: "location.reload();"}
      end
  end

  # PATCH/PUT /buckets/1
  # PATCH/PUT /buckets/1.json
  def update
    respond_to do |format|
      if @bucket.update(bucket_params)
        format.html { redirect_to @bucket, notice: 'Bucket was successfully updated.' }
        format.json { render :show, status: :ok, location: @bucket }
      else
        format.html { render :edit }
        format.json { render json: @bucket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /buckets/1
  # DELETE /buckets/1.json
  def destroy
    @bucket.destroy
    respond_to do |format|
        format.js {render inline: "location.reload();"}
      end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bucket
      @bucket = Bucket.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bucket_params
      params.require(:bucket).permit(:integer, :total)
    end
end
