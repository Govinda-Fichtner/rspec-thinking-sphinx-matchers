require 'spec_helper'

describe RspecThinkingSphinxMatchers::HaveField do
  let(:index) { ThinkingSphinx::Configuration.instance.indices_for_references(:user).first }

  it_should_behave_like "a rspec matcher", RspecThinkingSphinxMatchers::HaveField.new(:some_field)

  it "should match a defined field" do
    matcher = RspecThinkingSphinxMatchers::HaveField.new(:name)

    matcher.matches?(index).should be_true
  end

  it "should match a defined field with an :as option" do
    matcher = RspecThinkingSphinxMatchers::HaveField.new(:description, :as => :profile)

    matcher.matches?(index).should be_true
  end

  it "should match a defined field with a :sortable option" do
    matcher = RspecThinkingSphinxMatchers::HaveField.new(:city, :sortable => true)

    matcher.matches?(index).should be_true
  end

  it "should match a defined field with a :facet option" do
    matcher = RspecThinkingSphinxMatchers::HaveField.new(:year_of_birth, :facet => true)

    matcher.matches?(index).should be_true
  end

  it "should match a defined field from an associated model with dot notation" do
    matcher = RspecThinkingSphinxMatchers::HaveField.new(:name, :from => :country)

    matcher.matches?(index).should be_true
  end

  it "should match a defined field from an associated model with bracket notation" do
    matcher = RspecThinkingSphinxMatchers::HaveField.new(:name, :from => :children, :as => :child_name)

    matcher.matches?(index).should be_true
  end

  it "should not match a defined field without :as options" do
    matcher = RspecThinkingSphinxMatchers::HaveField.new(:name, :as => :lastname)

    matcher.matches?(index).should_not be_true
  end

  it "should not match a defined field without associated model" do
    matcher = RspecThinkingSphinxMatchers::HaveField.new(:name, :from => :client)

    matcher.matches?(index).should_not be_true
  end

  it "should not match a defined field without :sortable options" do
    matcher = RspecThinkingSphinxMatchers::HaveField.new(:name, :sortable => true)

    matcher.matches?(index).should_not be_true
  end

  it "should not match a defined field without :facet options" do
    matcher = RspecThinkingSphinxMatchers::HaveField.new(:name, :facet => true)

    matcher.matches?(index).should_not be_true
  end

  it "should not match a defined field without :sortable options" do
    matcher = RspecThinkingSphinxMatchers::HaveField.new(:name, :sortable => true)

    matcher.matches?(index).should_not be_true
  end

  it "should not match an undefined field" do
    matcher = RspecThinkingSphinxMatchers::HaveField.new(:favorites)

    matcher.matches?(index).should_not be_true
  end
end
