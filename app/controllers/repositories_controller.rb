# frozen_string_literal: true

class RepositoriesController < ApplicationController
  def show
    @technology = permitted_params[:technology]
    @category = permitted_params[:category]
    @repository = Repository.find_by(technology: @technology,
                                     category: @category,
                                     name: permitted_params[:repository])
  end

  private

  def permitted_params
    params.permit(:technology, :category, :repository)
  end
end
