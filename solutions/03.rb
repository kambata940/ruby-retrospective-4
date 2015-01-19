module RBFS

  class File
    attr_accessor :data
    
    def initialize(data = nil)
      @data = data
    end
    
    def data_type
      case @data
        when String                  then :string
        when Symbol                  then :symbol
        when Fixnum, Float, Rational then :number
        when TrueClass, FalseClass   then :boolean
        when NilClass                then :nil
      end
    end

    def serialize
      data_type.to_s + ":" + @data.to_S
    end
    
    def self.parse(string_data)
    end

    def ser_length 
    end
  end

  class Directory
    
    attr_reader :files, :directories

    def initialize
      @files = {}
      @directories = {}
    end

    def add_file(name, file)
      fail ArgumentError if name.include?(":")
      @files[name] = file
    end

    def add_directory(name, directory = Directory.new)
      fail ArgumentError if name.include?(":")
      @directories[name] = directory
    end
    
    def [](name)
      if @directories.has_key?(name)
        @directories[name]
      elsif @files.has_key?(name)
        @files[name]
      end
    end

    def size
      @directories.size
    end

    def serialize
      Serialize.new(self)
    end

    def self.parse(string_data)
    end
  end

  class SerializeDirectories
    def initialize(current)
      @current_dir = current
    end

    def to_s
      SerializeFiles.new(current.files)
      @current.directories.map { |directory| Serialize.new(directory) }.reduce(:+) +
      @current.files.map { |file| Serialize.new(file) }
    end
  end

  class SerializeFiles < SerializeBase
    def initialize
      
    end
  end


end

