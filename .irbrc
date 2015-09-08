# coding: utf-8
require "rubygems" rescue nil
require "wirble"
# require "utility_belt"
require 'ap'
require "pp"
require 'irb/completion'
require 'irb/ext/save-history'
require 'hirb'; Hirb.enable; extend Hirb::Console

Wirble.init
Wirble.colorize

IRB.conf[:SAVE_HISTORY] = 100
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-save-history"
IRB.conf[:USE_READLINE] = true
IRB.conf[:AUTO_INDENT]=true

# Use the simple prompt if possible.
IRB.conf[:PROMPT_MODE] = :SIMPLE if IRB.conf[:PROMPT_MODE] == :DEFAULT

# Log to STDOUT if in Rails
if ENV.include?('RAILS_ENV') && !Object.const_defined?('RAILS_DEFAULT_LOGGER')
 require 'logger'
 RAILS_DEFAULT_LOGGER = Logger.new(STDOUT)
end

def log_sql
  ActiveRecord::Base.logger=Logger.new(STDOUT)
end

def test_routes
  include ActionController::UrlWriter
  default_url_options[:host] = 'fbi.gov'
end

def show_history
  ap Readline::HISTORY.to_a
end

#load File.dirname(FILE) + '/.railsrc' if $0 == 'irb' && ENV['RAILS_ENV']

alias :q :exit

HASH = {
  :bob => 'Marley', :mom => 'Barley',
  :gods => 'Harley', :chris => 'Farley'} unless defined?(HASH)
ARRAY = HASH.keys unless defined?(ARRAY)

class Object
  def local_methods
    (methods - Object.instance_methods).sort
  end
end

puts ".irbrc loaded"
