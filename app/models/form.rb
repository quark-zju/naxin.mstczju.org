# coding: utf-8

class Form < ActiveRecord::Base
  GROUPS = [:tg, :og, :pg, :cg]
  STATES = [:pending, :accepted, :rejected]

  bitmask :groups, :as => GROUPS
  bitmask :state, :as => (GROUPS.product(STATES).map {|s| s.join('_').to_sym})

  GROUPS.each do |g|
    define_method(g) { groups.include? g }
    define_method("#{g}=") { |x| x != false && (x == true || x.to_i != 0) ? (groups << g) : groups.delete(g) }
  end

  validates_presence_of :name, :tel, :major, :gender, :email, :q1, :q2, :q3, :q4

  PHONE_REGEX = /\A[0-9\-+ ]+\z/
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, :format => { :with => EMAIL_REGEX }
  validates :gender, :inclusion => { :in => 1..2 }
  validates :campus, :inclusion => { :in => 1..2 }
  
  validates :name, :length => { :within => 2..36 }
  validates :tel, :length => { :within => 5..40 }, :format => { :with => PHONE_REGEX }

  validate :check_groups

  # attr_protected :cookie_hash

  attr_accessible :campus, :cg, :comments, :cookie_hash, :created_at, :email, :forum_id, :gender, :id, :major, :name, :og, :pg, :q1, :q2, :q3, :q4, :groups, :tel, :tg, :updated_at, :as => :admin
  attr_accessible :campus, :cg, :email, :forum_id, :gender, :major, :name, :og, :pg, :q1, :q2, :q3, :q4, :tel, :tg, :groups

  def campus_str
    [nil, 'zjg', 'yq'][campus]
  end

  private

  def check_groups
    return if groups.size.in? 1..2

    message = groups.empty? ? '至少也得选一个吧' : '选得太多了，请少选一些'
    errors.add :groups, message
    # GROUPS.each { |g| errors.add g, message }
  end
end
