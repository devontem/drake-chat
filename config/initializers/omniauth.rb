Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['857413437641796'], ENV['7e830f13d0a8e74ecc407369dcc66239'],
           scope: 'public_profile', display: 'page', image_size: 'square'
           
           
           
    provider :twitter, ENV['xsiQh2qMslPBWpEsJm4C9CLmR'], ENV['zd74tEOo53GHkThtWLOCPnDlEy9cfg8W6eVoqbXreqKf1Rwxis'], image_size: 'normal'
end

