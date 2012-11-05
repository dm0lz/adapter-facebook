require "spec_helper"
require "pry"

describe Writer::Adapter::Facebook::To::Schema::Comment do 

  it 'should have a proper initializer to a Writer' do 
    comment_stub = stub 'comment'
    writer = Writer::Adapter::Facebook::To::Schema::Comment.new comment_stub
    writer.source.should == comment_stub
  end

  describe "#hash" do
    before do
      @comment_stub = stub "comment"
      @author_stub = stub "author stub"
      @author_writer_stub = stub "author writer stub"
      @comment_attr_stub = stub "comment attr"
      @author_writer_stub.stub(:hash).and_return("author")
      @author_stub.stub(:to).and_return(@author_writer_stub)
      @comment_attr_stub.stub(:[]) do |argument|
        if argument == :created_time
          "created_time"
        elsif argument == :id
          "id"
        elsif argument == :text
          "text"
        elsif argument == :author
          @author_stub
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

        @comment_stub.should_receive(:[]).with(:_type).and_return "some type"
        @comment_stub.should_receive(:attributes).and_return @comment_attr_stub
        writer = Writer::Adapter::Facebook::To::Schema::Comment.new @comment_stub
        writer.hash.should include final_hash
      end
    end


    context "properties hash" do
      it "should return the properties of the Comment in hash" do
      final_hash = {
        "id"=> [
          "id"
        ],
        "author" => [
          "author"
        ],
        "text" => [
          "text"
        ],
        "created_time" => [
          "created_time"
        ]
      }

      @comment_stub.should_receive(:[]).with(:_type).and_return "some type"
      @comment_stub.should_receive(:attributes).and_return @comment_attr_stub
      writer = Writer::Adapter::Facebook::To::Schema::Comment.new @comment_stub
      writer.hash["properties"].should include final_hash

      end
    end


  end
end