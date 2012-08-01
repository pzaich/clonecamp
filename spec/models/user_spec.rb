require 'spec_helper'

describe User do
  describe "it should be able to instantiate a new user" do
    @user = User.new(:email => "pzaich@gmail.com", :password =>"blehhh", :password_confirmation => "blehhh")
  end

  describe "it should respond to #projects" do
    before :each do
      @user = User.new(:email => "pzaich@gmail.com", :password =>"blehhh", :password_confirmation => "blehhh")
    end
    subject {@user}

    it {should respond_to(:projects)}
  end
end
