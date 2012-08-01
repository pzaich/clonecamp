require 'spec_helper'

describe Project do
  before :each do
    @user = User.new(:email => "pzaich@gmail.com", :password =>"blehhh", :password_confirmation => "blehhh")
    @project = @user.projects.new(:name => "Kill Voldemort", :public => false)
  end

  describe "it should respond to its 'has_many' relationship" do
    subject {@project}
    it {should respond_to(:user)}
  end

end
