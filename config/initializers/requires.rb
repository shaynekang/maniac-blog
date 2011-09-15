# Dir[File.join(Rails.root, 'lib', '*.rb')].each do |f|
#   require f 
# end

Dir[File.join(Rails.root, 'lib', 'active_record', 'extensions', '*.rb')].each do |f|
  require f
end

#RELOAD_LIBS = Dir[Rails.root + 'lib/active_record/extensions/*.rb'] if Rails.env.development?