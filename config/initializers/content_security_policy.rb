# Be sure to restart your server when you modify this file.

# Define an application-wide content security policy
# For further information see the following documentation
# https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Security-Policy

#Rails.application.config.content_security_policy do |policy|
   #policy.default_src :self#, :https
   #policy.font_src    :self, :https, :data
   #policy.img_src     :self, :https, :data
   #policy.object_src  :none
#   policy.script_src  :self, "https://kit.fontawesome.com/8142b3c685.js"
#   policy.style_src   :self, "'sha256-prH0YYPGcaWqMavuVeLAOHuwmEiAxnEbf1hXCiI5DmU='", "'sha256-YiAoY/iLhrv71MsPpBIb+P7dvB9UyTg/BPmcwYMZqAs='", "'sha256-xsFlEpG9vur3YCO/deqeAkrOzIUkSQXfhqW9mOKU48A='", "'sha256-tqj7Ke8qONxsuNQ56V9tmUtGobavuWa9Kgsw/Gr2Zg4='"
   # If you are using webpack-dev-server then specify webpack-dev-server host
   #policy.connect_src :self, :https, "http://localhost:3000", "ws://localhost:3000" if Rails.env.development?

#   # Specify URI for violation reports
#   # policy.report_uri "/csp-violation-report-endpoint"
#end

# If you are using UJS then enable automatic nonce generation
# Rails.application.config.content_security_policy_nonce_generator = -> request { SecureRandom.base64(16) }

# Set the nonce only to specific directives
# Rails.application.config.content_security_policy_nonce_directives = %w(script-src)

# Report CSP violations to a specified URI
# For further information see the following documentation:
# https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Security-Policy-Report-Only
# Rails.application.config.content_security_policy_report_only = true
