class SearchController < ApplicationController
    def search_item
        @get_items = Item.where("name ilike ? ", "%#{params[:name]}%")
    end
end
