# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Mutations::Users::SignIn, type: :request do
  let(:password) { 'password' }
  let(:email) { Faker::Internet.email }
  let!(:user) { create(:user, password:, email:) }
  let(:query_context) { {} }
  let(:query_variables) do
    {
      email: email,
      password: password
    }
  end
  let(:expected_error) { 'Invalid credentials' }

  def graphql_response
    graphql!['data']['signIn']
  end

  describe 'SignIn Mutation' do
    context 'when valid' do
      it 'returns token and success' do
        response = graphql_response

        expect(response['success']).to be(true)
        expect(response['token']).to be_a(String)
      end

      it 'returns correct user information' do
        user_response = graphql_response['user']

        expect(user_response['email']).to eq(email)
        expect(user_response['lastName']).to eq(user.last_name)
      end
    end

    context 'when invalid' do
      shared_examples 'an invalid sign-in' do
        it 'returns error message' do
          response = graphql_response

          expect(response['success']).to be(false)
          expect(response['token']).to be_nil
          expect(response['user']).to be_nil
          expect(response['error']).to eq(expected_error)
        end
      end

      context 'with invalid email' do
        let!(:user) { create(:user, password:, email: Faker::Internet.email) }

        it_behaves_like 'an invalid sign-in'
      end

      context 'with invalid password' do
        let!(:user) { create(:user, password: Faker::Internet.password, email:) }

        it_behaves_like 'an invalid sign-in'
      end
    end
  end

  def query
    <<~GQL
      mutation login($email: String!, $password: String!) {
        signIn(input: { email: $email, password: $password }) {
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
