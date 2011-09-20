require 'spec_helper'

describe ApplicationHelper do
  describe "#markdown" do
    it "should convert message to html" do
      markdown("Hello world").should == "<p>Hello world</p>"
    end
  end
  
  describe "#syntax_highlighter" do
    it "should highlight syntax" do
      code = <<-EOF
        <pre lang="ruby">
          <code>
            puts &quot;Hello World!&quot; 
          </code>
        </pre> 
      EOF
      
      expect = <<-EOF
        <div class=\"highlight\">
          <pre>
            <span class=\"nb\">puts</span><span class=\"s2\">\"Hello World!\"</span>
          </pre>
        </div>
      EOF
      
      syntax_highlighter(code).gsub(/ /,'').should == expect.gsub(/ /,'')
    end
  end
end