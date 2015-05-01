namespace :generate_data do
  desc 'generate all data'
  task :all => :environment do
    Rake::Task["db:drop"].execute
    Rake::Task["db:create"].execute
    Rake::Task["db:migrate"].execute
    Rake::Task["generate_data:users"].execute
    Rake::Task["generate_data:categories"].execute
    Rake::Task["generate_data:ads"].execute
  end
  
  desc 'generate some test categories'
  task :categories => :environment do
    25.times do
      Category.create(:name => Faker::Commerce.department)
    end
  end
  
    desc "generate some test users"
    task :users => :environment do
      100.times do 
        user = User.new
        user.password = 'P@ssw0rd'
        user.password_confirmation = 'P@ssw0rd'
        user.name = Faker::Name.name
        user.email = Faker::Internet.email
        user.activated = true
        user.activated_at = Time.now
        user.save
      end
    end
     desc "generate some test ads"
    task :ads => :environment do
      category_ids = Category.all.collect { |c| c.id }
      user_ids = User.all.collect { |u| u.id }
      100.times do 
        ad = Ad.new
        ad.category_id = category_ids.sample
        ad.user_id = user_ids.sample
        ad.title ="#{Faker::Hacker.verb} #{Faker::Hacker.adjective} #{Faker::Hacker.noun}"
        ad.description = Faker::Lorem.paragraph
        ad.price = Faker::Commerce.price
        ad.address = "#{Faker::Address.street_address} #{Faker::Address.city}, #{Faker::Address.state_abbr} #{Faker::Address.postcode}"
        ad.save
      end
    end
end
