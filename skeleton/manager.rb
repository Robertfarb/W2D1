require_relative "employee"

class Manager < Employee
  attr_reader :employees
  
  def initialize(name, title, salary, boss=nil)
    super(name, title, salary, boss)
    @employees = []
  end
  
  def add_employee(employee)
    employees << employee
  end
  
  def bonus(multiplier)
    bonus = 0
    @employees.each do |employee|
      bonus += employee.salary
    end
    bonus *= multiplier
    @salary += bonus
    bonus
  end
  
end