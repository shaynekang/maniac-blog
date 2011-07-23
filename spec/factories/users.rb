Factory.define :user, :default_strategy => :build do |f|
  f.provider 'twitter'
  f.uid  '37'
  f.admin false
end