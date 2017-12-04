module Aikido::Redirection
  class Handler
    class << self
      attr_reader :config
      def config
        Aikido::Redirection.configuration
      end
    end

    def self.response(app, env)
      request = Rack::Request.new(env)
      if request.get_header(self.config.assailant_header)
        #Check Header in config and if present run through and redirect the assailant using the following method(s)
        response = handle_assailant(request)
      else
        #Let it through
        status, headers, response = app.call(env)
        response = [status, headers, response]
      end
      response
    end

    private

    def handle_assailant(req)
      build_redirect_response(load_response_vars(req))
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

    def load_response_vars(req)
      #Load the config options
      if req.put? || req.patch? || req.post? || req.delete?
        code = self.config.other_redirect_status
        url = build_redirect_url(self.config.other_redirect_url)
        message = self.config.other_redirect_message
      else
        code = self.config.get_redirect_status
        url = build_redirect_url(self.config.get_redirect_url)
        message = self.config.get_redirect_message
      end
      return code, url, message
    end

    def build_redirect_url(url, query_options)
      uri = URI(url)
      uri.query = URI.encode_www_form(URI.decode_www_form(uri.query || '').concat(query_options.to_a))
      uri.to_s
    end

  end
end
