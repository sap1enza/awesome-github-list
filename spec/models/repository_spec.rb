# frozen_string_literal: true

require 'rails_helper'

describe Repository do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:full_name) }
    it { is_expected.to validate_uniqueness_of(:full_name).case_insensitive }
  end

  describe 'serializations' do
    it { is_expected.to serialize(:external_info) }
  end

  describe 'callbacks' do
    describe '#set_name' do
      it 'sets name based on full_name' do
        repository = build(:repository)
        repository.full_name = 'octocat/hello-world'

        expect { repository.save }.to change(repository, :name).from(nil).to('hello-world')
      end
    end
  end
end
