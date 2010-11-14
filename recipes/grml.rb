apt_repo "grml" do
  key_id "ECDEA787"
  keyserver "subkeys.pgp.net"
  key_package "grml-debian-keyring"
  url "http://deb.grml.org/"
  distribution "grml-stable"
  components "main"
end
