import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabata_timer/common/constants.dart';
import 'package:tabata_timer/presentation/home/home_view_model.dart';
import 'package:provider/provider.dart';

class ExerciseStartButton extends StatelessWidget {
  const ExerciseStartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: null,
      child: Container(
        height: 60.h,
        decoration: BoxDecoration(
          color: const Color(blueColor),
          borderRadius: BorderRadius.circular(10).w,
        ),
        child: Padding(
          padding: REdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 30.w,
                width: 30.w,
                child: const FittedBox(
                  child: Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: REdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    exerciseButtonTitle,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28.sp,
                      fontFamily: 'Suite',
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
              Consumer<HomeViewModel>(
                builder: (context, viewModel, child) {
                  return Text(
                    viewModel.totalMinuteSeconds,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.sp,
                      fontFamily: 'Suite',
                      fontWeight: FontWeight.w500,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
