class Project
  attr_accessor :name, :description, :owner
  attr_reader :tasks
  def initialize(name, description, owner)
    @name = name
    @description = description
    @owner = owner
    @tasks = []
  end

  def elevator_pitch
    p "#{@name}, #{@description}"
  end

  def add_task(task)
    @tasks << task
  end

  def print_tasks
    @tasks.each { |task| puts task }
  end

end

