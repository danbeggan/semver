class Semver
  attr_accessor :version

  def initialize(version)
    if version.is_a?(String)
      @version = version
    else
      raise ArgumentError, "Version must be a string."
    end
  end
end