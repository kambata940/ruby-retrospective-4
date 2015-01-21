module UI

  class LabelMain
    def initialize(&block)
      @data = []
      instance_eval(&block)
    end

    def horizontal(style: nil, border: nil, &block)
      horizontal = Horizontal.new(style: style, border: border, &block)
      @data << horizontal
    end

    def vertical(style: nil, border: nil, &block)
      vertical = Vertical.new(style: style, border: border, &block)
      @data << vertical
    end

    def label(text:, style: nil)
      style = @style if style == nil
      @data << Label.new(text: text, style: style)
    end

    def connect_data
      @data.map { |object| object.to_s }.reduce(:+)
    end

    def to_s
      connect_data
    end
  end

  class Horizontal < LabelMain
    def initialize(style: nil, border: nil, &block)
      @style, @border = style, border
      super(&block)
    end
  end

  class Vertical < LabelMain

    def initialize(style: nil, border: nil, &block)
      @style, @border = style, border
      super(&block)
    end

    def connect_data
      @data.reduce{ |object1, object2| object1.to_s + "\n" + object2.to_s }
    end
  end

  class Label
    def initialize(text:, style: nil)
      @text, @style = text, style
    end

    def to_s
      return @text if @style == nil
      @text.send(@style)
    end
  end

  class TextScreen

    def self.draw(&block)
      LabelMain.new(&block)
    end
  end
end