import 'package:flutter/material.dart';

extension SpaceExt on num {
  Widget get horizontalSpace => SizedBox(width: toDouble());
  Widget get verticalSpace => SizedBox(height: toDouble());
}

extension WidgetExt on Widget {
  
  Widget get toSliverBox => SliverToBoxAdapter(child: this);

  Widget padSymmetric({required double value}) => Padding(
        padding: EdgeInsets.symmetric(
          horizontal: value,
          vertical: value,
        ),
        child: this,
      );
  Widget padAll({required double value}) => Padding(
        padding: EdgeInsets.all(value),
        child: this,
      );
  Widget padLeft({required double value}) => Padding(
        padding: EdgeInsets.only(left: value),
        child: this,
      );
  Widget padTop({required double value}) => Padding(
        padding: EdgeInsets.only(top: value),
        child: this,
      );
  Widget padBottom({required double value}) => Padding(
        padding: EdgeInsets.only(bottom: value),
        child: this,
      );
}
