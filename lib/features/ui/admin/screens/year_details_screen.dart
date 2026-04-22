import 'package:flutter/material.dart';

class YearDetailsScreen extends StatefulWidget {
  final String title;
  final String yearName;
  final String deptName;
  final List<Map<String, dynamic>> allStudents;

  const YearDetailsScreen({
    super.key,
    required this.title,
    required this.yearName,
    required this.deptName,
    required this.allStudents,
  });

  @override
  State<YearDetailsScreen> createState() => _YearDetailsScreenState();
}

class _YearDetailsScreenState extends State<YearDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    // الفلترة بناءً على السنة والقسم
    final filteredList = widget.allStudents.where((s) {
      if (widget.deptName.isEmpty) {
        return s['year'] == widget.yearName;
      } else {
        return s['year'] == widget.yearName &&
            s['department'] == widget.deptName;
      }
    }).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7F9),
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
        backgroundColor: Colors.blueGrey[900],
        foregroundColor: Colors.white,
      ),
      body: filteredList.isEmpty
          ? const Center(child: Text("No students here"))
          : ListView.builder(
              padding: const EdgeInsets.all(15),
              itemCount: filteredList.length,
              itemBuilder: (context, index) {
                final student = filteredList[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: Color(0xFFECEFF1),
                      child: Icon(Icons.person, color: Colors.blueGrey),
                    ),
                    title: Text(
                      student['name'],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text("ID: ${student['userName']}"),
                    trailing: Row(
                      mainAxisSize:
                          MainAxisSize.min, // عشان الأيقونات تكون جنب بعض
                      children: [
                        // --- أيقونة التعديل ---
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.blue),
                          onPressed: () => _showEditDialog(student),
                        ),
                        // --- أيقونة الحذف ---
                        IconButton(
                          icon: const Icon(
                            Icons.delete_outline,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            setState(() {
                              widget.allStudents.remove(student);
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }

  // --- دالة تعديل بيانات الطالب ---
  void _showEditDialog(Map<String, dynamic> student) {
    final nameController = TextEditingController(text: student['name']);
    final idController = TextEditingController(text: student['userName']);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Edit Student Info"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: "Full Name"),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: idController,
              decoration: const InputDecoration(labelText: "User Name / ID"),
              keyboardType: TextInputType.number,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueGrey[900],
            ),
            onPressed: () {
              setState(() {
                student['name'] = nameController.text;
                student['userName'] = idController.text;
              });
              Navigator.pop(context);
            },
            child: const Text(
              "Save Changes",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
