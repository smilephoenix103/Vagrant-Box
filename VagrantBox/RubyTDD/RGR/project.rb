class Project
    attr_accessor :name, :description

    def initialize()
        @name
        @description
    end

    def elevator_pitch
        p "#{@name}, #{@description}"
    end
end