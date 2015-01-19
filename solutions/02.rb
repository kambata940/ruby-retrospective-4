class NumberSet
  include Enumerable
  def initialize
    @set = []
  end

  def <<(number)
    @set << number unless @set.include?(number)
    @set
  end

  def size
    @set.size
  end

  def empty?
    @set.empty?
  end

  def [](filter)
    select{ |number| filter[number] }
  end

  def each(&block)
    @set.each( &block)
  end
end

class Filter
  def initialize(&block)
    @condition = block
  end

  def [](number)
    @condition.call(number)
  end

  def &(other)
    Filter.new{ |number| self[number] and other[number] }
  end

  def |(other)
    Filter.new{ |number| self[number] or other[number] }
  end
end

class TypeFilter < Filter
  def initialize(type)
    @type = type
  end

  def [](number)
    case @type
      when :integer then number.is_a?(Integer)
      when :real then number.is_a?(Float) or number.is_a?(Rational)
      when :complex then number.is_a?(Complex)
    end
  end
end

class SignFilter < Filter
  def initialize(sign)
    @sign = sign
  end

  def [](number)
    case @sign
      when :positive then number > 0
      when :non_positive then number <= 0
      when :negative then number < 0
      when :non_negative then number >= 0
    end
  end
end
