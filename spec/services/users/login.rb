# frozen_string_literal: true

require 'rails_helper'

describe Users::Login do
  let(:password) { 'password' }
  let!(:user) { create(:user, password: 'password') }

  subject(:login) { described_class.new.call(password, user) }

  context 'when successful' do
    it 'is Result class' do
      expect(login.class).to eq(ApplicationService::Result)
    end

    it 'is successful' do
      expect(login.success?).to eq(true)
    end

    it 'returns user as object' do
      expect(login.object.class.name).to eq 'String'
    end

    it 'returns empty collection for errors' do
      expect(login.errors).to be_empty
    end
  end

  context 'when not successful' do
    context 'when invalid password' do
      let(:password) { 'password1' }

      it 'returns error' do
        expect(login.errors).to contain_exactly('Invalid credentials')
      end

      it 'does not return object' do
        expect(login.object).to be_nil
      end

      it 'does is not successful' do
        expect(login.success?).to be(false)
      end
    end

    context 'when an invalid email, and a user is not found' do
      let!(:user) { nil }

      it 'returns error' do
        expect(login.errors).to contain_exactly('Invalid credentials')
      end

      it 'does not return object' do
        expect(login.object).to be_nil
      end
    end
  end
end
