import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:http/http.dart' as http;
class PoliceDataTable extends StatefulWidget {
 // const PoliceDataTable({Key? key}) : super(key: key);

  @override
  _PoliceDataTableState createState() => _PoliceDataTableState();
}

class _PoliceDataTableState extends State<PoliceDataTable> {
  late EmployeeDataSource employeeDataSource;
  late List<GridColumn> _columns;
  Future<dynamic> generateEmployeeList() async {
    // Give your sever URL of get_employees_details.php file
    var url = Uri.parse('https://ocmr.000webhostapp.com/policedatatable.php');
    // Starting Web API Call.
    var response = await http.get(url);
    var list = json.decode(response.body);
    List<Employee> _employees =
    await list.map<Employee>((json) => Employee.fromJson(json)).toList();

    employeeDataSource = EmployeeDataSource(_employees);
    return _employees;
  }
  List<GridColumn> getColumns() {
    return <GridColumn>[
       GridColumn(
          columnName: 'id',
          width: 60,
          label: Container(
              padding: EdgeInsets.all(8.0),
              alignment: Alignment.center,
              child: Text(
                'ID',style:GoogleFonts.sora(
                  color: Colors.red, fontWeight: FontWeight.bold , fontSize: 20
              )))),
      GridColumn(
          columnName: 'Name',
          width: 160,
          label: Container(
              padding: EdgeInsets.all(8.0),
              alignment: Alignment.center,
              child: Text('Name' , style:GoogleFonts.sora(
                  color: Colors.red, fontWeight: FontWeight.bold , fontSize: 20
              )))),
      GridColumn(
          columnName: 'Phone',
          width: 140,
          label: Container(
              padding: EdgeInsets.all(8.0),
              alignment: Alignment.center,
              child: Text('Phone' , style:GoogleFonts.sora(
                  color: Colors.red, fontWeight: FontWeight.bold , fontSize: 20
              )))),
      GridColumn(
          columnName: 'Email Address',
          width: 200,
          label: Container(
              padding: EdgeInsets.all(8.0),
              alignment: Alignment.center,
              child: Text('Email Address' , style:GoogleFonts.sora(
                  color: Colors.red, fontWeight: FontWeight.bold , fontSize: 20
              )))),
      GridColumn(
          columnName: 'Password',
          width: 200,
          label: Container(
              padding: EdgeInsets.all(8.0),
              alignment: Alignment.center,
              child: Text('Password' , style:GoogleFonts.sora(
                  color: Colors.red, fontWeight: FontWeight.bold , fontSize: 20
              )))),
      GridColumn(
          columnName: 'Home Address',
          width: 240,
          label: Container(
              padding: EdgeInsets.all(8.0),
              alignment: Alignment.center,
              child: Text('Home Address' , style:GoogleFonts.sora(
                  color: Colors.red, fontWeight: FontWeight.bold , fontSize: 20
              )))),
      GridColumn(
          columnName: 'Aadhar Number',
          width: 200,
          label: Container(
              padding: EdgeInsets.all(8.0),
              alignment: Alignment.center,
              child: Text('Aadhar Number' , style:GoogleFonts.sora(
                  color: Colors.red, fontWeight: FontWeight.bold , fontSize: 20
              )))),
      GridColumn(
          columnName: 'Gender',
          width: 100,
          label: Container(
              padding: EdgeInsets.all(8.0),
              alignment: Alignment.center,
              child: Text('Gender' , style:GoogleFonts.sora(
                  color: Colors.red, fontWeight: FontWeight.bold , fontSize: 20
              )))),
    ];
  }

