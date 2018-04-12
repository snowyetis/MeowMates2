class AdoptionAnimal < ApplicationRecord
  # DEFAULT_IMG = "https://#{Figaro.env.s3_bucket}.s3.amazonaws.com/_default/pet-avatar.png"
  DEFAULT_IMG = "/app/assets/images/avatar.jpg"

  belongs_to :shelter

  scope :active, -> { where(active: true) }
  scope :imageless, -> { where(image: DEFAULT_IMG) }
  scope :type, ->(species) { where species: species }
  scope :maybe, ->(prop, value) { where(prop => value) unless value.nil? }
  scope :found_since, ->(date) { where("found_on > ?", date.midnight) unless date.nil? }
  # scope :for_subscription, ->(subscription) { type(subscription.species).maybe(:gender, subscription.gender).found_since(subscription.found_since) }

  def self.from_hash(hash)
  	unless hash[:shelter_name].blank?
	  	shelter = Shelter.find_or_create_by(name: hash.delete(:shelter_name))
	  	hash.merge! shelter: shelter
	  end

  	AdoptionAnimal.new(hash)
  end

  def mark_inactive!
    self.active = false
  end

  def active?
    active
  end

  def has_image?
    image != DEFAULT_IMG
  end

  def found_days_ago
    (Date.today - found_on.to_date).to_i unless found_on.nil?
  end

  def self.time_scopable_moment
    :found_on
  end

end
