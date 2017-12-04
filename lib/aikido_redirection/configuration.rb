module Aikido
  module Redirection
    class Configuration
      attr_accessor :assailant_header, #Defaults to "X-AIKIDO-ASSAILANT" This is what the middleware checks for before redirecting
                    :get_redirect_status, #Defaults to 301 for get requets
                    :other_redirect_status, #Defaults to 303- This is the status that is triggered when an assialiant is detected via a PUT/PATCH/POST/DELETE request
                    :get_redirect_url, # Defaults to https://google.com - Url that the assialiant is redirected to when detcted via a GET request
                    :other_redirect_url, # Defaults to https://google.com - Url that assialiant is redirected to when detected via a PUT/PATCH/POST/DELETE request
                    :get_redirect_query_params, #Defaults to {}  for assialinats detected via a GET request you can use these to optionally send the assailant to a page with additional query params like {"foo": "bar, "foo2": "bar2"}
                    :other_redirect_query_params,  #Defaults to {} for assailants detected via a PUT/PATCH/POST/DELETE request you can use these to optionally send the assailant to a page with additional query params like {"foo": "bar, "foo2": "bar2"}
                    :get_redirect_message, #Defaults to BUH BYE!
                    :other_redirect_message #Deafults to BUH BYE!
      def initialize
        @assailant_header = "X-AIKIDO-ASSAILANT"
        @get_redirect_status = 301
        @other_redirect_status = 303
        @get_redirect_url, @other_redirect_url = "https://google.com"
        @get_redirect_query_params, @other_redirect_query_params = {}
        @get_redirect_message, @other_redirect_message = "BUH BYE!"
      end

      #Setters for checking if the configuration variables are the right types, raises ArgumentError if it does not match the expected type when configured through an Initializer block
      def assailant_header=(header)
        raise ArgumentError,
          "The assialiant_header option is expected to be a String" unless header.is_a? String
      end

      def get_redirect_status=(status)
        raise ArgumentError,
          "The get_redirect_status option is expected to be an Integer" unless status.is_a? Integer
      end

      def other_redirect_status=(status)
        raise ArgumentError,
          "The other_redirect_status option is expected to be an Integer" unless status.is_a? Integer
      end

      def get_redirect_url=(url)
        raise ArgumentError,
          "The get_redirect_url option is expected to be a String" unless url.is_a? String
      end

      def other_redirect_url=(url)
        raise ArgumentError,
          "The other_redirect_url option is expected to be a String" unless url.is_a? String
      end

      def get_redirect_query_params=(params)
        raise ArgumentError,
          "The get_redirect_query_params option is expected to be a Hash" unless params.is_a? Hash
      end

      def other_redirect_query_params=(params)
          raise ArgumentError,
            "The other_redirect_query_params option is expected to be a Hash" unless params.is_a? Hash
      end

      def get_redirect_message=(message)
        raise ArgumentError,
          "The get_redirect_message option is expected to be a String" unless message.is_a? String
      end

      def other_redirect_message(message)
        raise ArgumentError, "The other_redirect_message option is expected to be a String" unless message.is_a? String
      end
    end
  end
end
