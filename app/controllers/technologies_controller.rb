# frozen_string_literal: true

class TechnologiesController < ApplicationController
  def index
    @technologies = Repository.distinct.pluck(:technology).sort
  end

  def show
    @technology = permitted_params[:technology]
    @categories = Repository.where(technology: @technology).pluck(:category).uniq.sort
  end

  private

  def permitted_params
    params.permit(:technology)
  end
end
