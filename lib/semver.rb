class Semver
  include Comparable

  attr_accessor :major, :minor, :patch

  def initialize(version)
    if version.is_a?(String)
      @major, @minor, @patch = version.split('.').map(&:to_i)
    else
      raise ArgumentError, "Version must be a string."
    end
  end

  def <=>(other)
    [major, minor, patch] <=> [other.major, other.minor, other.patch]
  end
end