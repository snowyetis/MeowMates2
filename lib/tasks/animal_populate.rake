namespace :animalfill do
  desc 'Fill data'
  task data: :environment do
    require 'faker'
    require 'populator'

    puts 'Creating animals'
    puts '=============='
    genders = ['male', 'female']
    password = 'dddd4444'

    [User, Animal].each(&:delete_all)

    User.populate 20 do |user|
      user.name = Faker::Name.name
      user.email = Faker::Internet.email
      user.sex = genders
      user.dob = Faker::Date.between(45.years.ago, 15.years.ago)
      user.phone_number = Faker::PhoneNumber.cell_phone
      user.encrypted_password = User.new(password: password).encrypted_password
      user.confirmed_at = DateTime.now
      user.sign_in_count = 0
      user.posts_count = 0
      user.animals_count = 0
      puts "created user #{user.name}"
    end

    user = User.new(name: 'Rails', email: 'test@socify.com', sex: 'female', password: 'password')
    # user.skip_confirmation!
    user.save!
    puts 'Created test user with email=test@socify.com and password=password'

    puts 'Generate Friendly id slug for users'
    puts '==================================='
    User.find_each(&:save)

    users = User.all

   10.times do |animal|
     animal = Animal.new
      user = users.sample
      current_user = user
      # animal = user

      animal.animalName = Faker::Name.name
      animal.gender = genders
      animal.dob = Faker::Date.between(1.years.ago, 15.years.ago)
      animal.content = 'Test content bla bla bla'
      animal.shots = true
      animal.fixed = true
      animal.user_id = user.id
      animal.animal_intro_avatar.store!(File.open(File.join(Rails.root + 'app/assets/images/', 'animal-avatar.jpg')))
      puts 'Rails.root'
      animal.user = user
      # animal.save

      # ai = Animal.new
      # ai.animal_intro_avatar.store!(File.open(File.join(Rails.root + 'app/assets/images/', 'animal-avatar.jpg')))

      # animal.animal_intro_avatar << ai

      animal.save
    end
  end
end
