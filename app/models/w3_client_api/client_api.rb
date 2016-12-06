module W3ClientApi
  class ClientApi
    def self.app_size
      size = 0
      Find.find(W3ClientApi.configuration.path) {
        |f| size += File.size(f) if File.file?(f)
      }
      format_size(size)
    end

    def self.storage_size
      @ssh_test = Net::SSH.start(
        W3ClientApi.configuration.host,
        W3ClientApi.configuration.user,
        password: W3ClientApi.configuration.password) do |ssh|
       result = ssh.exec!('ls -1d */ | xargs -I{} du {} -s && du -s')
       format_size(result.split(' ').first.to_i)
      end
    end

    def self.db_size
      query = "SELECT pg_size_pretty(pg_database_size('#{W3ClientApi.configuration.db}'))"
      results = ActiveRecord::Base.connection.execute(query)[0]['pg_size_pretty']
    end

    def self.memory_usage
      format_size filter_process.split(' ')[3].to_i
    end

    def self.cpu_usage
      format_size filter_process.split(' ')[2].to_i
    end

    private

    def self.filter_process
      %x(ps aux | grep #{W3ClientApi.configuration.user})
    end

    def self.format_size(size)
      conv = [ 'B', 'KB', 'MB', 'GB', 'TB', 'PG', 'EB' ];
      scale = 1024;

      ndx = 1
      if size < 2 * (scale**ndx)
        return "#{(size)} #{conv[ndx - 1]}"
      end
      size = size.to_f
      [2, 3, 4, 5, 6, 7].each do |ndx|
        if size < 2 * (scale**ndx)
          return "#{'%.3f' % (size / (scale**(ndx-1)))} #{conv[ndx - 1]}"
        end
      end
      ndx = 7
      return "#{'%.3f' % (size/(scale**(ndx-1)))} #{conv[ndx - 1]}"
    end
  end
end
