# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_jobboard_session',
  :secret      => '2e0c087f712e7c5c80b9da4fb4b05f300ea07fb472d9ba6a1cb457bcd65ed740206332d457917df956bcb34fb85ef0e7388b54b4640392c99000ab5152eb101f'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
