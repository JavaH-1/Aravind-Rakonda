package Emp_Details;

import java.util.ArrayList;
import java.util.Scanner;

class Employee1 {
    private String name;
    private int id;
    private int age;
    private String contactNumber;
	private String Gender;

    // Setter methods
    public void setName(String name) {
        this.name = name;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public void setContactNumber(String contactNumber) {
        this.contactNumber = contactNumber;
    }
	
	public void setGender(String Gender) {
		this.Gender = Gender;
	}

    // Getter methods
    public String getName() {
        return name;
    }

    public int getId() {
        return id;
    }

    public int getAge() {
        return age;
    }

    public String getContactNumber() {
        return contactNumber;
    }
	
	public String getGender() {
        return Gender;
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        ArrayList<Employee1> employeeList = new ArrayList<>();

        System.out.print("Enter the number of employees to be added: ");
        int numOfEmployees = scanner.nextInt();
        scanner.nextLine(); // Consume the leftover newline

        for (int i = 0; i < numOfEmployees; i++) {
            Employee1 employee = new Employee1();
            System.out.println("\nEnter details for Employee " + (i + 1) + ":");

            System.out.print("Name: ");
            employee.setName(scanner.nextLine());

            System.out.print("ID: ");
            employee.setId(scanner.nextInt());
            scanner.nextLine(); 

            System.out.print("Age: ");
            employee.setAge(scanner.nextInt());
            scanner.nextLine(); 

            System.out.print("Contact Number: ");
            employee.setContactNumber(scanner.nextLine());
			
			System.out.println("Gender: ");
			employee.setGender(scanner.nextLine());
			
            employeeList.add(employee);
        }
		
		
		
        System.out.println("\nEmployee List:");
        for (Employee1 employee : employeeList) {
            System.out.println("Name: " + employee.getName());
            System.out.println("ID: " + employee.getId());
            System.out.println("Age: " + employee.getAge());
            System.out.println("Contact Number: " + employee.getContactNumber());
			System.out.println("Gender :" + employee.getGender());
            System.out.println(); // Blank line for better readability
			
			String gender = employee.getGender();
		    int age = employee.getAge();
			
			if (age >= 18) {
				if (gender.equalsIgnoreCase("Male")) {
					System.out.println("He is a Major");
					System.out.println();
				}
				else if (gender.equalsIgnoreCase("female")){
					System.out.println("She is a Major");
					System.out.println();
				}	
			} else if (age < 18) {
				if (gender.equalsIgnoreCase("Male")) {
					System.out.println("He is a Minor");
					System.out.println();
				}
				else if (gender.equalsIgnoreCase("female")){
					System.out.println("She is a Minor");
					System.out.println();
				}	
			}
        }
		
		System.out.println(employeeList);
			
		
		
		
        scanner.close();
    }
}
