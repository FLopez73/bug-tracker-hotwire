require 'rails_helper'

RSpec.describe Bug, type: :model do
  it "should have a description" do
  bug = Bug.create priority:'High', assignee: 'Tom'
  expect(bug.errors[:description]).to_not be_empty
 end
  it "should have a priority" do
  bug = Bug.create description:'broken link', assignee: 'Tom'
  expect(bug.errors[:priority]).to_not be_empty
 end
  it "should have a assignee" do
  bug = Bug.create description:'broken link', priority:'high'
  expect(bug.errors[:assignee]).to_not be_empty
 end
end

