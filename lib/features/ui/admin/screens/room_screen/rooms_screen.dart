import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_guide/config/di.dart';
import 'package:my_guide/core/cache/shared_preferences.dart';
import 'package:my_guide/core/utils/dialog_utils.dart';
import 'package:my_guide/core/utils/snack_bar_utils.dart';
import 'package:my_guide/features/ui/admin/screens/room_screen/cubit/room_states.dart';
import 'package:my_guide/features/ui/admin/screens/room_screen/cubit/room_view_model.dart';

class RoomsScreen extends StatefulWidget {
  const RoomsScreen({super.key});

  @override
  State<RoomsScreen> createState() => _RoomsScreenState();
}

class _RoomsScreenState extends State<RoomsScreen> {
  RoomViewModel viewModel = getIt<RoomViewModel>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 700;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          /// --- Header Section ---
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Rooms Management",
                style: TextStyle(
                  fontSize: isMobile ? 18 : 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey[900],
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  showAddRoomDialog(context);
                },
                icon: const Icon(Icons.add),
                label: Text(isMobile ? "Add" : "Add New Room"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey[900],
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 25),

          /// --- Content Section ---
          // هنا هتحط الـ BlocBuilder بتاعك وتمرر الداتا للـ Widgets اللي تحت
          Expanded(
            child: isMobile
                ? _buildMobileList([
                    {
                      'name': 'room1',
                      'capacity': '200',
                      'location': 'Building 2',
                    },
                  ]) // مرر القائمة هنا
                : _buildWebTable([]), // مرر القائمة هنا
          ),
        ],
      ),
    );
  }

  /// 1. تصميم عرض الموبايل (Cards)
  Widget _buildMobileList(List<dynamic> rooms) {
    return ListView.builder(
      itemCount: rooms.length,
      itemBuilder: (context, index) {
        final room = rooms[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            leading: const CircleAvatar(
              backgroundColor: Color(0xFFEDF2F7),
              child: Icon(Icons.meeting_room, color: Colors.blueGrey),
            ),
            title: Text(
              room['name'] ?? '',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text("Cap: ${room['capacity']} | ${room['location']}"),
            trailing: _buildActionButtons(room),
          ),
        );
      },
    );
  }

  /// 2. تصميم عرض الويب (Table)
  Widget _buildWebTable(List<dynamic> rooms) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10),
        ],
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          headingRowColor: MaterialStateProperty.all(Colors.grey[50]),
          columns: const [
            DataColumn(label: Text('ROOM NAME')),
            DataColumn(label: Text('LOCATION')),
            DataColumn(label: Text('CAPACITY')),
            DataColumn(label: Text('ACTIONS')),
          ],
          rows: rooms.map((room) {
            return DataRow(
              cells: [
                DataCell(Text(room['name'] ?? '')),
                DataCell(Text(room['location'] ?? '')),
                DataCell(Text(room['capacity'].toString())),
                DataCell(_buildActionButtons(room)),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }

  /// 3. أزرار التحكم (Shared Actions)
  Widget _buildActionButtons(dynamic room) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: const Icon(Icons.edit, color: Colors.blue, size: 20),
          onPressed: () {
            // TODO: Logic التعديل
          },
        ),
        IconButton(
          icon: const Icon(Icons.delete_outline, color: Colors.red, size: 20),
          onPressed: () {
            // TODO: Logic الحذف
          },
        ),
      ],
    );
  }

  void showAddRoomDialog(BuildContext context) {
    // إحنا بنستخدم الـ viewModel اللي متعرف فوق في الـ State
    showDialog(
      context: context,
      builder: (dialogContext) {
        // نستخدم dialogContext هنا
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: const Text(
            "Add New Room",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: SizedBox(
            width: 400,
            child: SingleChildScrollView(
              child: Form(
                key: viewModel.formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildTextField(
                      controller: viewModel.nameController,
                      label: "Room Name",
                      icon: Icons.meeting_room,
                      hint: "e.g. Lab 101",
                    ),
                    const SizedBox(height: 15),
                    _buildTextField(
                      controller: viewModel.locationController,
                      label: "Location",
                      icon: Icons.location_on,
                      hint: "e.g. Second Floor",
                    ),
                    const SizedBox(height: 15),
                    _buildTextField(
                      controller: viewModel.capacityController,
                      label: "Capacity",
                      icon: Icons.people,
                      hint: "e.g. 30",
                      isNumber: true,
                    ),
                  ],
                ),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: Text("Cancel", style: TextStyle(color: Colors.grey[600])),
            ),
            // نستخدم BlocConsumer مع الـ viewModel اللي جبناه بـ getIt
            BlocConsumer<RoomViewModel, RoomStates>(
              bloc: viewModel,
              listenWhen: (previous, current) =>
                  current is RoomSuccessState || current is RoomErrorState,
              listener: (context, state) {
                if (state is RoomErrorState) {
                  DialogUtils.showErrorDialog(context, state.message);
                } else if (state is RoomSuccessState) {
                  // 1. نقفل الـ Dialog
                  Navigator.pop(dialogContext);
                  // 2. نظهر رسالة نجاح
                  SnackBarUtils.showSuccessSnackBar(
                    context,
                    state.addRoomResponse.data ?? '',
                  );
                  // 3. نمسح الداتا من الـ controllers (اختياري حسب الـ Logic عندك)
                  viewModel.nameController.clear();
                  viewModel.locationController.clear();
                  viewModel.capacityController.clear();
                }
              },
              builder: (context, state) {
                bool isLoading = state is RoomLoadingState;
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey[900],
                    foregroundColor: Colors.white,
                  ),
                  onPressed: isLoading
                      ? null
                      : () async {
                          // هنا تجيب الـ Token بتاعك (افترضت إنه متخزن في الـ SharedPrefs)
                          String? token = await SharedPreferencesUtils.getData(
                            key: 'token',
                          );
                          viewModel.addRoom(token: token ?? "");
                        },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: isLoading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ),
                          )
                        : const Text("Add Room"),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  /// Widget مساعد عشان شكل الـ TextFields يبقى موحد ونضيف
  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    required String hint,
    bool isNumber = false,
  }) {
    return TextFormField(
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      validator: (value) {
        if (value!.isEmpty) {
          return 'this field is required';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(icon, size: 20),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.blueGrey, width: 2),
        ),
      ),
    );
  }
}
