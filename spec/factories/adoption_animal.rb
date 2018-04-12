FactoryGirl.define do
  factory :adoption_animal do
    id 19
    species "cat"
    name  "rspec anamil"
    pet_id  1
    gender  "M"
    fixed 1
    breed  "cat"
    found_on  "1/1/2001"
    scraped_at "1/1/2001"
    shelter_id  1
    image_id    1
  end
end
