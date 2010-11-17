#!/usr/bin/env ruby
#encoding: UTF-8

require_relative 'lib/db-config'

require 'dm-migrations'
DataMapper.auto_migrate!

