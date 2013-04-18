module RspecThinkingSphinxMatchers
  class HaveField
    def initialize(expected, args=nil)
      args ||= {}
      @expected = expected
      @from = Array(args[:from])
      @sortable = args[:sortable] || false
      @facet = args[:facet] || false
      @as = args[:as]
    end

    def matches?(index)
      @index = index

      if @index.class == ThinkingSphinx::ActiveRecord::Index
        @index.sources.first.fields.select {|f|
          f.columns.first.__name == @expected &&
          f.columns.first.__stack == @from &&
          f.options[:as] == @as &&
          (f.options[:sortable].nil? ? (@sortable == true ? false : true) : (f.options[:sortable] == @sortable)) &&
          (f.options[:facet].nil? ? (@facet == true ? false : true) : (f.options[:facet] == @facet))
        }.count == 1
      else
        false
      end
    end

    def failure_message_for_should
      "expected #{@index} index to define a field for #{@expected}"
    end

    def failure_message_for_should_not
      "expected #{@index} index not to define a field for #{@expected}"
    end

    def description
      "have an index field for #{@as || @expected}"
    end
  end

  def index(expected, args=nil)
    HaveField.new(expected, args)
  end
end
