require 'spec_helper'

describe RspecThinkingSphinxMatchers::HaveAttribute do
  let(:index) { ThinkingSphinx::Configuration.instance.indices_for_references(:user).first }
  
  it_should_behave_like "a rspec matcher", RspecThinkingSphinxMatchers::HaveAttribute.new(:some_attribute)

  it "should match a defined attribute" do
    matcher = RspecThinkingSphinxMatchers::HaveAttribute.new(:status)

    matcher.matches?(index).should be_true
  end

  it "should match a defined field with an :as option" do
    matcher = RspecThinkingSphinxMatchers::HaveAttribute.new(:finance_id, :as => :tax_id)

    matcher.matches?(index).should be_true
  end

  it "should match a defined field with a :facet option" do
    matcher = RspecThinkingSphinxMatchers::HaveAttribute.new(:created_at, :facet => true)

    matcher.matches?(index).should be_true
  end

  it "should match a defined field from an associated model with bracket notation" do
    matcher = RspecThinkingSphinxMatchers::HaveAttribute.new(:id, :from => :country, :as => :country_id)

    matcher.matches?(index).should be_true
  end

  it "should match a defined field from an associated model with dot notation" do
    matcher = RspecThinkingSphinxMatchers::HaveAttribute.new(:zip, :from => :city)

    matcher.matches?(index).should be_true
  end

  it "should not match a defined attribute without :as options" do
    matcher = RspecThinkingSphinxMatchers::HaveAttribute.new(:status, :as => :something)

    matcher.matches?(index).should_not be_true
  end

  it "should not match a defined attribute without associated model" do
    matcher = RspecThinkingSphinxMatchers::HaveAttribute.new(:status, :from => :client)

    matcher.matches?(index).should_not be_true
  end

  it "should not match a defined field without :facet options" do
    matcher = RspecThinkingSphinxMatchers::HaveAttribute.new(:status, :facet => true)

    matcher.matches?(index).should_not be_true
  end

  it "should not match an undefined field" do
    matcher = RspecThinkingSphinxMatchers::HaveAttribute.new(:client_id)

    matcher.matches?(index).should_not be_true
  end
  
end
