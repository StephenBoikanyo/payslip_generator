class Employee {
  late String fullName;
  late String designation;
  late double salary;
  late String employeeNumber;
  late String date;

  Employee(
      {required this.fullName,
      required this.designation,
      required this.salary,
      required this.employeeNumber,
      this.date = '30 September 2023'});
}
