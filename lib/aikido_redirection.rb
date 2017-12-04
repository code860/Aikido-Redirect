require 'rack/request'
require 'uri'
module Aikido
  module Redirection
    #Handles Configuration Default / Initializer
    autoload :Configuration, 'aikido_redirection/configuration'
    autoload :Handler, 'aikido_redirection/handler'
    class << self
      attr_writer :configuration
      def configuration
        @configuration ||= Configuration.new
      end

      def configure
        yield configuartion
      end

      def reset_config
        @configuration = Configuration.new
      end
    end

    class AkidioRedirect
      def initialize(app)
        @app = app
      end

      def call(env)
        Handler.response(env, @app)
      end
    end

  end
end
