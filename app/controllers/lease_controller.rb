class LeaseController < ApplicationController
    #before_action :create, :index
    def index
        
    end
    def new
        ActiveMerchant::Billing::Base.mode = :test
        @gateway = ActiveMerchant::Billing::StripeGateway.new(
            login: 'sk_test_51OZQLlFvQnOmItLGRDZrCGEhOMDwmYO3G0qwcQqGikJOGP2iJQ1dqhgpjsyProGJmrbsVe0ibrK6lOK2VxXtnxMH00OmFSNi87',
        )
        amount = 1000
        credit_card = ActiveMerchant::Billing::CreditCard.new(
                :first_name         => 'Bob',
                :last_name          => 'Bobsen',
                :number             => '4242424242424242',
                :month              => '8',
                :year               => Time.now.year+1,
                :verification_value => '000')
        if credit_card.validate.empty?
            # Capture $10 from the credit card
            response = @gateway.purchase(amount, credit_card)
        
            if response.success?
                puts "Successfully charged $#{sprintf("%.2f", amount / 100)} to the credit card #{credit_card.display_number}"
            else
                raise StandardError, response.message
            end
        end
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
