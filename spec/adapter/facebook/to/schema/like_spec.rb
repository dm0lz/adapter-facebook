require 'spec_helper'
require 'pry'

describe Adapter::Facebook::To::Schema::Like do

  describe ".new" do
    before do
      @argument = stub 'argument'
    end
    
    it "should accept an argument" do
      Adapter::Facebook::To::Schema::Like.any_instance.stub :coerce
      Adapter::Facebook::To::Schema::Like.new @argument
    end
    
    it "should set the _type to http://schema.org/AggregateRating/Like" do
      Adapter::Facebook::To::Schema::Like.any_instance.stub :coerce
      person = Adapter::Facebook::To::Schema::Like.new @argument
      person._type.should == "http://schema.org/AggregateRating/Like"
    end

    it "should call coerce with the argument" do
      Adapter::Facebook::To::Schema::Like.any_instance.should_receive(:coerce).with @argument
      Adapter::Facebook::To::Schema::Like.new @argument
    end
  end

  describe "#coerce" do
    context "a valid facebook like is passed" do

      before do
        @like_ex = JSON.parse File.read "spec/like.json"
        @like = Adapter::Facebook::To::Schema::Like.new @like_ex
      end

      it "should initialize the _type as http://schema.org/AggregateRating/Like" do
        @like._type.should == "http://schema.org/AggregateRating/Like"
      end

      it "should initialize the :author" do
        @like.author.attributes.should == (Adapter::Facebook::To::Schema::PersonUser.new(@like_ex)).attributes
      end

    end
  end

end