# frozen_string_literal: true

require 'rails_helper'

describe ApplicationService::Result do
  let(:boat) { create(:boat) }

  let(:success) { true }
  let(:errors) { [] }
  let(:object) { boat }

  subject(:application_service) { described_class.new(success:, errors:, object:) }

  context 'when successful' do
    it 'returns true do to success eq true' do
      expect(application_service.success?).to be(true)
    end

    it 'returns empty array of errors' do
      expect(application_service.errors).to be_empty
    end

    it 'returns boat as object' do
      expect(application_service.object).to eq(boat)
    end
  end

  context 'when is not successful' do
    let(:success) { false }
    let(:errors) { [ 'bad error', 'very bad error' ] }

    it 'returns success? as false' do
      expect(application_service.success?).to be(false)
    end

    it 'returns passed errors' do
      expect(application_service.errors).to contain_exactly('bad error', 'very bad error')
    end
  end
end
