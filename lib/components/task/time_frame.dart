import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:future_me/views/create_future.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class TimeFrame extends ConsumerStatefulWidget {
  const TimeFrame({Key? key,required this.messageController}) : super(key: key);

  final TextEditingController messageController;

  @override
  ConsumerState<TimeFrame> createState() => _TimeFrameState();
}

class _TimeFrameState extends ConsumerState<TimeFrame> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        height: 450,
        // width: 200,
        child: SfDateRangePicker(
          onSubmit: (value) {
            if (value != null) {
              final nowDate = DateTime.now();
              final endDate = value as DateTime;
              final differenceInValue = endDate.difference(nowDate).inDays +
                  1; //Add one so the last date is selected

              print(differenceInValue);

              ref.read(futureModelProvider.notifier).state.timeSpan = differenceInValue.toString();

              context.pop();
            }
            //This returns date
          },
          headerStyle: DateRangePickerHeaderStyle(
              textStyle: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center),
          // backgroundColor: Colors.red,
          onCancel: () {
            context.pop();
          },
          showActionButtons: true,
          view: DateRangePickerView.month,
          // initialDisplayDate: DateTime.now(),
        ),
      ),
    );
  }
}
