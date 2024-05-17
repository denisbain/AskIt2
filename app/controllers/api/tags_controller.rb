module Api
  class TagsController < ApplicationController
    def index
      tags = Tag.arel_table
      @tags = Tag.where(tags[:title].matches("%#{params[:term]}%"))
      render json: @tags.map { |tag| { id: tag.id, text: tag.title } }
    end
  end
end
