import 'package:flutter/material.dart';
import 'acc_info_set.dart';
import 'personal_app_bar.dart';

List<Widget> buildSliverHeader() {
  final List<Widget> widgets = <Widget>[];
  widgets.add(const PersonalAppBar());
  widgets.add(const AccInfoSet());
  return widgets;
}
