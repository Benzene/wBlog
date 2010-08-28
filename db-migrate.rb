#!/usr/bin/env ruby

require_relative 'lib/db-config'

require 'dm-migrations'
DataMapper.auto_migrate!

