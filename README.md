# Rspec Thinking Sphinx matchers
[![Build Status](https://travis-ci.org/Govinda-Fichtner/rspec-thinking-sphinx-matchers.png?branch=master)](https://travis-ci.org/Govinda-Fichtner/rspec-thinking-sphinx-matchers)

Test your Thinking Sphinx 3 index defintions with the custom rspec matchers of this gem.

If you are still using Thinking Sphinx 2 have a look at https://github.com/fuzzyalej/thinking-sphinx-rspec-matchers

I would appreciate feedback very much, in the form of comments, code and/or beer! :-)


# Installation
To install the matchers you only have to add the gem to your test group in `Gemfile`:

     group :test do
       gem 'rspec-thinking-sphinx-matchers'
     end

And then execute:

    $ bundle

# Use
     describe "fields" do
       it { should index :name, :from => :client, :as => :client_name }
       it { should index :content }
     end
    
     describe "attributes" do
       it { should have_attribute :user_id, :as => :users }
     end

Field options

        :from
        :as
        :facet
        :sortable

Attribute Field options

        :from
        :as
        :facet


# Testing
If you are feeling brave and want to test the gem, simply issue a `bundle exec rspec`. Contributions and enhancements and mostly welcomed!


# References
[1] https://github.com/fuzzyalej/thinking-sphinx-rspec-matchers
[2] http://openmonkey.com/2009/07/19/thinking-sphinx-rspec-matchers/
[3] https://gist.github.com/21755


# Credits
Thanks to Pal Allan from http://freelancing-gods.com/ for creating Thinking Sphinx!

Thanks to Alejandro Andrés for the rspec matchers for ThinkingSphinx v2.


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
