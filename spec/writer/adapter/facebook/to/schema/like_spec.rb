require "spec_helper"
require "pry"

describe Writer::Adapter::Facebook::To::Schema::Like do 

  it 'should have a proper initializer to a Writer' do 
    like_stub = stub 'like'
    writer = Writer::Adapter::Facebook::To::Schema::Like.new like_stub
    writer.source.should == like_stub
  end


  describe "#hash" do
    pending ""
  end
end