class SyncRepositoryService
  attr_accessor :repository

  def initialize(repository)
    @repository = repository
  end

  def self.execute(repository)
    new(repository).perform
  end

  def perform
    repository.update(external_info: external_info)
  end

  private

  def external_info
    Github::Repository.new.get(repository.full_name)
  end
end
