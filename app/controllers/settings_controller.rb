class SettingsController < ApplicationController
    def index
    end
    def new_location
        @location = Location.new
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
                format.html { render :new, status: :unprocessable_entity }
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
end
