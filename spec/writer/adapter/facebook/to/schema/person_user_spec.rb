require "spec_helper"
require "pry"

describe Writer::Adapter::Facebook::To::Schema::PersonUser do 

  it 'should have a proper initializer to a Writer' do 
    user_stub = stub 'user'
    writer = Writer::Adapter::Facebook::To::Schema::PersonUser.new user_stub
    writer.source.should == user_stub
  end

  describe "#hash" do

    before do 
      @user_stub = stub 'user'
      @user_attr_stub = stub 'user attr'
      @user_attr_stub.stub :[] do |argument|
        if argument == :name
          "name"
        elsif argument == :additionalType
          "additional type"
        elsif argument == :id
          "id"
        end
      end
    end
    
    context "type hash" do
      it 'should return the type' do 
        final_hash = {
          "type" => [
            "some type"
          ]
        } 

        @user_stub.should_receive(:[]).with(:_type).and_return "some type"
        @user_stub.should_receive(:attributes).and_return stub :[] => nil
        writer = Writer::Adapter::Facebook::To::Schema::PersonUser.new @user_stub
        writer.hash.should include final_hash
      end
    end

    context "properties hash" do
      it "should return the properties of the PersonUser in hash" do
      final_hash = {
        "additionalType" => [
          "additional type"
        ],
        "http://getfetcher.net/Item#id" => [
          "id"
        ],
        "name" => [
          "name"
        ]
      }

      @user_stub.should_receive(:[]).with(:_type).and_return "some type"
      @user_stub.should_receive(:attributes).and_return @user_attr_stub
      writer = Writer::Adapter::Facebook::To::Schema::PersonUser.new @user_stub
      writer.hash["properties"].should include final_hash

      end
    end


  end
end