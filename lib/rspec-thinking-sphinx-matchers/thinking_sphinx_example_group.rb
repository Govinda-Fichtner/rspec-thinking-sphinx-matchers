module ThinkingSphinxExampleGroup
  extend ::ActiveSupport::Concern

  RSpec.configure do |config|
    config.include self,
      :type => :thinking_sphinx_indices,
      :example_group => { :file_path => %r(spec/indices) }
  end

  included do
    include RspecThinkingSphinxMatchers

    metadata[:type] = :thinking_sphinx_indices

    let(:configuration){ ThinkingSphinx::Configuration.instance }
    subject{ configuration.indices_for_references(example.metadata[:described_class].to_s.downcase.to_sym).first }
  end
end
