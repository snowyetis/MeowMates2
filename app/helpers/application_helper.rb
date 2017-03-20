# Copyright (c) 2015, @sudharti(Sudharsanan Muralidharan)
# Socify is an Open source Social network written in Ruby on Rails This file is licensed
# under GNU GPL v2 or later. See the LICENSE.

module ApplicationHelper
  def belongs_to_user?(resource)
    resource.user == current_user
  end

  def animal_belongs_to_user?(resource)
    if current_user.blank?
      false
    else
      resource.user_id == current_user.id
    end
  end

  def activity_resources_exist?(activity)
    activity && activity.trackable && activity.owner
  end

  def avatar_for(user, sizing, title = user.name)
    # image_tag avatar.url(user.email, size: sizing), title: title, class: 'img-rounded'
    image_tag user.avatar.url(:thumb)
  end

  def avatar_for_thumb(user)
    image_tag user.avatar.thumb
  end

end
