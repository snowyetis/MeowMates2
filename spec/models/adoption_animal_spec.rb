require 'spec_helper'
require 'rails_helper'

describe AdoptionAnimal do
  # it_behaves_like 'a time_scopable'

  let (:concernable) { AdoptionAnimal }
  let (:adoptionanimal) { subject }

  describe '::active' do

    before do
      @adoptionanimal1 = AdoptionAnimal.create active: true
      @adoptionanimal2 = AdoptionAnimal.create active: false
      @adoptionanimal3 = AdoptionAnimal.create active: true
    end

    it "returns active adoptionanimal" do
      AdoptionAnimal.active.should =~ [ @adoptionanimal1, @adoptionanimal3 ]
    end

  end

  describe '::imageless' do

		before do
			@adoptionanimal1 = AdoptionAnimal.create image: Pet::DEFAULT_IMG
			@adoptionanimal2 = AdoptionAnimal.create image: 'actual-image'
			@adoptionanimal3 = AdoptionAnimal.create image: Pet::DEFAULT_IMG
		end

		it "returns pets with the default image" do
			AdoptionAnimal.imageless.should =~ [ @adoptionanimal1, @adoptionanimal3 ]
		end

	end

	describe '::type' do

		before do
			@adoptionanimal1 = AdoptionAnimal.create species: 'cat'
			@adoptionanimal2 = AdoptionAnimal.create species: 'cat'
			@adoptionanimal3 = AdoptionAnimal.create species: 'dog'
		end

		it "loads pets by the specified value" do
			AdoptionAnimal.type('cat').should =~ [ @adoptionanimal1, @adoptionanimal2 ]
			AdoptionAnimal.type('dog').should =~ [ @adoptionanimal3 ]
		end

	end

	describe '::maybe' do

		before do
			@adoptionanimal1 = AdoptionAnimal.create species: 'cat'
			@adoptionanimal2 = AdoptionAnimal.create species: 'cat'
			@adoptionanimal3 = AdoptionAnimal.create species: 'dog'
		end

		it "loads pets by the specified value" do
			AdoptionAnimal.maybe(:species, 'cat').should =~ [ @adoptionanimal1, @adoptionanimal2 ]
		end

		it "ignores nil values" do
			AdoptionAnimal.maybe(:species, nil).should =~ [ @adoptionanimal1, @adoptionanimal2, @adoptionanimal3 ]
		end

	end

	describe '::found_since' do

		before do
			@adoptionanimal1 = AdoptionAnimal.create found_on: 2.days.ago
			@adoptionanimal2 = AdoptionAnimal.create found_on: 1.day.ago
			@adoptionanimal3 = AdoptionAnimal.create found_on: Time.now
		end

		it "loads pets by date" do
			AdoptionAnimal.found_since(3.days.ago).should =~ [ @adoptionanimal1, @adoptionanimal2, @adoptionanimal3 ]
			AdoptionAnimal.found_since(1.days.ago).should =~ [ @adoptionanimal2, @adoptionanimal3 ]
			AdoptionAnimal.found_since(Time.now).should =~ [ @adoptionanimal3 ]
		end

		it "ignores nil values" do
			Pet.found_since(nil).should =~ [@adoptionanimal1, @adoptionanimal2, @adoptionanimal3 ]
		end

	end

	describe '::for_subscription' do

		it "applies all the relevant details of the subscription" do
			@adoptionanimal1 = AdoptionAnimal.create species: 'cat', gender: 'male', found_on: 2.days.ago
			@adoptionanimal2 = AdoptionAnimal.create species: 'dog', gender: 'female', found_on: 1.day.ago
			@adoptionanimal3 = AdoptionAnimal.create species: 'cat', gender: 'female', found_on: 1.day.ago

			AdoptionAnimal.for_subscription(Subscription.new(species: 'cat')).should =~ [ @adoptionanimal1, @adoptionanimal2 ]
			AdoptionAnimal.for_subscription(Subscription.new(species: 'cat', gender: 'female')).should =~ [ @adoptionanimal3 ]
			AdoptionAnimal.for_subscription(Subscription.new(species: 'dog', found_since: Time.now.utc)).should =~ []
		end

	end

	describe '::from_hash' do

		it "adds a persisted shelter" do
			pet = AdoptionAnimal.from_hash(shelter_name: 'Test Shelter')
			Shelter.where(name: 'Test Shelter').should be_exists
			pet.shelter.should eq Shelter.where(name: 'Test Shelter').first
		end

		it "will not add a shelter if no shelter name is given" do
			pet = AdoptionAnimal.from_hash(pet_id: '1234')
			pet.shelter.should be_nil
		end

	end

	describe '#mark_inactive!' do

		it "marks the pet as inactive" do
			pet.mark_inactive!
			pet.should_not be_active
		end

	end

	describe '#active?' do

		it "defaults to true" do
			pet.should be_active
		end

	end


end
