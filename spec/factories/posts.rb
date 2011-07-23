Factory.define :post, :default_strategy => :build do |f|
  f.title 'Hello'
  f.content 'Hello World'
end
