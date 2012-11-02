require 'spec_helper'
require 'pry'

describe Writer::Adapter::Facebook::To::Schema::Post do
	it 'should have a proper initializer to a Writer' do 
    user_stub = stub 'user'
    writer = Writer::Adapter::Facebook::To::Schema::Post.new user_stub
    writer.source.should == user_stub
  end

  describe "#hash" do
    pending ""
  end

  end
end