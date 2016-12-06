require 'find'
require 'net/ssh'

module W3ClientApi
  class ClientApiController < ApplicationController
    def index
      render json: {
        size: {
          app: ClientApi.app_size,
          storage: ClientApi.storage_size,
          db: ClientApi.db_size,
          memory: ClientApi.memory_usage,
          cpu: ClientApi.cpu_usage
        }
      }
    end
  end
end
