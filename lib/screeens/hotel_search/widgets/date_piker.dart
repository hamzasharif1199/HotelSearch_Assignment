import 'package:flutter/material.dart';
import 'package:hotel_app/utils/colors.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';

class DatePiker extends StatefulWidget {
  const DatePiker({Key? key}) : super(key: key);

  @override
  _DatePikerState createState() => _DatePikerState();
}

class _DatePikerState extends State<DatePiker> {
  late String _startDate, _endDate;
  final DateRangePickerController _controller = DateRangePickerController();

  @override
  void initState() {
    final DateTime today = DateTime.now();
    _startDate = DateFormat('yyyy-M-dd').format(today).toString();
    _endDate =
        DateFormat('yyyy-M-dd').format(today.add(Duration(days: 3))).toString();
    _controller.selectedRange =
        PickerDateRange(today, today.add(Duration(days: 3)));
    super.initState();
  }

  void selectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      _startDate =
          DateFormat('yyyy-M-dd').format(args.value.startDate).toString();
      _endDate = DateFormat('yyyy-M-dd')
          .format(args.value.endDate ?? args.value.startDate)
          .toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              _showDatePicker(context);
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
              ),
              padding: EdgeInsets.all(5),
              child: Container(
                alignment: Alignment.center,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: Colors.blue,
                      width: 1.5,
                    )),
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      '$_startDate  ==>  $_endDate',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      Icons.close,
                      color: Color(0xff9ba1ad),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showDatePicker(BuildContext context) async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2022),
      lastDate: DateTime(2025),
    );

    if (picked != null && picked.start != null && picked.end != null) {
      setState(() {
        _startDate = DateFormat('yyyy-M-dd').format(picked.start!).toString();
        _endDate = DateFormat('yyyy-M-dd').format(picked.end!).toString();
        _controller.selectedRange = PickerDateRange(picked.start!, picked.end!);
      });
    }
  }
}
