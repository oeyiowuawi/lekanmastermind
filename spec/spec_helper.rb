# require "codeclimate-test-reporter"
# CodeClimate::TestReporter.start
# $LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
#
# require 'simplecov'
# SimpleCov.start
#
# require 'codeclimate-test-reporter'
# CodeClimate::TestReporter::Formatter
require 'coveralls'
Coveralls.wear!
require 'rspec'

require 'lekanmastermind'
require 'game_start'
