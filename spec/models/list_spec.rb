require 'spec_helper'

describe List do
  before :each do
  @project = Project.new(:name => "blue project")
  @list = @project.lists.new(:name => "This is my new list")
  end

  subject { @list }

  it { should respond_to(:project) }
  it { should respond_to(:name) }

  context "does not validate without a name" do
   before {@list.name = nil}
   it {should_not be_valid}
  end


end
