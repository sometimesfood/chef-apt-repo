define :ppa,
    :key_id => nil,
    :distribution => nil do

  # ppa name should have the form "user/archive"
  unless params[:name].count('/') == 1
    raise "Invalid PPA name"
  end

  ppa = params[:name]
  user, archive = ppa.split('/')
  key_id = params[:key_id]

  unless key_id
    # use the Launchpad API to get the correct archive signing key id
    require 'open-uri'
    base_url = 'https://api.launchpad.net/1.0'
    archive_url = "#{base_url}/~#{user}/+archive/#{archive}"
    key_fingerprint_url = "#{archive_url}/signing_key_fingerprint"
    key_id_long = open(key_fingerprint_url).read.tr('"', '')
    key_id = key_id_long[-8..-1]
  end

  # let the apt_repo definition do the heavy lifting
  apt_repo "#{user}_#{archive}.ppa" do
    key_id key_id
    distribution params[:distribution]
    keyserver "keyserver.ubuntu.com"
    url "http://ppa.launchpad.net/#{ppa}/ubuntu"
  end
end
