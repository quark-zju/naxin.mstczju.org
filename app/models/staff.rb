require 'net/http'
require 'json'

class Staff < ActiveRecord::Base
  devise :rememberable, :remote_authenticatable, :trackable

  attr_accessible :email, :remember_me, :nick, :password, :name

  attr_accessor :password

  def to_s
    name.presence || nick.presence || email.gsub(/@.*$/, '')
  end

  def forms
    Form.where(:spam => false).order('id DESC').scoped
  end

  # used by devise_mstc
  def self.email_postfix
    '@mstczju.org'
  end

  def self.remote_authenticate_url
    'http://login.mstczju.org/plain'
  end
end
