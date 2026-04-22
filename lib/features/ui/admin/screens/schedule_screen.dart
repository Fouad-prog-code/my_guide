import 'package:flutter/material.dart';

class SchedulesScreen extends StatelessWidget {
  const SchedulesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// 🔝 Header + Add Button
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "إدارة الجداول",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.add),
              label: Text("إضافة محاضرة"),
            ),
          ],
        ),

        SizedBox(height: 20),

        /// 🔍 Search
        SizedBox(
          width: 300,
          child: TextField(
            decoration: InputDecoration(
              hintText: "بحث...",
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),

        SizedBox(height: 20),

        /// 📊 Table
        Expanded(
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columnSpacing: 40,
                columns: const [
                  DataColumn(label: Text("المادة")),
                  DataColumn(label: Text("الدكتور")),
                  DataColumn(label: Text("اليوم")),
                  DataColumn(label: Text("الوقت")),
                  DataColumn(label: Text("القاعة")),
                  DataColumn(label: Text("الإجراءات")),
                ],
                rows: List.generate(8, (index) {
                  return DataRow(
                    cells: [
                      DataCell(Text("Math")),
                      DataCell(Text("Dr. Ahmed")),
                      DataCell(Text("Sunday")),
                      DataCell(Text("10:00 - 12:00")),
                      DataCell(Text("A101")),
                      DataCell(
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.edit, color: Colors.blue),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.delete, color: Colors.red),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ),
          ),
        ),
        ElevatedButton(onPressed: () {}, child: Text("توليد الجداول")),
      ],
    );
  }
}
