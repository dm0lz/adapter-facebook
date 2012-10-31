require 'spec_helper'
require 'pry'

describe Adapter::Facebook::To::Schema::Post do
	it 'should include Virtus' do 
    Adapter::Facebook::To::Schema::Post.ancestors.should include Virtus
  end

  it 'should include Discoverer::Writer' do 
    Adapter::Facebook::To::Schema::Post.ancestors.should include Discoverer::Writer
  end

  describe ".new" do
    before do
      @argument = stub 'argument'
    end
    
    it "should accept an argument" do
      Adapter::Facebook::To::Schema::Post.any_instance.stub :coerce
      Adapter::Facebook::To::Schema::Post.new @argument
    end
    
    it "should set the _type to schema.org/Article" do
      Adapter::Facebook::To::Schema::Post.any_instance.stub :coerce
      person = Adapter::Facebook::To::Schema::Post.new @argument
      person._type.should == "http://schema.org/Article"
    end

    it "should call coerce with the argument" do
      Adapter::Facebook::To::Schema::Post.any_instance.should_receive(:coerce).with @argument
      Adapter::Facebook::To::Schema::Post.new @argument
    end
  end

  describe "#coerce" do
  	context "a valid post is passed" do

  		before do
        @post = JSON.parse File.read "spec/post.json"
        @translated_post = Adapter::Facebook::To::Schema::Post.new @post
      end

      it "should initialize the _type as http://schema.org/Article" do
        @translated_post._type.should == "http://schema.org/Article"
      end

      it "should initialize the :id with 'id'" do
        @translated_post.id.to_s.should == @post["id"]
      end

      it "should initialize the :likes with 'likes'" do
        @post["likes"]["data"].each do |like|
          Adapter::Facebook::To::Schema::Like.should_receive(:new).with(like)
        end
        Adapter::Facebook::To::Schema::Post.new @post
      end

      it "should initialize the :comments with 'comments'" do
        comments = []
        @post['comments']["data"].each do |comment|
          comments.push(Adapter::Facebook::To::Schema::Comment.new(comment))
        end

        [@translated_post.comments,comments].each do |comment1,comment2|
          comment1.equals(comment2) == true
        end
      end

      it "should initialize the :author with 'author'" do
        @translated_post.author.equals(Adapter::Facebook::To::Schema::PersonUser.new(@post['from'])).should == true
      end

  	end
  end


end