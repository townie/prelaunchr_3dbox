# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
Prelaunchr::Application.config.secret_token = ENV["RAILS_SECRET"] || '559c191031d2af8e376a2c3e152c296c9eab6b9d68bc67351e9e9059c4f3878a3d1f0290e2635eeceeb740bd8a1c4b8acba3a0eb62e22d0738dc353cc1031df4'
