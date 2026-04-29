import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_guide/features/ui/admin/widgets/timetable_pdf.dart';
import 'package:printing/printing.dart';
import 'package:flutter/foundation.dart';

import 'package:pdf/widgets.dart' as pw;
import 'package:universal_html/html.dart' as html;

class TimetableGridScreen extends StatefulWidget {
  final List<Map<String, dynamic>> data;

  const TimetableGridScreen({super.key, required this.data});

  @override
  State<TimetableGridScreen> createState() => _TimetableGridScreenState();
}

class _TimetableGridScreenState extends State<TimetableGridScreen> {
  String getDoctor(int id) {
    const map = {
      1: "Ahmed",
      2: "Ali",
      3: "Sara",
      4: "Omar",
      5: "rania",
      6: "hamdy",
    };
    return map[id] ?? "Unknown";
  }

  @override
  Widget build(BuildContext context) {
    List<String> days = [
      "Sunday",
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
    ];

    List<String> hours = ["9-11", "11-1", "1-3", "3-5"];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Timetable"),
        actions: [
          IconButton(
            icon: const Icon(Icons.picture_as_pdf),
            onPressed: () async {
              // print("PDF button clicked 🔥");

              final pdf = TimetablePdf.generate(widget.data);

              if (kIsWeb) {
                await downloadPdf(pdf);
              } else {
                await Printing.layoutPdf(
                  onLayout: (format) async => pdf.save(),
                );
              }
            },
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    const SizedBox(width: 100),
                    ...hours.map(
                      (h) => Container(
                        width: 140,
                        padding: const EdgeInsets.all(10),
                        alignment: Alignment.center,
                        child: Text(
                          h,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),

                /// BODY
                ...days.map((day) {
                  return Row(
                    children: [
                      Container(
                        width: 100,
                        height: 90,
                        alignment: Alignment.center,
                        color: Colors.grey[200],
                        child: Text(day),
                      ),

                      ...hours.map((hour) {
                        final item = widget.data
                            .where((e) => e["day"] == day && e["hour"] == hour)
                            .toList();

                        final cell = item.isNotEmpty ? item.first : null;

                        return Container(
                          width: 140,
                          height: 90,
                          margin: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8),
                            color: cell != null
                                ? Colors.blue.shade50
                                : Colors.white,
                          ),
                          child: cell != null
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      cell["subject"],
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      "Dr ${getDoctor(cell["doctorId"])}",
                                      style: const TextStyle(
                                        fontSize: 11,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Text(
                                      cell["room"],
                                      style: const TextStyle(fontSize: 11),
                                    ),
                                  ],
                                )
                              : const SizedBox(),
                        );
                      }),
                    ],
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> downloadPdf(pw.Document pdf) async {
    final bytes = await pdf.save();

    final blob = html.Blob([bytes]);
    final url = html.Url.createObjectUrlFromBlob(blob);

    html.AnchorElement(href: url)
      ..setAttribute("download", "timetable.pdf")
      ..click();

    html.Url.revokeObjectUrl(url);
  }
}
