# frozen_string_literal: true

class CategoriesController < ApplicationController
  def show
    @technology = permitted_params[:technology]
    @category = permitted_params[:category]
    @repositories = Repository.where(technology: @technology, category: @category).pluck(:name).compact.sort
  end

  private

  def permitted_params
    params.permit(:technology, :category)
  end
end
