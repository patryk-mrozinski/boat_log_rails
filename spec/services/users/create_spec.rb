# frozen_string_literal: true

require 'rails_helper'

describe Users::Create do
  let(:first_name) { Faker::Name.first_name }
  let(:last_name) { Faker::Name.last_name }
  let(:email) { Faker::Internet.email }
  let(:password) { Faker::Internet.password }

  let(:params) { { first_name:, last_name:, email:, password: } }

  subject(:create_user) { described_class.new.call(params) }

  context 'when successful' do
    it 'is Result class' do
      expect(create_user.class).to eq(ApplicationService::Result)
    end

    it 'is successful' do
      expect(create_user.success?).to eq(true)
    end

    it 'returns user as object' do
      expect(create_user.object.class.name).to eq 'User'
    end

    it 'returns empty collection for errors' do
      expect(create_user.errors).to be_empty
    end
  end

  context 'when not successful' do
    let!(:user) { create(:user) }
    let(:email) { user.email }

    it 'returns error' do
      expect(create_user.errors).to contain_exactly('Email has already been taken')
    end

    it 'does not return object' do
      expect(create_user.object).to be_nil
    end

    it 'does is not successful' do
      expect(create_user.success?).to be(false)
    end
  end
end
