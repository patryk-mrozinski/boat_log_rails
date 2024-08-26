# frozen_string_literal: true

require 'rails_helper'

describe Mutations::Users::SignIn, type: :request do
  let(:password) { 'password' }
  let(:email) { Faker::Internet.email }
  let!(:user) { create(:user, password:, email:) }
  let(:respose) {  }

  let(:query_context) { {} }
  let(:query_variables) do
    {
      email:    email,
      password: password
    }
  end

  context 'when valid' do
    it 'returns token and response information' do
      response = graphql!['data']['signIn']

      expect(response['success']).to eq(true)
      expect(response['token']).to be_kind_of(String)
    end

    it 'returns correct user information' do
      user_response = graphql!['data']['signIn']['user']

      expect(user_response['email']).to eq(email)
      expect(user_response['lastName']).to eq(user.last_name)
    end
  end

  context 'when invalid' do
    let(:expected_error) { 'Invalid credentials' }

    context 'with invalid email' do
      let!(:user) { create(:user, password:, email: Faker::Internet.email) }

      it 'returns correct response' do
        response = graphql!['data']['signIn']

        expect(response['success']).to eq(false)
        expect(response['token']).to be_nil
        expect(response['user']).to be_nil
        expect(response['error']).to eq(expected_error)
      end
    end

    context 'with invalid password' do
      let!(:user) { create(:user, password: Faker::Internet.password, email:) }
      it 'returns correct response' do
        response = graphql!['data']['signIn']

        expect(response['success']).to eq(false)
        expect(response['token']).to be_nil
        expect(response['user']).to be_nil
        expect(response['error']).to eq(expected_error)
      end
    end
  end

  def query
    <<~GQL
      mutation login($email: String!, $password: String!){
        signIn(input: { email: $email, password: $password}) {
          user {
            email
            id
            lastName
          }
          token
          success
          error
        }
      }
    GQL
  end
end
