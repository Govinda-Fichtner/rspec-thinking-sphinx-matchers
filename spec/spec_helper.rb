require 'rubygems'
require 'bundler'

Bundler.require :default, :test

require 'combustion'
require 'thinking_sphinx'

Combustion.initialize! :active_record

require 'rspec'
require_relative 'shared_examples'
require_relative '../lib/rspec-thinking-sphinx-matchers'

