require "pry"

Given /^the facebook user:$/ do |json_user|
  @user = JSON.parse json_user
end

When /^I convert it into schema\.org\/Person\/User$/ do
   @translated = Adapter::Facebook::To::Schema::PersonUser.new @user
end

Then /^I should have user:$/ do |string|
  @schema = JSON.parse string
  @translated.to.hash.should == @schema
end