  @override
  void initState() {
    super.initState();
    _columns = getColumns();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Hero(
                  tag: "https://img.rawpixel.com/s3fs-private/rawpixel_images/website_content/v1016-c-08_1-ksh6mza3.jpg?w=800&dpr=1&fit=default&crop=default&q=65&vib=3&con=3&usm=15&bg=F4F4F3&ixlib=js-2.2.1&s=f584d8501c27c5f649bc2cfce50705c0",
                  child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(
                        "https://img.rawpixel.com/s3fs-private/rawpixel_images/website_content/v1016-c-08_1-ksh6mza3.jpg?w=800&dpr=1&fit=default&crop=default&q=65&vib=3&con=3&usm=15&bg=F4F4F3&ixlib=js-2.2.1&s=f584d8501c27c5f649bc2cfce50705c0",
                        fit: BoxFit.cover,)
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 40.0 , bottom: 5.0),
                  child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(CupertinoIcons.person_solid, color: Colors.red,),
                          Text("Police Officials Data" , style: GoogleFonts.sora(color: Colors.blue.withGreen(100), fontSize: 25 , fontWeight: FontWeight.bold))
                        ],
                      )
                  ),
                ),
                Container(
                  width: 1550,
                  height: 600,
                  child: Padding(
                      padding: EdgeInsets.only(top: 100.0 , left: 100 , right: 100),
                      child: FutureBuilder(
                          future: generateEmployeeList(),
                          builder: (context, data) {
                            return data.hasData
                                ? SfDataGrid(
                                source: employeeDataSource,
                                allowColumnsResizing: true,
                                allowPullToRefresh: true,
                                allowMultiColumnSorting: true,
                                allowSorting: true,
                                allowSwiping: true,
                                rowHeight: 50,
                                gridLinesVisibility: GridLinesVisibility.both,
                                headerGridLinesVisibility: GridLinesVisibility.both,
                                highlightRowOnHover: true,
                                columnWidthMode: ColumnWidthMode.fill,
                                columns: _columns)
                                : const Center(
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  value: 0.8,
                                ));
                          })),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
class EmployeeDataSource extends DataGridSource {
  EmployeeDataSource(this.employees) {
    buildDataGridRow();
  }
  void buildDataGridRow() {
    _employeeDataGridRows = employees
        .map<DataGridRow>((e) => DataGridRow(cells: [
       DataGridCell<int>(columnName: 'id', value: e.id),
      DataGridCell<String>(columnName: 'Name', value: e.name),
      DataGridCell<String>(columnName: 'Phone', value: e.phone),
      DataGridCell<String>(columnName: 'Email Address', value: e.email),
      DataGridCell<String>(columnName: 'Password', value: e.password),
      DataGridCell<String>(columnName: 'Home Address', value: e.address),
      DataGridCell<String>(columnName: 'Aadhar Number', value: e.aadhar),
      DataGridCell<String>(columnName: 'Gender', value: e.gender),
    ]))
        .toList();
  }
  List<Employee> employees = [];

  List<DataGridRow> _employeeDataGridRows = [];

  @override
  List<DataGridRow> get rows => _employeeDataGridRows;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    Color getRowBackgroundColor() {
      final int index = effectiveRows.indexOf(row);
      if (index % 2 != 0) {
        return Colors.yellow.withRed(20);
      }

      return Colors.yellow.withBlue(100);
    }
    return DataGridRowAdapter(
        color: getRowBackgroundColor(),
        cells: row.getCells().map<Widget>((e) {
          return Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(8.0),
            child: Text(e.value.toString() , style: GoogleFonts.roboto(color: Colors.black87, fontSize: 16, fontWeight: FontWeight.bold),),
          );
        }).toList());
  }
  void updateDataGrid() {
    notifyListeners();
  }
}
class Employee {
  int id;
  String name;
  String phone;
  String email;
  String password;
  String address;
  String aadhar;
  String gender;
  Employee({required this.id, required this.name, required this.phone, required this.email , required this.password, required this.address, required this.aadhar, required this.gender});
  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      id: int.parse(json['id']),
      name: json['name'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      address: json['address'] as String,
      aadhar: json['aadhar'] as String,
      gender: json['gender'] as String,
    );
  }
}
