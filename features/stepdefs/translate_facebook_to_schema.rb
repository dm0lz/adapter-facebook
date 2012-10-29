
require "pry"

Given /^the facebook user:$/ do |json_user|
  #binding.pry
  @user = JSON.parse json_user
end

When /^I convert it into schema\.org\/Person\/User$/ do
   #binding.pry
   @translated = Adapter::Facebook::To::Schema::PersonUser.new @user
end

Then /^I should have :$/ do |string|
  @schema = JSON.parse string
  binding.pry
  @translated.to.hash.should == @schema
end
