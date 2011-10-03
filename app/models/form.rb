class Form < ActiveRecord::Base
  validates_presence_of :name, :tel, :major, :gender, :email, :self_intro, :fav_soft, :mstc_opinion

  PHONE_REGEX = /\A[0-9\-+ ]+\z/
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, :format => { :with => EMAIL_REGEX }
  validates :gender, :inclusion => { :in => 1..2 }
  
  validates :name, :length => { :within => 2..36 }
  validates :tel, :length => { :within => 5..40 }, :format => { :with => PHONE_REGEX }

  attr_protected :cookie_hash

  def spam?
    comments.try { |c| c.start_with? 'spam' }
  end

end
