class Semver
  include Comparable

  attr_accessor :major, :minor, :patch

  def initialize(version)
    if version.is_a?(String)
      @major, @minor, @patch = version.split('.').map(&:to_i)
      @patch = 0 if @patch == nil
    else
      raise ArgumentError, "Version must be a string."
    end
  end

  def <=>(other)
    [major, minor, patch] <=> [other.major, other.minor, other.patch]
  end

  def match?(version_with_operator)
    data = version_with_operator.match(/(\D+)\s([\d|\.]+)/)
    operator, version = data[1], data[2]

    case operator
    when '>'
      self > Semver.new(version)
    when '<'
      self < Semver.new(version)
    when '=='
      self == Semver.new(version)
    else
      raise ArgumentError, "Invalid operator: #{operator}"
    end
  end
end