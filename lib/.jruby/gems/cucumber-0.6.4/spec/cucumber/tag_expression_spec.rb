require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
require 'cucumber/tag_expression'

module Cucumber
  describe TagExpression do
    context "no tags" do
      before(:each) do
        @e = TagExpression.new
      end

      it "should match @foo" do
        @e.eval(['@foo']).should == true
      end

      it "should match empty tags" do
        @e.eval([]).should == true
      end
    end

    context "@foo" do
      before(:each) do
        @e = TagExpression.new
        @e.add(['@foo'])
      end

      it "should match @foo" do
        @e.eval(['@foo']).should == true
      end

      it "should not match @bar" do
        @e.eval(['@bar']).should == false
      end
    end

    context "!@foo" do
      before(:each) do
        @e = TagExpression.new
        @e.add(['~@foo'])
      end

      it "should match @bar" do
        @e.eval(['@bar']).should == true
      end

      it "should not match @foo" do
        @e.eval(['@foo']).should == false
      end
    end

    context "@foo || @bar" do
      before(:each) do
        @e = TagExpression.new
        @e.add(['@foo', '@bar'])
      end

      it "should match @foo" do
        @e.eval(['@foo']).should == true
      end

      it "should match @bar" do
        @e.eval(['@bar']).should == true
      end

      it "should not match @zap" do
        @e.eval(['@zap']).should == false
      end
    end

    context "(@foo || @bar) && !@zap" do
      before(:each) do
        @e = TagExpression.new
        @e.add(['@foo', '@bar'])
        @e.add(['~@zap'])
      end

      it "should match @foo" do
        @e.eval(['@foo']).should == true
      end

      it "should not match @foo @zap" do
        @e.eval(['@foo', '@zap']).should == false
      end
    end

    context "(@foo:3 || !@bar:4) && @zap:5" do
      before(:each) do
        @e = TagExpression.new
        @e.add(['@foo:3', '~@bar'])
        @e.add(['@zap:5'])
      end

      it "should count tags for positive tags" do
        @e.limits.should == {'@foo' => 3, '@zap' => 5}
      end

      it "should match @foo @zap" do
        @e.eval(['@foo', '@zap']).should == true
      end
    end

    context "Parsing '@foo:3,~@bar', '@zap:5'" do
      before(:each) do
        @e = TagExpression.parse([' @foo:3 , ~@bar ', ' @zap:5 '])
      end

      it "should split and trim" do
        @e.__send__(:ruby_expression).should == "(!vars['@bar']||vars['@foo'])&&(vars['@zap'])"
      end

      it "should have limits" do
        @e.limits.should == {"@zap"=>5, "@foo"=>3}
      end
    end

    context "Parsing ''" do
      before(:each) do
        @e = TagExpression.parse([''])
      end

      it "should ignore empty tags" do
        @e.eval("@foo").should == true
      end
    end
  end
end