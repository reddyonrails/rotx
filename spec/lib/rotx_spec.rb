require 'spec_helper'
require_relative '../../lib/rotx'
describe Rotx do
  include Rotx

  describe "#rotx" do

    context "Argument error handling" do
      it "should raise error when integer is not proper" do
        expect {rotx(nil, 'Hello, World')}.to raise_error { |error|
          error.should be_a(ArgumentError)
        }
      end
      it "should raise error when string is not proper" do
        expect {rotx(10, nil)}.to raise_error { |error|
          error.should be_a(ArgumentError)
        }
      end
    end
    context "when cipher is not given" do
      it "should take numberic number and string to encrypt" do
        should_receive(:rotx).with(10, 'Hello, World')
        rotx(10, 'Hello, World')
      end
    end
    context "when cipher is encrypt" do
      it "should take numberic number , string to encrypt, symbol is encrypt" do
        rotx(10, 'Reddy, OnRails').should == "Bonni, YxBksvc"
      end

      it "rotation numbers greater than 36 should work as well" do
        rotx(36, 'Reddy, OnRails').should == "Bonni, YxBksvc"
      end
    end

    context "when cipher is decrypt" do
      it "should take numberic number , string to encrypt, symbol is decrypt" do
        rotx(10, 'Bonni, YxBksvc', :decrypt).should == "Reddy, OnRails"
      end
    end
  end

end