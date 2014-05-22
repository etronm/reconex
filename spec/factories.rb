FactoryGirl.define do

  factory :section do
    sequence(:name) { |n| "Seccion #{n}" }
    sequence(:description) { |n| "esta es la seccion #{n}" }

    #name     "Seccion test"
    #description "esta es la seccion test desde el factory"
    status 0
  end


  factory :user do
    sequence(:name) { |n| "Person #{n}" }
    #sequence(:email) { |n| "person_#{n}@example.com" }

    #name { Faker::Name.first_name + '_' + Faker::Name.last_name }
    #email { "#{name}_#{rand(3000).to_s}@example.com" }
    sequence(:email) {|n| Faker::Internet.email("#{Faker::Name.first_name}_#{Faker::Name.last_name}_#{n}_#{rand(9000).to_s}") }

    #name     "Michael Hartl"
    #email    "example@railstutorial.org"
    password "foobar"
    password_confirmation "foobar"
    phone "1234563378"
    user_type 0
    locale 'en'

    factory :admin do
      user_type 3
    end

  end

  factory :article do
    sequence(:title) { |n| "Articulo #{n}" }
    sequence(:description) { |n| "descripcion #{n}" }

    #title "lorena garcia1"
    #description "algo mas"
    status 0
    user
  end

end