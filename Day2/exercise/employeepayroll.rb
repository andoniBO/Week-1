class Employee
    attr_reader :name, :email
    def initialize(name, email)
      @name = name
      @email = email
    end
end

class HourlyEmployee < Employee
    def initialize(name, email, hourly_rate, hours_worked)
        super(name, email)
        @hourly_rate = hourly_rate
        @hours_worked = hours_worked
    end

    def calculate_salary
      #returns the hours worked * hourly_rate
      return @hourly_rate * @hours_worked
    end
end

class SalariedEmployee < Employee
	def initialize(name, email, salary)
		super(name,email)
		@salary=salary
	end

	def calculate_salary
		return (@salary/52)
	end
end

class MultiPaymentEmployee < Employee
	def initialize(name, email, salary, hourly_rate, hours_worked)
		super(name, email)
		@salary= salary
		@hours_worked=hours_worked
		@hourly_rate=hourly_rate	
	end

	def calculate_salary
		return ((@salary/52) + (@hourly_rate*@hours_worked))
	end
end

class Payroll
    def initialize(employees)
        @employees = employees
    end
	
	def notify_empolyee (employee)
		puts "email sent to #{employee.email}"
	end



	def pay_employees
		total_salary = 0
		@employees.each do |item| 
			puts "#{item.name} => #{item.calculate_salary*1.18}"
			notify_empolyee(item)
			total_salary += item.calculate_salary
		end

		puts "The total money to pay is:#{total_salary*1.18}per week"

	  # Should output how much we're paying each employee for this week and the total amount spent on payroll this week. 
		
	end
end

empleado1 = HourlyEmployee.new("Tomas", "aquiestatomas@gmail.com", 35, 50)
empleado2 = SalariedEmployee.new("Josefran", "miemail@gmail.com", 50000)
empleado3 = MultiPaymentEmployee.new("Efrain", "yo@gmail.com", 100000, 100, 2)

employees=Array.new
employees.push(empleado1)
employees.push(empleado2)
employees.push(empleado3)

payroll = Payroll.new(employees)

puts empleado1.calculate_salary
puts empleado2.calculate_salary
puts empleado3.calculate_salary

payroll.pay_employees