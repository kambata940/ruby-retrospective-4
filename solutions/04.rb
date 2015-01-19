module UI

  class LabelMain
    def initialize(&block)
      @data = []
      block yield # horizontal(&block)
    end

    def horizontal(style: nil, border: nil, &block)
      horizontal = Horizontal.new(style: style, border: border, &block) # <Object - Horizontal-1.01 - @style, @border, @data,
      @data << horizontal
    end

    def vertical(style: nil, border: nil, &block)
      vertical = Vertical.new(style: style, border: border)
      vertical.instance_eval(&block)
    end

    def label(text:, style: nil, border: nil)
      style = @style unless style == nil
      @data << Label.new(text: text, style: style, border: border)
    end

    def connect_data
      @data.map { |object| object.to_s }.reduce(:+)
    end

    def to_s
      @data.connect_data  
    end
  end

  class Horizontal < LabelMain
    def initialize(style: nil, border: nil, &block)
      @style, @border = style, border
      super(&block) # []
    end
  end

  class Vertical < LabelMain
    
    def initialize(style: nil, border: nil, &block)
      @style, @border = style, border
      super(&block) # []
    end

    def connect_data
      @data.reduce{ |object1, object2| object1.to_s + '\n' + object2.to_s}
    end
  end

  class Label

    def initialize(text:, style: nil, border: nil)
      @text, @style, @border = text, style, border
    end

    def to_s
      @text.send(@style)
    end
  end

  class TextScreen

    def self.draw(&block)
      LabelMain.new(&block)
    end
  end
end