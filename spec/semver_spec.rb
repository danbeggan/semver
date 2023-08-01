require_relative '../lib/semver'

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
end