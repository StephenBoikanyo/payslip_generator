import 'package:payslip_generator/employee.dart';
import 'package:excel/excel.dart';
import 'dart:io';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

Future<void> main() async {
  final List<Employee> employees = [
    Employee(
        fullName: 'Jacob Zuma',
        designation: 'President',
        salary: 1000.00,
        employeeNumber: 'RSA001'),
    Employee(
        fullName: 'Cyril Ramaphoses',
        designation: 'Deputy President',
        salary: 650.00,
        employeeNumber: 'RSA002'),
    Employee(
        fullName: 'Tokyo Sexwale',
        designation: 'Hitman',
        salary: 200.00,
        employeeNumber: 'RSA003'),
  ];

  final templateFilePath = 'template.xlsx';

  await Future.forEach(employees, (employee) async {
    final templateBytes = File(templateFilePath).readAsBytesSync();
    final excel = Excel.decodeBytes(templateBytes);
    // final excel = Excel.createExcel();
    final sheet = excel['Sheet1'];

    // Populate specific cells in the Excel spreadsheet with employee details

    sheet.cell(CellIndex.indexByString('D14')).value = employee.fullName;
    sheet.cell(CellIndex.indexByString('A16')).value = employee.designation;
    sheet.cell(CellIndex.indexByString('G19')).value = employee.salary;
    sheet.cell(CellIndex.indexByString('A1')).value = employee.employeeNumber;
    //sheet.cell(CellIndex.indexByString('I1')).value = employee.date;

    final excelFileName =
        '${employee.fullName}_${employee.employeeNumber}.xlsx';
    //final pdfFileName = '${employee.fullName}_${employee.employeeNumber}.pdf';

    // Save Excel spreadsheet
    File(excelFileName).writeAsBytesSync(excel.encode()!);
  });
}
