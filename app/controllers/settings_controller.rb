class SettingsController < ApplicationController
    def index
    end
    def new_location
        @location = Location.new
    end
    def new_card
        @card = Card.new
    end
    def create_card
        puts "params1" + card_params[:year]
        card_check = ActiveMerchant::Billing::CreditCard.new(card_params)
        puts "validate" + card_check.validate.inspect
        @card = Card.new(card_params)
        if card_params[:year].length == 2
            card_check.year.to_s.prepend('20')
            card_check.year += 2000
            @card.year.prepend('20')
        end
        @card.user_id = current_user.id
        if card_check.validate.empty?
            @card.save
        end
        puts request.referer.inspect
        respond_to do |format|
            if @card.save
                if params[:commit_type] == "from_lease"
                    format.html { redirect_to request.referer, notice: "Card was successfully added." }
                    format.json { render :index, status: :created }
                else
                    format.html { redirect_to settings_path , notice: "Card was successfully added." }
                    format.json { render :index, status: :created }
                end
            else
                format.html { render :new_card, status: :unprocessable_entity }
                format.json { render json: @location.errors, status: :unprocessable_entity }
            end
        end
    end
    def delete_location
        @location = Location.find(params[:id])
        @location.delete
        respond_to do |format|
            if @location.save
                format.html { redirect_to settings_path , notice: "Location was successfully added." }
                format.json { render :index, status: :created }
            else
                format.html { render :index, status: :unprocessable_entity }
                format.json { render json: @location.errors, status: :unprocessable_entity }
            end
        end
    end
    def create_location
        @location = Location.new(location_params)
        #if current_user.locations.length < 1
        #    current_user.default_location = @location
        #    current_user.default_location.save
        #end
        @location.user_id = current_user.id
        #if request.referer.present? && request.referer.include?('/items/new')
        #    this_url = 

        respond_to do |format|
            if @location.save
                format.html { redirect_to settings_path , notice: "Location was successfully added." }
                format.json { render :index, status: :created }
            else
                format.html { render :index, status: :unprocessable_entity }
                format.json { render json: @location.errors, status: :unprocessable_entity }
            end
        end
    end
    def make_default_location
        current_user.default_location_id = params[:location_id]
        respond_to do |format|
            if current_user.save
                format.html { redirect_to settings_path, notice: "Successfully set as default" }
                format.json { render :index, status: :created }
            else
                format.html { render :index, status: :unprocessable_entity }
                format.json { render json: @location.errors, status: :unprocessable_entity }
            end
        end
        # location = Location.find(:id)
        # user.default_location = location
    end
    private
    def location_params
        params.require(:location).permit(:id, :address, :city, :state, :location_id)
    end
    def card_params
        params.require(:card).permit(:id, :first_name, :last_name, :number, :month, :year, :verification_value)
    end
end
