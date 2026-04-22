import 'package:flutter/material.dart';
import 'package:my_guide/features/ui/admin/widgets/data_manager.dart';
import 'package:my_guide/features/ui/admin/screens/group_time_table_screen.dart';

class GenerateScreen extends StatefulWidget {
  const GenerateScreen({super.key});

  @override
  State<GenerateScreen> createState() => _GenerateScreenState();
}

class _GenerateScreenState extends State<GenerateScreen>
    with SingleTickerProviderStateMixin {
  final dataManager = DataManager();
  bool _isGenerating = false;

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Schedule Generator",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              "Ensure all data is complete before generating.",
              style: TextStyle(color: Colors.grey[600]),
            ),

            const SizedBox(height: 24),

            // تحويل الـ Status Cards لتكون Responsive
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: isMobile ? 2 : 4,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: isMobile ? 1.3 : 1,
              children: [
                _buildStatusCard(
                  "Doctors",
                  dataManager.getTotalDoctors().toString(),
                  dataManager.getTotalDoctors() > 0,
                ),
                _buildStatusCard(
                  "Rooms",
                  dataManager.getTotalRooms().toString(),
                  dataManager.getTotalRooms() > 0,
                ),
                _buildStatusCard(
                  "Subjects",
                  dataManager.getTotalSubjects().toString(),
                  dataManager.getTotalSubjects() > 0,
                ),
                _buildStatusCard("Groups", "4", true), // مثال لعدد المجموعات
              ],
            ),

            const SizedBox(height: 40),

            // قسم الـ Action الرئيسي
            Center(
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Icon(
                      _isGenerating ? Icons.sync : Icons.auto_awesome,
                      size: 64,
                      color: _isGenerating ? Colors.blue : Colors.amber,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      _isGenerating ? "AI is working..." : "Ready to Generate",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: _isGenerating ? null : _generateTimetables,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueGrey[900],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: _isGenerating
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : const Text(
                                "Generate Now",
                                style: TextStyle(color: Colors.white),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _generateTimetables() {
    setState(() => _isGenerating = true);

    // محاكاة لعمل الـ AI Algorithm
    Future.delayed(const Duration(seconds: 2), () {
      final result = dataManager.generateTimetables();
      if (mounted) {
        setState(() => _isGenerating = false);
        if (result.isNotEmpty) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => GroupTimetableScreen(data: result),
            ),
          );
        }
      }
    });
  }

  Widget _buildStatusCard(String label, String count, bool isComplete) {
    return Container(
      decoration: BoxDecoration(
        color: isComplete
            ? Colors.green.withOpacity(0.1)
            : Colors.red.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: isComplete ? Colors.green : Colors.red,
          width: 1,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            count,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            label,
            style: const TextStyle(fontSize: 12, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
