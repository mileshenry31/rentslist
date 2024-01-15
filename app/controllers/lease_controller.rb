class LeaseController < ApplicationController
    #before_action :create, :index
    def index
        
    end
    def new
        @lease = Lease.new
    end
    def create
        @lease = Lease.new
        @lease.id = Lease.all.length
        @item = Item.find(params[:item_id])
        @lease.item_id = @item.id
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
end
