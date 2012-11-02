require "spec_helper"
require "pry"

describe Writer::Adapter::Facebook::To::Schema::Comment do 

  it 'should have a proper initializer to a Writer' do 
    comment_stub = stub 'comment'
    writer = Writer::Adapter::Facebook::To::Schema::Comment.new comment_stub
    writer.source.should == comment_stub
  end

  describe "#hash" do
    pending ""
  end
end