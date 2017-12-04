require 'rack/request'
require 'uri'
module Aikido
  module Redirection
    autoload :Configuration, 'akido_redirection/configuration'
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

    def initialize(app)
      @app = app
      build_redirect_proc
    end

    def call(env)
      request = Rack::Request.new(env)
      if request.get_header(self.configuration.assailant_header)
        #handle the assailant
        handle_assailant(request, env)
      else
        #Let it through
        @app.call(env)
      end
    end


    private
    def handle_assailant(req, env)
      proc = build_redirect_proc(load_proc_vars(req))
      proc.call(env)
    end

    def build_redirect_proc(status_code, url, message)
      Proc.new{|env| build_redirect_response(status_code, url, message)} #Setup the redirection proc based on the rqeuest type
    end

    def build_redirect_response(status_code, url, message)
        [
          status_code,
          {
            'Location' => url,
            'Content-Type' => 'text/html',
            'Content-Length' => '0'
          },
          [message]
        ]
    end

    def load_proc_vars(req)
      #Load the configuration options
      if req.put? || req.patch? || req.post? || req.delete?
        code = self.configuration.other_redirect_status
        url = build_redirect_url(self.configuration.other_redirect_url)
        message = self.configuration.other_redirect_message
      else
        code = self.configuration.get_redirect_status
        url = build_redirect_url(self.configuration.get_redirect_url)
        message = self.configuration.get_redirect_message
      end
      code, url, message
    end

    def build_redirect_url(url, query_options)
    end
  end
end