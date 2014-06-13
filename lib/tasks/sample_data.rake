namespace :db do
  desc "Fill database with sample data"

  task populate_articles: :environment do
    users = User.all(limit: 6)

    50.times do |n|
      title = "n:#{n}" + Faker::Lorem.sentence(5)
      description =Faker::Lorem.sentence(10)
      users.each { |user| user.articles.create!(title: "u:#{user.id}" + title[0..49], description: description, status: 0) }
    end
  end

  task create_article_photo: :environment do
    ac = ArticleContents.first
    ArticlePhotos.create!(
        article_id: ac.article_id,
        section_id: ac.section_id,
        photo_content: 'thi is  atest',
        photo_path: File.open('/home/etronm/rorprojects/reconex/vendor/assets/img/banner-bg-1.jpg')
    )
  end

  task populate_article_contents: :environment do
    articles = Article.all(limit: 10)
    articles.each do |article|
      sections = Section.all(limit: 5)
      order = 0
      sections.each do |section|
        order +=1
        ArticleContents.create!(
          article: article,
          section: section,
          description:  Faker::Lorem.sentence(15),
          status: 0,
          display_order: order)
      end
    end
  end

  task fill_articles_with_tags:          :environment do
    articles  = Article.all
    articles.each do |article|
      5.times do
        article.tag_list.add(Faker::Lorem.word)
      end
      article.save
    end
  end

  task populate_sections: :environment do
    Section.create!(name: "MiSeccionAA A",
                    description: "Descripcion 1",
                    status: 0)

    20.times do |n|
      name = "SeccionAA #{n}"
      description = Faker::Lorem.words(num=5).to_s[0..59]
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
                 user_type: 3,
                 locale: 'en')
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
                   user_type: 0,
                   locale: 'en')
    end

    Rake::Task["db:populate_sections"].invoke

  end
end