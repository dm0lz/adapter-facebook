require 'spec_helper'
require 'pry'

describe Writer::Adapter::Facebook::To::Schema::Post do
	it 'should have a proper initializer to a Writer' do 
    post_stub = stub 'post'
    writer = Writer::Adapter::Facebook::To::Schema::Post.new post_stub
    writer.source.should == post_stub
  end

  describe "#hash" do

    before do
      @post_stub = stub "post"
      @post_attr_stub = stub "post attr"
      @author_stub = stub "author stub"
      @author_writer_stub = stub "author writer stub"
      @likes_stub = stub "likes stub"
      @comments_stub = stub "comments stub"


      @author_writer_stub.stub(:hash).and_return("author")
      @author_stub.stub(:to).and_return(@author_writer_stub)
      @likes_stub.stub(:each)
      @comments_stub.stub(:each)

      @post_attr_stub.stub(:[]) do |argument|
        if argument == :id
          "id"
        elsif argument == :text
          "text"
        elsif argument == :created_time
          "created time"
        elsif argument == :author
          @author_stub
        elsif argument == :likes_type
          "likes type"
        elsif argument == :likes_count
          "likes count"
        elsif argument == :likes
          @likes_stub
        elsif argument == :comments
          @comments_stub          
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

        @post_stub.should_receive(:[]).with(:_type).and_return "some type"
        @post_stub.should_receive(:attributes).and_return @post_attr_stub
        writer = Writer::Adapter::Facebook::To::Schema::Post.new @post_stub
        writer.hash.should include final_hash
      end
    end


    context "properties hash" do
      it "should return the properties of the Post in hash" do
        final_hash = {
          "id" => [
            "id"
          ],
          "text" => [
            "text"
          ],
          "created_time" => [
            "created time"
          ],
          "author" => [
            "author"
          ],
          "aggregateRating" => [
            {
              "type" => [
                "likes type"
              ],
              "properties" => {
                "ratingCount" => [
                  "likes count"
                ],
                "author"=> [
                ]
              }
            }
          ],
          "comment" => [                 
          ]
        }

        @post_stub.should_receive(:[]).with(:_type).and_return "some type"
        @post_stub.should_receive(:attributes).and_return @post_attr_stub
        writer = Writer::Adapter::Facebook::To::Schema::Post.new @post_stub
        writer.hash["properties"].should include final_hash

      end
    end

  end
end