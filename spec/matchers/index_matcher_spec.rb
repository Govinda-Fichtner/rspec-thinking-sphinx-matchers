require 'spec_helper'

describe RspecThinkingSphinxMatchers::DefineAnIndex do
  let(:config) { ThinkingSphinx::Configuration.instance }

  it_should_behave_like "a rspec matcher", RspecThinkingSphinxMatchers::DefineAnIndex.new
  
  it "should match a defined index" do
    index = config.indices_for_references(:user).first
    matcher = RspecThinkingSphinxMatchers::DefineAnIndex.new

    matcher.matches?(index).should be_true
  end

  it "should NOT match an undefined index" do
    index = "non-existing-index"
    matcher = RspecThinkingSphinxMatchers::DefineAnIndex.new

    matcher.matches?(index).should_not be_true
  end
end

