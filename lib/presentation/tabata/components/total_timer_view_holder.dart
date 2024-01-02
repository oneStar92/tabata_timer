import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabata_timer/presentation/abstract/base_view_holder.dart';

final class TotalTimerViewHolder extends BaseViewHolder {
  const TotalTimerViewHolder({
    super.key,
    super.onClick,
  });

  @override
  Widget createContent(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Text(
            '77',
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 48.sp,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
        ),
        Text(
          ':',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 48.sp,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
        Expanded(
          child: Text(
            '88',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 48.sp,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}