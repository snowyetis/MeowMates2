class Animal < ApplicationRecord
  include Shared::Callbacks

  belongs_to :user
  counter_culture :user
  acts_as_votable
  acts_as_commentable

  include PublicActivity::Model
  # tracked only: [:create, :like], owner: Proc.new{ |controller, model| controller.current_user }
  tracked only: [:create, :like], owner: Proc.new{ |controller, model| model.user }
  # default_scope -> { order('created_at DESC') }

  # mount_uploader :avatar, AvatarUploader, mount_on: :animal_intro_avatar
  mount_uploader :animal_intro_avatar, AvatarUploader
  # attr_accessor :file
  self.per_page = 10

  # validates_presence_of :content
  # validates_presence_of :user

end
