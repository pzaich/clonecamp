class Project < ActiveRecord::Base
  after_create :create_role

  attr_accessible :public, :user_id, :name

  has_many :lists
  has_many :roles
  has_many :users, :through => :roles

  validates_presence_of :name

  private

  def create_role
    self.roles.new(:user_id => current_user.id, :project_id => self.id, :access_level => 10)
  end
end
