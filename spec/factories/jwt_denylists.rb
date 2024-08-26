FactoryBot.define do
  factory :jwt_denylist do
    jti { 'MyString' }
    exp { '2024-08-22 16:18:15' }
  end
end
