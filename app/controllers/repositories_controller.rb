# frozen_string_literal: true

class RepositoriesController < ApplicationController
  def new; end

  def create
    repository = Repository.new(permitted_params)

    if repository.save
      SyncRepositoryService.execute(repository)

      redirect_to repository_path(repository.technology, repository.category, repository.name)
    else
      flash[:error] = repository.errors.full_messages
      render :new
    end
  end

  def show
    @technology = permitted_params[:technology]
    @category = permitted_params[:category]
    @repository = Repository.find_by(technology: @technology,
                                     category: @category,
                                     name: permitted_params[:repository])
  end

  private

  def permitted_params
    params.permit(:technology, :category, :repository, :full_name)
  end
end
