module UI

  class LabelMain
    attr_accessor :result, :text
    def initialize(text, border, style)
      @text, @border, @style = text, border, style
      stylization
    end

    def self.label(text:,style: nil,border: nil)
      @result << LabelMain.new(name, style, border)
    end

    def self.temp_array(object)
      if nil
        @result = []
      else
        @result << object
      end
    end

    def horizontal(text:, style: nil, border: nil, &block)
      LabelMain.temp_array(nil)
      LabelMain.class_eval{ define_method(:temp_horizontal, block) }
    end

    def vertical(text:, style: nil, border: nil, &block)
      LabelMain.temp_array(nil)
      LabelMain.class_eval{ define_method(:temp_vertical, block) }
    end

    def stylization
      if @style.respond_to?(@style.to_sym)
        @text = @text.method(@style)
      end
        @text = @border.to_s + @text + @border.to_s
    end
  end

  class TextScreen

    def self.draw(&block)
      LabelMain.class_eval{ define_method(:temp_drawer, block) }
    end
  LabelMain.temp_drawer
  end
end