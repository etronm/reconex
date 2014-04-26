FactoryGirl.define do
  factory :section do
    sequence(:name)  { |n| "Seccion #{n}" }
    sequence(:description) { |n| "esta es la seccion #{n}"}

    #name     "Seccion test"
    #description "esta es la seccion test desde el factory"
    status 0
  end


  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}

    #name     "Michael Hartl"
    #email    "michael@example.com"
    password "foobar"
    password_confirmation "foobar"
    phone "1234563378"
    user_type 0

    factory :admin do
      user_type 3
    end

  end



end