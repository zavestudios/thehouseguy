class PropertiesController < ApplicationController
  before_action :set_property, only: [:show]

  def show

  end

  private

    def set_property
      metadata_cache = Rets::Metadata::FileCache.new("/tmp/metadata")

      client = Rets::Client.new({
        login_url: Rails.application.secrets.rets_login_url,
        username: Rails.application.secrets.rets_username,
        password: Rails.application.secrets.rets_password,
        version: Rails.application.secrets.rets_version,
        metadata_cache: metadata_cache
      })

      begin
        client.login
          @property = client.find :first, {
            search_type: 'Property',
            class: 'Residential',
            query: "(ListingKeyNumeric=#{params[:id]})"
          }
          photos = client.find :all, {
            search_type: 'Media',
            class: 'Media',
            query: "(ResourceRecordKeyNumeric=#{@property['ListingKeyNumeric']}),(MediaType=Image)"
          }
          @property["photos"] = photos
        return @property
        
      rescue => e
        puts 'Error: ' + e.message
        exit!
      end
      puts 'We connected! Lets log out...'
      client.logout
    end
end
