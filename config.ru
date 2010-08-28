require 'sinatra'

app = proc do |env|
  [
    200,          # Status code
    {             # Response headers
      'Content-Type' => 'text/html',
      'Content-Length' => '2',
    },
    ['hi']        # Response body
  ]
end

# You can install Rack middlewares
# to do some crazy stuff like logging,
# filtering, auth or build your own.
use Rack::CommonLogger

#run app

set :env, :production
set :port, 4567
disable :run, :reload

require_relative 'blog'

run Blog

