namespace :db do
  desc "Fill database with sample data"
  task populate_sections: :environment do
    Section.create!(name: "SeccionAA A",
                    description: "Descripcion 1",
                    status: 0)

    20.times do |n|
      name = "SeccionAA #{n}"
      description = Faker::Lorem.words(num=5).to_s
      Section.create!(name: name,
                      description: description,
                      status: 0)
    end
  end

  task populate: :environment do
    User.create!(name: "Example User",
                 email: "example@railstutorial.org",
                 phone: "7870009999",
                 password: "foobar",
                 password_confirmation: "foobar",
                 user_type: 3)
    99.times do |n|
      name = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password = "password"
      phone = "1234567890"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password,
                   phone: phone,
                   user_type: 0)
    end
  end
end