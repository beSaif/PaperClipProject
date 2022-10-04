import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:paperclipproject/API/PerformaceAPI.dart';
import 'package:paperclipproject/Model/PerformanceModel.dart';

class Performace extends StatefulWidget {
  const Performace({super.key});

  @override
  State<Performace> createState() => _PerformaceState();
}

class _PerformaceState extends State<Performace> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        //color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => getPerformanceData(),
                child: Text(
                  'Performace',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: HexColor("#304373"),
                  ),
                ),
              ),
              const Divider(
                color: Colors.grey,
                thickness: 1,
              ),
              Expanded(
                child: FutureBuilder(
                  future: getPerformanceData(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    }
                    List<PerformanceModel> performanceData = snapshot.data;
                    //print(performanceData.length);
                    return ListView.builder(
                      itemCount: performanceData.length,
                      itemBuilder: (context, index) {
                        double? changePercent =
                            performanceData[index].changePercent;
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Flex(
                            direction: Axis.horizontal,
                            children: [
                              Expanded(
                                  child: Text(
                                performanceData[index].label.toString(),
                                textAlign: TextAlign.start,
                              )),
                              Expanded(
                                flex: 3,
                                child: LinearProgressIndicator(
                                  minHeight: 20,
                                  backgroundColor: HexColor("#f1f1f1"),
                                  value: changePercent!.abs() / 100,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    changePercent! > 0
                                        ? HexColor("#277f00")
                                        : HexColor("#ed120a"),
                                  ),
                                ),
                              ),
                              Expanded(
                                  child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    changePercent! > 0
                                        ? Icons.arrow_drop_up_outlined
                                        : Icons.arrow_drop_down_outlined,
                                    color: changePercent! > 0
                                        ? HexColor("#277f00")
                                        : HexColor("#ed120a"),
                                  ),
                                  Text(changePercent!.abs().toStringAsFixed(2)),
                                ],
                              ))
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
