class Animal < ApplicationRecord
  include Shared::Callbacks

  belongs_to :user
  counter_culture :user
  acts_as_votable
  acts_as_commentable

  # def magic(options = nil)
  #  options == nil ? "/assets/#{@name}-full.png" : "/assets/#{@name}-#{options}.png"
  # end
  #
  # def url(options = nil)
  #   magic(options)
  # end

  # attr_accessor :animal_intro_avatar
  # has_attached_file :animal_intro_avatar, styles: { thumbnail: '100x100>' }

  include PublicActivity::Model
  tracked only: [:create], owner: Proc.new{ |controller, model| controller.current_user }
  # default_scope -> { order('created_at DESC') }

  # mount_uploader :animal_intro_avatar, AvatarUploader
  mount_uploader :avatar, AvatarUploader, mount_on: :animal_intro_avatar

  attr_accessor :file
  # def initialize(name)
  #   @name = :animalName
  #   @file = :animal_intro_avatar
  # end

  self.per_page = 10

  # validates_presence_of :content
  validates_presence_of :user

  # extend FriendlyId
  # friendly_id :name, use: [:slugged, :finders]

end
