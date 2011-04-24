# == Schema Information
# Schema version: 20110424091651
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
	attr_accessible :name, :email
	has_many :microposts
	email_regex = /\A[\w+\-.]+@p\.lodz\.pl/i

  	validates :email, :presence   => true,
                    :format     => { :with => email_regex },
                    :uniqueness => { :case_sensitive => false }
end
