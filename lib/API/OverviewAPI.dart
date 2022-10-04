import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:paperclipproject/Model/OverviewModel.dart';

Future getOverviewData() async {
  var response = await http.get(Uri.https('api.stockedge.com',
      'Api/SecurityDashboardApi/GetCompanyEquityInfoForSecurity/5051'));

  var jsonData = jsonDecode(response.body);

  OverviewModel overviewData = OverviewModel(
      id: jsonData["ID"],
      security: jsonData["Security"],
      sector: jsonData["Sector"],
      industry: jsonData["Industry"],
      mcap: jsonData["MCAP"],
      ev: jsonData["EV"],
      bookValuePerShare: jsonData["BookNavPerShare"],
      ttmpe: jsonData["TTMPE"],
      yieldValue: jsonData["Yield"]);
  //print(overviewData.yieldValue);
  return overviewData;
}
