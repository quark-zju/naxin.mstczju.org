class FtpLink < ActiveRecord::Base
  attr_accessible :name, :note, :tags, :year, :path

  TAGS = [:interview, :plan, :notification, :summary, :advertising]

  bitmask :tags, :as => TAGS

  class << self
    TAGS.each do |tag|
      define_method tag do
        with_any_tags(tag).scoped
      end
    end
  end

end
