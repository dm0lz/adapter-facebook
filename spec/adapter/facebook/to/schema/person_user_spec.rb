require "spec_helper"

describe Adapter::Facebook::To::Schema::PersonUser do

  it 'should include Virtus' do 
    Adapter::Facebook::To::Schema::PersonUser.ancestors.should include Virtus
  end

  it 'should include Discoverer::Writer' do 
    Adapter::Facebook::To::Schema::PersonUser.ancestors.should include Discoverer::Writer
  end

  describe ".new" do
    before do
      @argument = stub 'argument'
    end
    
    it "should accept an argument" do
      Adapter::Facebook::To::Schema::PersonUser.any_instance.stub :coerce
      Adapter::Facebook::To::Schema::PersonUser.new @argument
    end
    
    it "should set the _type to schema.org/Person/User" do
      Adapter::Facebook::To::Schema::PersonUser.any_instance.stub :coerce
      person = Adapter::Facebook::To::Schema::PersonUser.new @argument
      person._type.should == "http://schema.org/Person/User"
    end

    it "should call coerce with the argument" do
      Adapter::Facebook::To::Schema::PersonUser.any_instance.should_receive(:coerce).with @argument
      Adapter::Facebook::To::Schema::PersonUser.new @argument
    end

  end

  describe "#coerce" do
    context "a valid facebook user is passed" do

      before do
        @user = JSON.parse File.read "spec/user.json"
        @person_user = Adapter::Facebook::To::Schema::PersonUser.new @user
      end

      it "should initialize the _type as http://schema.org/Person/User" do
        @person_user._type.should == "http://schema.org/Person/User"
      end

      it "should initialize the :name with 'name'" do
        @person_user.name.should == @user["name"]
      end

      it "should initialize the :id with 'id'" do
        @person_user.id.should == @user['id']
      end
      it "should initialize the :additionalType with 'http://getfetcher.net/Item'" do
        @person_user.additionalType.should == "http://getfetcher.net/Item"
      end
    end
  end


end


