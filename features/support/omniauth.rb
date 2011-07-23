Before('@omniauth') do
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:twitter] = {
      "provider"=>"twitter",
      "uid" => "37"
  }
end

After('@omniauth') do
  OmniAuth.config.test_mode = false
end

