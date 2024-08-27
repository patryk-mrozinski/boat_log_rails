# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Mutations::Users::SignUp, type: :request do
  let(:password) { 'password' }
  let(:email) { Faker::Internet.email }
  let(:first_name) { Faker::Name.first_name }
  let(:last_name) { Faker::Name.last_name }

  let(:query_context) { {} }
  let(:query_variables) do
    {
      first_name:,
      last_name:,
      email:,
      password:
    }
  end

  def graphql_response
    graphql!['data']['signUp']
  end

  context 'when valid' do
    it 'is successful' do
      response = graphql_response

      expect(response['success']).to be(true)
      expect(response['error']).to be_empty
    end
  end

  context 'when invalid' do
    context 'with invalid email' do
      let!(:user) { create(:user, password:, email: email) }
      let(:first_name) { '' }

      it 'returns expected errors' do
        response = graphql_response
        expected_error_message = "Email has already been taken, First name can't be blank"

        expect(response['success']).to be(false)
        expect(response['error']).to eq(expected_error_message)
      end
    end
  end

  def query
    <<~GQL
      mutation($email: String!, $password: String!, $firstName: String!, $lastName: String!){
        signUp(
          input: { email: $email, password: $password, firstName: $firstName, lastName: $lastName }
        ) {
          success
          error
        }
      }
    GQL
  end
end
