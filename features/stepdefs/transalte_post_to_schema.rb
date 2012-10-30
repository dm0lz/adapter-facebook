require "pry"

Given /^the facebook post:$/ do |json_post|
  #binding.pry
  @post = JSON.parse json_post
end

When /^I convert it into schema\.org\/Person\/User$/ do
   #binding.pry
   @translated = Adapter::Facebook::To::Schema::PersonUser.new @post
end

Then /^I should have :$/ do |string|
  @schema = JSON.parse string
  binding.pry
  @translated.to.hash.should == @schema
end