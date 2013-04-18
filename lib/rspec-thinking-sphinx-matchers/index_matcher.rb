module RspecThinkingSphinxMatchers
  class DefineAnIndex
    def matches?(index)
      @index = index

      if @index.class == ThinkingSphinx::ActiveRecord::Index
        true
      else
        false
      end
    end

    def failure_message_for_should
      "expected #{@index} to define an index"
    end

    def failure_message_for_should_not
      "expected #{@index} not to define an index"
    end

    def description
      "define an index"
    end
  end

  def define_an_index
    DefineAnIndex.new
  end
end
