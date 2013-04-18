module RspecThinkingSphinxMatchers
  class HaveAttribute
    def initialize(expected, args=nil)
      args ||= {}

      @expected = expected
      @from = Array(args[:from])
      @facet = args[:facet] || false
      @as = args[:as]
    end

    def matches?(index)
      @index = index
    
      if @index.class == ThinkingSphinx::ActiveRecord::Index
        @index.sources.first.attributes.select {|a|
          a.columns.first.__name == @expected &&
          a.columns.first.__stack == @from &&
          a.options[:as] == @as &&
          (a.options[:facet].nil? ? (@facet == true ? false : true) : (a.options[:facet] == @facet))
        }.count == 1
      else
        false
      end
    end

    def failure_message_for_should
      "expected #{@index} index to have an attribute for #{@expected}"
    end

    def failure_message_for_should_not
      "expected #{@index} index not to define an attribute for #{@expected}"
    end

    def description
      "have a search attribute for #{@as || @expected}"
    end
  end

  def have_attribute(expected, args=nil)
    HaveAttribute.new(expected, args)
  end
end
