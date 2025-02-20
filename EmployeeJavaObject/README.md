# Employee Details Management Program

This Java program allows users to manage employee details such as name, ID, age, contact number, and gender. It accepts input for multiple employees, stores the details in a list, and displays the information along with a classification of whether the employee is a "Major" or "Minor" based on their age and gender.

---

## Features

1. **Input Employee Details**:
   - Users can input details such as:
     - Name
     - ID
     - Age
     - Contact Number
     - Gender (Male/Female)

2. **Age Classification**:
   - Employees are classified as:
     - "He is a Major" or "She is a Major" if their age is 18 or above.
     - "He is a Minor" or "She is a Minor" if their age is below 18.

3. **Dynamic Input Handling**:
   - Allows users to enter details for multiple employees as specified during runtime.

4. **Display Employee Information**:
   - Displays the details of all employees entered by the user.

---

## Code Breakdown

### Class: `Employee1`

- **Attributes**:
  - `name`: Stores the name of the employee.
  - `id`: Stores the unique ID of the employee.
  - `age`: Stores the age of the employee.
  - `contactNumber`: Stores the contact number of the employee.
  - `Gender`: Stores the gender of the employee.

- **Setter Methods**:
  - `setName(String name)`: Sets the name.
  - `setId(int id)`: Sets the ID.
  - `setAge(int age)`: Sets the age.
  - `setContactNumber(String contactNumber)`: Sets the contact number.
  - `setGender(String Gender)`: Sets the gender.

- **Getter Methods**:
  - `getName()`: Retrieves the name.
  - `getId()`: Retrieves the ID.
  - `getAge()`: Retrieves the age.
  - `getContactNumber()`: Retrieves the contact number.
  - `getGender()`: Retrieves the gender.

### Main Method

1. **Input Handling**:
   - Prompts the user to enter the number of employees.
   - Collects the details for each employee using a `Scanner` object.

2. **Data Storage**:
   - Stores each employee's details in an `ArrayList` of `Employee1` objects.

3. **Output**:
   - Iterates through the list of employees to display their details.
   - Checks the employee's age and gender to classify them as a "Major" or "Minor".

---

## How to Use

1. Compile the code using:
   ```bash
   javac Employee1.java


#SAMPLE OUTPUT
Enter the number of employees to be added: 2

Enter details for Employee 1:
Name: John
ID: 101
Age: 25
Contact Number: 1234567890
Gender: Male

Enter details for Employee 2:
Name: Jane
ID: 102
Age: 17
Contact Number: 0987654321
Gender: Female

Employee List:
Name: John
ID: 101
Age: 25
Contact Number: 1234567890
Gender: Male
He is a Major

Name: Jane
ID: 102
Age: 17
Contact Number: 0987654321
Gender: Female
She is a Minor
