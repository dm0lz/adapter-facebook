require 'spec_helper'
require 'pry'

describe Writer::Adapter::Facebook::To::Schema::Post do
	it 'should have a proper initializer to a Writer' do 
    user_stub = stub 'user'
    writer = Writer::Adapter::Facebook::To::Schema::Post.new user_stub
    writer.source.should == user_stub
  end

  describe "#hash" do

    before do 
      @user_stub = stub 'user'
    end

    it 'should return the type' do 
    pending "falta metodo hash todabia"
      final_hash = {
        "type" => [
          "some type"
        ]
      } 

      @user_stub.should_receive(:_type).and_return "some type"
      @user_stub.should_receive(:attributes).and_return stub :[] => nil
      writer = Writer::Adapter::Facebook::To::Schema::Post.new @user_stub
      writer.hash.should include final_hash
    end

  end
end