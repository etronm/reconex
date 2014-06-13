FactoryGirl.define do

  factory :section do
    sequence(:name) { |n| "Seccion #{n}" }
    sequence(:description) { |n| "esta es la seccion #{n}" }
    status 0
  end


  factory :user do
    sequence(:name) { |n| "Person #{n}" }
    sequence(:email) {|n| Faker::Internet.email("#{Faker::Name.first_name}_#{Faker::Name.last_name}_#{n}_#{rand(9000).to_s}") }
    password "foobar"
    password_confirmation "foobar"
    phone "1234563378"
    user_type 0
    locale 'en'

    factory :non_admin do
      user_type 0
    end

    factory :admin do
      user_type 3
    end

  end

  factory :article do
    sequence(:title) { |n| "Articulo #{n}" }
    sequence(:description) { |n| "descripcion #{n}" }
    status 0
    user
  end

end