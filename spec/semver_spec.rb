require_relative '../lib/semver'
require 'debug'

describe Semver do
  describe '.initialize' do
    context "when a valid version is provided" do
      it "should initialize without raising an error" do
        expect { Semver.new("1.2.3") }.not_to raise_error
      end
    end

    context "when an invalid version is provided" do
      it "should raise an ArgumentError" do
        expect { Semver.new(123) }.to raise_error(ArgumentError, "Version must be a string.")
      end
    end
  end

  context "when comparing versions" do
    let(:smaller) { Semver.new('1.10') }
    let(:larger) { Semver.new('2.10') }

    it "should return true when checking smaller < larger" do
      result = smaller < larger
      expect(result).to eq(true)
    end

    it "should return false when checking smaller > larger" do
      result = smaller > larger
      expect(result).to eq(false)
    end

    it "should return true when checking two equal versions" do
      result = smaller == smaller
      expect(result).to eq(true)
    end
  end
end