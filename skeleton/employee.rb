require_relative "manager"

class Employee
  attr_reader :name, :title, :salary, :boss
  def initialize (name, title, salary, boss = nil)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end
  
  def bonus(multiplier)
    bonus = @salary * multiplier
    bonus
  end
  
  # def make_manager
  #   Manager.new(@name, @title, @salary, @boss)
  # end
  
end

if $PROGRAM_NAME == __FILE__
  ned = Manager.new("ned", "founder", 1000000)
  darren = Manager.new("darren", "ta manager", 78000, ned)
  
  
  shawna = Employee.new("shawna", "ta", 12000, darren)
  david = Employee.new("david", "ta", 10000, darren)
  
  ned.add_employee(darren)
  ned.add_employee(shawna)
  ned.add_employee(david)
  
  darren.add_employee(shawna)
  darren.add_employee(david)
  
  
  
  p ned.bonus(5) # => 500_000
  p darren.bonus(4) # => 88_000
  p david.bonus(3) # => 30_000
end
