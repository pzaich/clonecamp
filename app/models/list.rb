class List < ActiveRecord::Base
  attr_accessible :name, :project_id
  belongs_to :project
  has_many :tasks

  validates :name, :presence => true
end
