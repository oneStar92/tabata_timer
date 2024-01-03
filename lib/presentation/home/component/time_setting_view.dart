import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabata_timer/common/constants.dart';
import 'package:tabata_timer/common/custom_colors.dart';
import 'package:tabata_timer/presentation/model/tabata_element.dart';
import 'package:tabata_timer/presentation/view/icon_button_holder.dart';
import 'package:tabata_timer/presentation/view/timer_view_holder.dart';

class TimeSettingView<T extends ChangeNotifier> extends StatelessWidget {
  final TabataElement _element;
  final Function() _actionIncrease;
  final Function() _actionDecrease;
  final Time Function(BuildContext, T) _timeSelector;

  const TimeSettingView({
    super.key,
    required TabataElement element,
    required Function() actionIncrease,
    required Function() actionDecrease,
    required Time Function(BuildContext, T) timeSelector,
  })
      : _element = element,
        _actionIncrease = actionIncrease,
        _actionDecrease = actionDecrease,
        _timeSelector = timeSelector;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85.h,
      width: double.infinity,
      padding: REdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10).w,
        color: Colors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              _element.toString(),
              textAlign: TextAlign.left,
              style: TextStyle(
                color: CustomColors.getColorOf(_element),
                fontSize: 18.sp,
                fontFamily: 'Suite',
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          SizedBox(
            height: 20.w,
            width: 20.w,
            child: IconButtonHolder(
              icon: Icons.remove,
              onClick: _actionDecrease,
              color: Colors.black,
            ),
          ),
          SizedBox(
            width: 160.w,
            child: TimerViewHolder(
              selector: _timeSelector,
              textStyle: TextStyle(
                fontSize: 40.sp,
                fontFamily: 'Suite',
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          SizedBox(
            height: 20.w,
            width: 20.w,
            child: IconButtonHolder(
              icon: Icons.add,
              onClick: _actionIncrease,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}