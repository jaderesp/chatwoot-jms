# frozen_string_literal: true

module Avatarable
  extend ActiveSupport::Concern
  include Rails.application.routes.url_helpers

  included do
    has_one_attached :avatar
  end

  def avatar_url
   return url_for(avatar.representation(resize: '250x250')) if avatar.attached? && avatar.representable?
   
    if [User, Contact].include?(self.class) && email.present?
      
     avurl =  "http://209.126.7.170:3003/files/wapi/download/avatar/" + phone_number + ".png"

     return avurl

    end
    ''
  end
end
