

shared_examples_for 'expect action' do |action|
  it "should #{action} the #{subject}" do
    subject.should_receive(action)
    request
  end
end

shared_examples_for 'redirect to' do |path, message|
  context message do
    it "the #{path} page" do
      request
      path = respond_to?(path) ? send(path) : path
      response.should redirect_to path
    end
  end
end

shared_examples_for 'render template' do |template, message|
  context "message" do
    before do
      subject.should_receive(:save!).and_raise(ActiveRecord::RecordInvalid.new(subject))
    end if message
    
    it "#{template}" do
      request
      response.should render_template(template)
    end
  end
end

shared_examples_for "assign session" do |key, value|
  it "should assign #{key} to session" do
    request
    session[key].should == eval(value)
  end
end

shared_examples_for "clear session" do |key|
  it "should clear #{key} session" do
    request
    session[key].should == nil
  end
end  

shared_examples_for "new notice" do |message|    
  it "should write new notice" do
    request
    flash[:notice].should == message
  end
end