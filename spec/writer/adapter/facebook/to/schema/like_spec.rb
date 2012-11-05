require "spec_helper"
require "pry"

describe Writer::Adapter::Facebook::To::Schema::Like do 

  it 'should have a proper initializer to a Writer' do 
    like_stub = stub 'like'
    writer = Writer::Adapter::Facebook::To::Schema::Like.new like_stub
    writer.source.should == like_stub
  end


  describe "#hash" do
    before do
      @like_stub = stub "like"
      @like_attr_stub = stub "like attr"
      @like_attr_stub2 = stub "like attr 2"
      @like_attr_stub.stub(:[]).with(:author).and_return(@like_attr_stub2)
      @like_attr_stub2.stub(:[]) do |argument|
        if argument == :additionalType
          "additionalType"
        elsif argument == :id
          "id"
        elsif argument == :name
          "name"
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

        @like_stub.should_receive(:[]).with(:_type).and_return "some type"
        @like_stub.should_receive(:attributes).and_return @like_attr_stub
        writer = Writer::Adapter::Facebook::To::Schema::Like.new @like_stub
        writer.hash.should include final_hash
      end
    end


    context "properties hash" do
      it "should return the properties of the Like in hash" do
      final_hash = {
        "additionalType" => [
          "additionalType"
        ],
        "http://getfetcher.net/Item#id" => [
          "id"
        ],
        "name" => [
          "name"
        ]
      }

      @like_stub.should_receive(:[]).with(:_type).and_return "some type"
      @like_stub.should_receive(:attributes).and_return @like_attr_stub
      writer = Writer::Adapter::Facebook::To::Schema::Like.new @like_stub
      writer.hash["properties"].should include final_hash

      end
    end


  end
end