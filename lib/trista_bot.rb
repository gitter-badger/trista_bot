require 'unicode'
require 'dotenv/load'
require 'telegram/bot'
require 'telegram/bot/botan'

require_relative "core_ext/string"

require_relative "trista_bot/answer"
require_relative "trista_bot/listener"
require_relative "trista_bot/responder"
require_relative "trista_bot/tracker"

module TristaBot; end
