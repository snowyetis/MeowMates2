class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  acts_as_voter
  acts_as_follower
  acts_as_followable
  acts_as_messageable

  has_many :posts
  has_many :comments
  has_many :events
  has_many :animals

  mount_uploader :avatar, AvatarUploader
  process_in_background :avatar
  mount_uploader :cover, CoverUploader
  # store_in_background :cover
  process_in_background :cover

  def mailboxer_email(object)
    if object.class==Mailboxer::Notification
      return nil
    else
      :email
    end

  end

  validates_presence_of :name

  self.per_page = 10

  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]
end
