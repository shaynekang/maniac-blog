def arg_to_hash(arg)
  if arg.empty?
    {} 
  else
    arg.first
  end
end

def request(method, action, params={})
  define_method 'request' do |*args|
    send(method, action, params.merge(arg_to_hash(args)))
  end
end

def mocks(*models)
  models.each do |model|
    define_method("mock_" + model.to_s) do |*stub|
      @mock ||= {}
      @mock[model.to_s] ||= mock_model(model.to_s.camelize.constantize, arg_to_hash(stub)).as_null_object
    end
  end
end