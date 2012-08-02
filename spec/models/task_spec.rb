require 'spec_helper'

describe Task do
  before :each do
    @project = Project.new(:name => "blue project")
    @list = @project.lists.new(:name => "This is my new list")
    @task = @list.tasks.new(:name => "task1", :description => "desc is optional")
  end

  subject { @task }

  it { should respond_to(:list) }
  it { should respond_to(:name) }
  it { should respond_to(:description) }

  context "does not validate without a name" do
    before {@task.name = nil}
    it {should_not be_valid}
  end
end
