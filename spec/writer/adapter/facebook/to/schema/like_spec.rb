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
      @like_stub = stub 'like'
    end
    
    it 'should return the type' do 
      final_hash = {
        "type": [
          "http://schema.org/Person/User"
        ],
        "properties": {  
          "additionalType": [
            "http://getfetcher.net/Item"
          ],
          "http://getfetcher.net/Item#id": [
            "536017463"
          ],
          "name": [
            "Nahuel García Ocampo"
          ]
        }           
      }

      @like_stub.should_receive(:_type).and_return "some type"
      @like_stub.should_receive(:attributes).and_return stub :[] => nil
      writer = Writer::Adapter::Facebook::To::Schema::PersonUser.new @like_stub
      writer.hash.should include final_hash
    end
  end
end