require 'rails_helper'
require 'json'

client_api = W3ClientApi::ClientApiController

describe client_api, type: :controller do
  describe 'GET #index' do
    array = ['app', 'db', 'storage', 'memory', 'cpu']
    array.each do |t|
      context "returns json with #{t} size containing" do
        it 'size type of fixnum' do
          get :index
          json = JSON.parse(response.body)
          size = json['size'][t].split(' ')[0].to_i
          expect(size).to be_kind_of(Fixnum)
        end

        it 'orders of magnitude type of string' do
          get :index
          json = JSON.parse(response.body)
          size = json['size'][t].split(' ')[1]
          expect(size).to be_kind_of(String)
        end
      end
    end
  end
end
