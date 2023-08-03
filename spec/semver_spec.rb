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
    let(:small) { Semver.new('1.10') }
    let(:medium) { Semver.new('2.9.3') }
    let(:large) { Semver.new('2.10') }

    it "should return true when checking smaller < larger" do
      expect(small < large).to eq(true)
      expect(medium < large).to eq(true)
      expect(large < small).to eq(false)
    end

    it "should return false when checking smaller > larger" do
      expect(small > large).to eq(false)
      expect(medium > small).to eq(true)
      expect(large > medium).to eq(true)
    end

    it "should return true when checking two equal versions" do
      expect(small == small).to eq(true)
    end
  end
end