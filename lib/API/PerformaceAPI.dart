import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:paperclipproject/Model/OverviewModel.dart';
import 'package:paperclipproject/Model/PerformanceModel.dart';

Future getPerformanceData() async {
  var respone = await http.get(Uri.https('api.stockedge.com',
      'Api/SecurityDashboardApi/GetTechnicalPerformanceBenchmarkForSecurity/5051'));

  var jsonData = jsonDecode(respone.body);

  List<PerformanceModel> perfomanceData = [];

  for (var u in jsonData) {
    PerformanceModel performace = PerformanceModel(
        id: u["ID"],
        label: u["Label"],
        chartPeriodCode: u["ChartPeriodCode"],
        changePercent: u["ChangePercent"]);
    //print(u["Label"]);
    perfomanceData.add(performace);
  }

  return perfomanceData;
}
