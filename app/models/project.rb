class Project < ActiveRecord::Base
  attr_accessible :public, :user_id, :name
  belongs_to :user
  has_many :lists

  validates_presence_of :name
end
