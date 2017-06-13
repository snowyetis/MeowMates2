class Animal < ApplicationRecord
  include Shared::Callbacks

  belongs_to :user
  counter_culture :user
  has_one :animal_detail

  acts_as_votable
  acts_as_commentable
  accepts_nested_attributes_for :animal_detail

  include PublicActivity::Model
  tracked only: [:create, :like], owner: Proc.new{ |controller, model| model.user }
  # default_scope -> { order('created_at DESC') }

  mount_uploader :animal_intro_avatar, AnimalAvatarUploader
  # store_in_background :animal_intro_avatar
  process_in_background :animal_intro_avatar

  self.per_page = 10

  # validates_presence_of :content
  validates_presence_of :user

  # def async_background_method(arg1, arg2)
  #   Queue::Normal.enqueue(self, :background_method, arg1, arg2)
  # end
  #
  # # this happens in the background,
  # def background_method(arg1, arg2)
  #   # do something that takes a long time...
  # end

end
