require 'spec_helper'
require 'pry'

describe Adapter::Facebook::To::Schema::Comment do

  describe ".new" do
    before do
      @argument = stub 'argument'
    end
    
    it "should accept an argument" do
      Adapter::Facebook::To::Schema::Comment.any_instance.stub :coerce
      Adapter::Facebook::To::Schema::Comment.new @argument
    end
    
    it "should set the _type to schema.org/UserComments" do
      Adapter::Facebook::To::Schema::Comment.any_instance.stub :coerce
      person = Adapter::Facebook::To::Schema::Comment.new @argument
      person._type.should == "http://schema.org/UserComments"
    end

    it "should call coerce with the argument" do
      Adapter::Facebook::To::Schema::Comment.any_instance.should_receive(:coerce).with @argument
      Adapter::Facebook::To::Schema::Comment.new @argument
    end
  end

  describe "#coerce" do
    context "a valid facebook comment is passed" do

      before do
        @comment_ex = JSON.parse File.read "spec/comment.json"
        @comment = Adapter::Facebook::To::Schema::Comment.new @comment_ex
      end

      it "should initialize the _type as http://schema.org/UserComments" do
        @comment._type.should == "http://schema.org/UserComments"
      end

      it "should initialize the :author" do
        Adapter::Facebook::To::Schema::PersonUser.should_receive(:new).with(@comment_ex["from"])
        Adapter::Facebook::To::Schema::Comment.new @comment_ex
      end

      it "should initialize the id" do
        @comment.id.should == @comment_ex["id"]
      end

      it "should initialize the message" do
        @comment.text.should == @comment_ex["message"]
      end

      it "should initialize the created time" do
        @comment.created_time.should == @comment_ex["created_time"]
      end

      it "should initialize the like count if there are likes" do
        @comment.likes_count.should == @comment_ex["likes"]
      end


    end
  end
end