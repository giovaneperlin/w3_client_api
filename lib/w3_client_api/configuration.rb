module W3ClientApi
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  class Configuration
    attr_accessor :user
    attr_accessor :host
    attr_accessor :path
    attr_accessor :password
    attr_accessor :db

    def initialize
      @db = 'replace-me-with-your-db'
      @user = 'replace-me-with-your-user'
      @host = 'replace-me-with-your-host'
      @password = 'replace-me-with-your-password-host'
      @path = 'replace-me-with-your-path'
    end
  end
end
