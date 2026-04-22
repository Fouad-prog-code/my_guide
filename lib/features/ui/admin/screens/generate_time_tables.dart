import 'package:flutter/material.dart';
import 'package:my_guide/features/ui/admin/widgets/data_manager.dart';
import 'package:my_guide/features/ui/admin/screens/group_time_table_screen.dart';

class GenerateTimeTabelsScreen extends StatefulWidget {
  const GenerateTimeTabelsScreen({super.key});

  @override
  State<GenerateTimeTabelsScreen> createState() =>
      _GenerateTimeTabelsScreenState();
}

class _GenerateTimeTabelsScreenState extends State<GenerateTimeTabelsScreen>
    with SingleTickerProviderStateMixin {
  final dataManager = DataManager();
  bool _isGenerating = false;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _generateTimetables() {
    setState(() {
      _isGenerating = true;
    });

    Future.delayed(const Duration(seconds: 2), () {
      final result = dataManager.generateTimetables();

      if (mounted) {
        setState(() {
          _isGenerating = false;
        });

        if (result.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Please add subjects before generating timetables"),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: Container(
          color: Colors.blueGrey[900],
          child: TabBar(
            controller: _tabController,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey[300],
            indicatorColor: Colors.white,
            tabs: const [
              Tab(icon: Icon(Icons.settings), text: "Generate"),
              Tab(icon: Icon(Icons.schedule), text: "View Timetables"),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [_buildGenerateTab(), _buildViewTimetablesTab()],
      ),
    );
  }

  Widget _buildGenerateTab() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Generate Timetables",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),

            // Status cards
            Wrap(
              spacing: 16,
              runSpacing: 16,
              alignment: WrapAlignment.center,
              children: [
                _buildStatusCard(
                  "Doctors",
                  dataManager.getTotalDoctors().toString(),
                  dataManager.getTotalDoctors() > 0,
                ),
                _buildStatusCard(
                  "Subjects",
                  dataManager.getTotalSubjects().toString(),
                  dataManager.getTotalSubjects() > 0,
                ),
                _buildStatusCard(
                  "Rooms",
                  dataManager.getTotalRooms().toString(),
                  dataManager.getTotalRooms() > 0,
                ),
                _buildStatusCard(
                  "Groups",
                  dataManager.getTotalGroups().toString(),
                  dataManager.getTotalGroups() > 0,
                ),
              ],
            ),

            const SizedBox(height: 60),

            // Generate button
            Container(
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 8,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.auto_awesome,
                    size: 80,
                    color: Colors.blueGrey[900],
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    "Generate Timetables",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Create automatic schedules for all groups based on data",
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: 200,
                    height: 50,
                    child: ElevatedButton(
                      onPressed:
                          _isGenerating ||
                              dataManager.getTotalSubjects() == 0 ||
                              dataManager.getTotalRooms() == 0 ||
                              dataManager.getTotalDoctors() == 0
                          ? null
                          : _generateTimetables,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueGrey[900],
                        disabledBackgroundColor: Colors.grey[400],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: _isGenerating
                          ? const SizedBox(
                              height: 24,
                              width: 24,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                            )
                          : const Text(
                              "Generate",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    _getGenerateButtonStatus(),
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                      fontStyle: FontStyle.italic,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // Information box
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                border: Border.all(color: Colors.blue[200]!),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Important Notes:",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "• You cannot edit timetables after generation",
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "• You can regenerate new timetables anytime",
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "• All data must be complete before generation",
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildViewTimetablesTab() {
    final timetables = dataManager.timetables;

    if (timetables.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.schedule, size: 64, color: Colors.grey[400]),
            const SizedBox(height: 16),
            Text(
              "No timetables generated yet",
              style: TextStyle(fontSize: 18, color: Colors.grey[600]),
            ),
            const SizedBox(height: 8),
            Text(
              "Generate timetables in the Generate tab",
              style: TextStyle(fontSize: 14, color: Colors.grey[500]),
            ),
          ],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Generated Timetables",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: timetables.length,
              itemBuilder: (context, index) {
                final timetable = timetables[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              timetable['groupName'] ?? "Group ${index + 1}",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            ElevatedButton.icon(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => GroupTimetableScreen(
                                      data: {
                                        "Group": [timetable],
                                      },
                                    ),
                                  ),
                                );
                              },
                              icon: const Icon(Icons.visibility),
                              label: const Text("View"),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Year: ${timetable['year'] ?? 'N/A'} | Department: ${timetable['department'] ?? 'General'}",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusCard(String label, String count, bool isComplete) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isComplete ? Colors.green[50] : Colors.red[50],
        border: Border.all(
          color: isComplete ? Colors.green[300]! : Colors.red[300]!,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Icon(
            isComplete ? Icons.check_circle : Icons.cancel,
            color: isComplete ? Colors.green : Colors.red,
            size: 32,
          ),
          const SizedBox(height: 8),
          Text(
            count,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  String _getGenerateButtonStatus() {
    if (dataManager.getTotalSubjects() == 0) {
      return "Add subjects first";
    } else if (dataManager.getTotalRooms() == 0) {
      return "Add rooms first";
    } else if (dataManager.getTotalDoctors() == 0) {
      return "Add teachers first";
    }
    return "Ready to generate timetables";
  }
}
