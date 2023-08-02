class Semver
  attr_accessor :version

  def initialize(version)
    if version.is_a?(String)
      @version = version
    else
      raise ArgumentError, "Version must be a string."
    end
  end

  def ==(other)
    self.version == other.version
  end

  def <(other)
    self.version < other.version
  end

  def >(other)
    self.version > other.version
  end
end