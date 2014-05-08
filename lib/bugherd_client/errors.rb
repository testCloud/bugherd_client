module BugherdClient
  module Errors

    class InvalidOption < StandardError
      def initialize(msg="invalid option")
        super(msg)
      end
    end

    class NotAvailable < StandardError
      def initialize(api_version, msg="")
        super("#{msg} not available in API v#{api_version}")
      end
    end

    class UnsupportedMethod < StandardError
      def initialize(api_version="")
        super("Method supported in API version #{api_version}")
      end
    end

    class UnsupportedAttribute < StandardError
      def initialize(api_version="", attrs=[])
        super("Attributes (#{attrs.join(',')}) supported in #{api_version}")
      end
    end
  end
end