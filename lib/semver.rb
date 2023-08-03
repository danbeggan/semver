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
    when '~>'
      if version.match(/\d+\.\d+\.\d+/)
        # if version includes a patch
        self >= Semver.new(version) && self < Semver.new(version).bump(:minor)
      else
        self >= Semver.new(version) && self < Semver.new(version).bump(:major)
      end
    when '>'
      self > Semver.new(version)
    when '>='
      self >= Semver.new(version)
    when '<'
      self < Semver.new(version)
    when '<='
      self <= Semver.new(version)
    when '=='
      self == Semver.new(version)
    else
      raise ArgumentError, "Invalid operator: #{operator}"
    end
  end

  def bump(type)
    case type
    when :major
      self.major += 1
      self.minor = 0
      self.patch = 0
    when :minor
      self.minor += 1
      self.patch = 0
    when :patch
      self.patch += 1
    else
      raise ArgumentError, "Invalid bump type: #{type}"
    end
    return self
  end

  def to_s
    "#{self.major}.#{self.minor}.#{self.patch}"
  end
end