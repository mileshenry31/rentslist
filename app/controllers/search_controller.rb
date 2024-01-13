class SearchController < ApplicationController
    def search_item
        @get_items = Item.where("name LIKE ? ", "#{params[:name]}")
    end
end
