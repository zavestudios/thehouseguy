class RetsWebService

  def get_homepage_props
    metadata_cache = Rets::Metadata::FileCache.new("/tmp/metadata")
    image = ''

    # Pass the :login_url, :username, :password and :version of RETS
    client = Rets::Client.new({
      login_url: Rails.application.secrets.rets_login_url,
      username: Rails.application.secrets.rets_username,
      password: Rails.application.secrets.rets_password,
      version: Rails.application.secrets.rets_version,
      metadata_cache: metadata_cache
    })

    begin

      client.login

      properties = client.find :all, {
        search_type: 'Property',
        class: 'Residential',
        query: '(YearBuilt=2017+), (PostalCode=91752)',
        # limit to multiples of 3, for the homepage
        limit: 3
      }

      properties.each do |property|
        photo = client.find :first, {
          search_type: 'Media',
          class: 'Media',
          query: "(ResourceRecordKeyNumeric=#{property['ListingKeyNumeric']}),(MediaType=Image)",
          limit: 1
        }
        property["MediaURL"] = photo["MediaURL"]
      end

      return properties

      rescue => e
        puts 'Error: ' + e.message
        exit!
      end

      puts 'We connected! Lets log out...'
      client.logout
  end
end

#def get_principal_photo(keys)
#  keys.each do |photo|
#    photos = client.find :all, {
#    search_type: 'Media',
#    class: 'Media',
#    query: '(ListingKeyNumeric=292664445),(MediaType=Image)',
#    limit: 3
#  }
#end
