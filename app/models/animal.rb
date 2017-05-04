class Animal < ApplicationRecord
  include Shared::Callbacks

  belongs_to :user
  counter_culture :user
  acts_as_votable
  acts_as_commentable
  accepts_nested_attributes_for :animal_detail

  include PublicActivity::Model
  tracked only: [:create, :like], owner: Proc.new{ |controller, model| model.user }
  # default_scope -> { order('created_at DESC') }

  mount_uploader :animal_intro_avatar, AnimalAvatarUploader
  self.per_page = 10

  # validates_presence_of :content
  validates_presence_of :user

end
