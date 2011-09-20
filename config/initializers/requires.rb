Dir[File.join(Rails.root, 'lib', 'active_record', 'extensions', '*.rb')].each do |f|
  require f
end