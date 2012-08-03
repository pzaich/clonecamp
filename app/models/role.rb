class Role < ActiveRecord::Base
  attr_accessible :access_level, :project_id, :user_id

  belongs_to :project
  belongs_to :user
end
