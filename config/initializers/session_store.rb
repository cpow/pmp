# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_pmp_session',
  :secret      => '6bee9391771fb976e7292c8e712f90e2840c1649cf9607f4e2a89e3d1d2dac3a640d47a5e4e6675e7becca1979c32d9466bce08e461abc64910ac149bb67a7ff'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
