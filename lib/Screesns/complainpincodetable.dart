import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:http/http.dart' as http;
class ComplainPin extends StatefulWidget {
  late String pin;
  ComplainPin(this.pin);
 // const ComplainPin({Key? key}) : super(key: key);
  @override
  _ComplainPinState createState() => _ComplainPinState();
}

class _ComplainPinState extends State<ComplainPin> {
  late EmployeeDataSource employeeDataSource;
  late List<GridColumn> _columns;
  Future<dynamic> generateEmployeeList() async {
    // Give your sever URL of get_employees_details.php file
    var url = Uri.parse('https://ocmr.000webhostapp.com/complainpicode.php');
    String cc = widget.pin;

    var data = {'cc' : cc};
    // Starting Web API Call.
    var response = await http.post(url, body: json.encode(data));
    var list = json.decode(response.body);
    List<Employee> _employees =
    await list.map<Employee>((json) => Employee.fromJson(json)).toList();

    employeeDataSource = EmployeeDataSource(_employees);
    return _employees;
  }
  List<GridColumn> getColumns() {
    return <GridColumn>[
      /* GridColumn(
          columnName: 'id',
          width: 70,
          label: Container(
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: Text(
                'ID',
              ))),*/
      GridColumn(
          columnName: 'Type Of Crime',
          width: 200,
          label: Container(
              padding: EdgeInsets.all(8.0),
              alignment: Alignment.center,
              child: Text('Type Of Crime' , style:GoogleFonts.sora(
                  color: Colors.red, fontWeight: FontWeight.bold , fontSize: 20
              )))),
      GridColumn(
          columnName: 'Zip Code',
          width: 200,
          label: Container(
              padding: EdgeInsets.all(8.0),
              alignment: Alignment.center,
              child: Text('Zip Code' , style:GoogleFonts.sora(
                  color: Colors.red, fontWeight: FontWeight.bold , fontSize: 20
              )))),
      GridColumn(
          columnName: 'Date of Crime',
          width: 200,
          label: Container(
              padding: EdgeInsets.all(8.0),
              alignment: Alignment.center,
              child: Text('Date of Crime' , style:GoogleFonts.sora(
                  color: Colors.red, fontWeight: FontWeight.bold , fontSize: 20
              )))),
      GridColumn(
          columnName: 'Crime Description',
          width: 700,
          label: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(8.0),
              child: Text(
                  'Crime Description', style:GoogleFonts.sora(
                  color: Colors.red, fontWeight: FontWeight.bold , fontSize: 20
              )
              ))),
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
                          Icon(CupertinoIcons.location_solid , color: Colors.red,),
                          Text("Complaints at Provided ZipCode" , style: GoogleFonts.sora(color: Colors.blue.withGreen(100), fontSize: 25 , fontWeight: FontWeight.bold))
                        ],
                      )
                  ),
                ),
                Container(
                  width: 1500,
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
                                rowHeight: 70,
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
      /* DataGridCell<int>(columnName: 'id', value: e.id),*/
      DataGridCell<String>(columnName: 'Type Of Crime', value: e.tc),
      DataGridCell<String>(columnName: 'Zip Code', value: e.cc),
      DataGridCell<String>(columnName: 'Date of Crime', value: e.dc),
      DataGridCell<String>(columnName: 'Crime Description', value: e.jc),
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
  /* int id;*/
  String tc;
  String cc;
  String dc;
  String jc;
  Employee({/*required this.id,*/ required this.tc, required this.cc, required this.dc , required this.jc});
  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      /* id: int.parse(json['id']),*/
      tc: json['tc'] as String,
      cc: json['cc'] as String,
      dc: json['dc'] as String,
      jc: json['jc'] as String,);
  }
}

