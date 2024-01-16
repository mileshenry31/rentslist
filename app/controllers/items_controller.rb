class ItemsController < ApplicationController
  before_action :set_item, only: %i[ show edit update destroy ]

  # GET /items or /items.json
  def index
    @items = Item.all
    # Geocoder.search(94558).first.data["lat"].to_f -- latitude
  end

  # GET /items/1 or /items/1.json
  def show
  end
  def locations_sorted
  end
  # GET /items/new
  def new
    @item = Item.new
  end
  # GET /items/1/edit
  def edit
  end

  # POST /items or /items.json
  def create
    #@item = Item.new(item_params)
    puts "item" + params[:item].inspect
    location = Location.find(params[:item][:location_id])
    puts "location" + location.inspect
    @item = location.items.new(item_params)
    @item.user = current_user
    #@item.price = params[:price]
    #puts "hereeeee" + params[:price]
    #@item.user_id = current_user.id
    #@item.location = current_user.locations.find_by(params[:location])
    @item.save
    respond_to do |format|
      if @item.save
        format.html { redirect_to item_url(@item), notice: "Item was successfully created." }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1 or /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to item_url(@item), notice: "Item was successfully updated." }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1 or /items/1.json
  def destroy
    @item.destroy

    respond_to do |format|
      format.html { redirect_to items_url, notice: "Item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:name, :desc, :location_id, :price)
    end
end
