import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:paperclipproject/API/OverviewAPI.dart';
import 'package:paperclipproject/Model/OverviewModel.dart';

class Overview extends StatelessWidget {
  const Overview({super.key});

  @override
  Widget build(BuildContext context) {
    final value = NumberFormat("#,##0.00", "en_US");
    TextStyle titleStyle = GoogleFonts.poppins(
        textStyle: TextStyle(
            color: HexColor('#54668b'),
            fontSize: 14,
            fontWeight: FontWeight.w400));

    TextStyle dataStyle = GoogleFonts.poppins(
        textStyle: const TextStyle(
            color: Colors.black87, fontSize: 14, fontWeight: FontWeight.w400));

    return Container(
      //height: double.infinity,
      width: double.infinity,
      //color: Colors.green,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Overview',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: HexColor("#304373"),
              ),
            ),
            Divider(
              color: Colors.grey,
              thickness: 1,
            ),
            FutureBuilder(
              future: getOverviewData(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }
                OverviewModel overviewData = snapshot.data;

                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sector',
                          style: titleStyle,
                        ),
                        Text(
                          'Industry',
                          style: titleStyle,
                        ),
                        Text(
                          'Market Cap',
                          style: titleStyle,
                        ),
                        Text(
                          'EV',
                          style: titleStyle,
                        ),
                        Text(
                          'Book Value Per Share',
                          style: titleStyle,
                        ),
                        Text(
                          'PE',
                          style: titleStyle,
                        ),
                        Text(
                          'PEG Ratio',
                          style: titleStyle,
                        ),
                        Text(
                          'Yield',
                          style: titleStyle,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          overviewData.sector.toString(),
                          style: dataStyle,
                        ),
                        Text(overviewData.industry.toString(),
                            style: dataStyle),
                        Text(value.format(overviewData.mcap).toString(),
                            style: dataStyle),
                        Text(
                            overviewData.ev == null
                                ? '-'
                                : overviewData.ev.toString(),
                            style: dataStyle),
                        Text(overviewData.bookValuePerShare!.toStringAsFixed(2),
                            style: dataStyle),
                        Text(overviewData.ttmpe!.toStringAsFixed(2),
                            style: dataStyle),
                        Text(overviewData.yieldValue!.toStringAsFixed(2),
                            style: dataStyle),
                        Text(overviewData.yieldValue!.toStringAsFixed(2),
                            style: dataStyle),
                      ],
                    )
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
