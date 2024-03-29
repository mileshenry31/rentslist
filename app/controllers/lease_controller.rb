class LeaseController < ApplicationController
    #before_action :create, :index
    def index
        
    end
    def new
        @lease = Lease.new
        @lease.item_id = params[:item_id]
        @item = Item.find(params[:item_id])
        @lease.save
    end
    def create
        @lease = Lease.new(lease_params)
        puts "try" + lease_params.inspect
        @lease.id = Lease.all.length
        @item = Item.find(@lease.item_id)
        #@lease.item_id = @item.id
        @lease.save
        puts "hhehehe" + @lease.inspect
        @lessee = Lessee.new
        @lessee.user_id = current_user.id
        @lessee.lease = @lease
        @lessee.save
        puts "here" + @lessee.inspect
        @lessor = Lessor.new
        @lessor.user_id = @item.user_id
        @lessor.lease = @lease
        @lessor.save
        @lease.lessee_id = @lessee.id
        @lease.lessor_id = @lessor.id
        @lease.price = @item.price
        puts "tjere" + @lessor.inspect

        respond_to do |format|
            if @lease.save
                format.html { redirect_to root_path, notice: "Successfully rented." }
                format.json { render :index, status: :created }
            else
                format.html { render :index, status: :unprocessable_entity }
                format.json { render json: @item.errors, status: :unprocessable_entity }
            end
        end
    end
    private
    def lease_params
        params.require(:lease).permit(:price, :duration_days, :all_at_once, :item_id)
    end
end
