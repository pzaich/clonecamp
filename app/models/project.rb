class Project < ActiveRecord::Base
  attr_accessible :public, :user_id, :name
  belongs_to :user

  validates_presence_of :name
end
