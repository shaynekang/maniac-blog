Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV['TWITTER_CONSUMER_KEY'], ENV['TWITTER_CONSUMER_SECRET']
#  provider :twitter, 'YtxzwXypu3t8H1D2mk5UjA', 'CQlCxJ4LFOaxmTQEjaiJeWnYwpo1y2PC42CXrLzxoqc'
end