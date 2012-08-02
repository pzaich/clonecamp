class Task < ActiveRecord::Base
  attr_accessible :description, :list_id, :name

  belongs_to :list

  validates :name, :presence => true
end
