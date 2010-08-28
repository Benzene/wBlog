require 'sinatra'

use Rack::Lint
use Rack::ShowExceptions
use Rack::CommonLogger

set :env, :production
set :port, 4567
disable :run, :reload

require_relative 'blog'

run Blog

