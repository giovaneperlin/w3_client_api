require 'find'
require 'net/ssh'

module W3ClientApi
  class ClientApiController < ApplicationController
    def index
      if ClientApi.key == params[:key]
        render json: {
          size: {
            app: ClientApi.app_size,
            storage: ClientApi.storage_size,
            db: ClientApi.db_size,
            memory: ClientApi.memory_usage,
            cpu: ClientApi.cpu_usage
          }
        }
      else
        render json: { error: 'restricted access' }
      end
    end
  end
end
