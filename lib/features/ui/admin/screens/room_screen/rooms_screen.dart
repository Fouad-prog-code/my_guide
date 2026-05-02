import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_guide/config/di.dart';
import 'package:my_guide/core/cache/shared_preferences.dart';
import 'package:my_guide/core/utils/app_colors.dart';
import 'package:my_guide/core/utils/dialog_utils.dart';
import 'package:my_guide/core/utils/snack_bar_utils.dart';
import 'package:my_guide/domain/entities/request/updata_room/update_room_request.dart';
import 'package:my_guide/domain/entities/response/get_room/get_room_data.dart';
import 'package:my_guide/features/ui/admin/screens/room_screen/cubit/room_states.dart';
import 'package:my_guide/features/ui/admin/screens/room_screen/cubit/room_view_model.dart';
import 'package:my_guide/features/ui/admin/widgets/error_widget.dart';

class RoomsScreen extends StatefulWidget {
  const RoomsScreen({super.key});

  @override
  State<RoomsScreen> createState() => _RoomsScreenState();
}

class _RoomsScreenState extends State<RoomsScreen> {
  RoomViewModel viewModel = getIt<RoomViewModel>();

  @override
  void initState() {
    super.initState();
    viewModel.getRoom();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: BlocListener<RoomViewModel, RoomStates>(
        listener: (context, state) {
          if (state is AddRoomSuccessState ||
              state is UpdateRoomSuccessState ||
              state is DeleteRoomSuccessState) {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }

            viewModel.getRoom();

            String msg = "Operation Successful";
            if (state is DeleteRoomSuccessState) {
              msg = state.deleteRoomResponse.data ?? "Deleted";
              DialogUtils.showMessage(
                context: context,
                msg: msg,
                title: state.deleteRoomResponse.message,
                nagtActionName: 'Ok',
                nagtAction: () {
                  Navigator.pop(context);
                },
              );
            }
            if (state is UpdateRoomSuccessState) {
              msg = state.updateRoomResponse.data ?? "Updated";
              SnackBarUtils.showSuccessSnackBar(context, msg);
            }
            if (state is AddRoomSuccessState) {
              msg = state.addRoomResponse.data ?? '';
              SnackBarUtils.showSuccessSnackBar(context, msg);
            }
          }

          if (state is AddRoomErrorState ||
              state is UpdateRoomErrorState ||
              state is DeleteRoomErrorState) {
            String errorMsg = "";
            if (state is AddRoomErrorState) errorMsg = state.message;
            if (state is UpdateRoomErrorState) errorMsg = state.message;
            if (state is DeleteRoomErrorState) errorMsg = state.message;
            //Navigator.pop(context);
            DialogUtils.showErrorDialog(context, errorMsg);
          }

          if (state is DeleteRoomLoadingState) {
            Navigator.pop(context);
            DialogUtils.showLoading(context: context, message: 'Deleting...');
          }
        },
        child: Scaffold(
          backgroundColor: const Color(0xFFF5F7F9),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                /// HEADER
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text(
                    "Rooms Management",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  trailing: ElevatedButton.icon(
                    onPressed: () => showAddRoomDialog(context),
                    icon: const Icon(Icons.add),
                    label: const Text("Add"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey[900],
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                /// LIST
                Expanded(
                  child: BlocBuilder<RoomViewModel, RoomStates>(
                    builder: (context, state) {
                      if (state is GetRoomLoadingState) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.darkGrayColor,
                          ),
                        );
                      }
                      if (state is GetRoomErrorState) {
                        return Padding(
                          padding: EdgeInsets.only(top: 70.h),
                          child: ErrorsWidget(
                            message: state.message,
                            onPressed: () => viewModel.getRoom(),
                          ),
                        );
                      }

                      var rooms = viewModel.getRoomResponse?.data ?? [];
                      if (rooms.isEmpty) {
                        return const Center(child: Text("No Rooms Found"));
                      }
                      return ListView.builder(
                        itemCount: rooms.length,
                        itemBuilder: (context, index) {
                          final room = rooms[index];
                          return Card(
                            margin: const EdgeInsets.only(bottom: 12),
                            child: ListTile(
                              leading: const CircleAvatar(
                                child: Icon(Icons.meeting_room),
                              ),
                              title: Text(
                                room.roomName ?? '',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Capacity: ${room.capacity}"),
                                  Text("Location: ${room.location}"),
                                ],
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: const Icon(
                                      Icons.edit,
                                      color: Colors.blue,
                                    ),
                                    onPressed: () => _showEditDialog(room),
                                  ),
                                  IconButton(
                                    icon: const Icon(
                                      Icons.delete_outline,
                                      color: Colors.red,
                                    ),
                                    onPressed: () {
                                      DialogUtils.showMessage(
                                        context: context,
                                        title: 'Confirm Delete',
                                        msg: 'Do you want to delete this room?',
                                        nagtActionName: 'Delete',
                                        postActionName: 'Cancel',
                                        nagtAction: () => viewModel.deleteRoom(
                                          id: room.roomId ?? 0,
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
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
      ),
    );
  }

  void showAddRoomDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Add New Room"),
        content: Form(
          key: viewModel.formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: viewModel.nameController,
                decoration: const InputDecoration(labelText: "Room Name"),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (v) => v!.trim().isEmpty ? 'Required' : null,
              ),
              TextFormField(
                controller: viewModel.locationController,
                decoration: const InputDecoration(labelText: "Location"),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (v) => v!.trim().isEmpty ? 'Required' : null,
              ),
              TextFormField(
                controller: viewModel.capacityController,
                keyboardType: TextInputType.number,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: const InputDecoration(labelText: "Capacity"),
                validator: (v) =>
                    (v == null || !RegExp(r'^[0-9]+$').hasMatch(v.trim()))
                    ? 'Enter numbers only'
                    : null,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          BlocBuilder<RoomViewModel, RoomStates>(
            bloc: viewModel,
            builder: (context, state) {
              final isLoading = state is AddRoomLoadingState;
              return ElevatedButton(
                onPressed: isLoading
                    ? null
                    : () async {
                        String? token = await SharedPreferencesUtils.getData(
                          key: 'token',
                        );
                        viewModel.addRoom(token: token ?? "");
                      },
                child: isLoading
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text("Add"),
              );
            },
          ),
        ],
      ),
    );
  }

  void _showEditDialog(GetRoomData room) {
    final nameController = TextEditingController(text: room.roomName);
    final locationController = TextEditingController(text: room.location);
    final capacityController = TextEditingController(
      text: room.capacity.toString(),
    );
    final GlobalKey<FormState> editFormKey = GlobalKey();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Edit Room Info"),
        content: Form(
          key: editFormKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(labelText: "Room Name"),
                validator: (v) => v!.trim().isEmpty ? 'Required' : null,
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: locationController,
                decoration: const InputDecoration(labelText: "Location"),
                validator: (v) => v!.trim().isEmpty ? 'Required' : null,
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: capacityController,
                decoration: const InputDecoration(labelText: "Capacity"),
                keyboardType: TextInputType.number,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (v) =>
                    (v == null || !RegExp(r'^[0-9]+$').hasMatch(v.trim()))
                    ? 'Enter numbers only'
                    : null,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          BlocBuilder<RoomViewModel, RoomStates>(
            bloc: viewModel,
            builder: (context, state) {
              final isLoading = state is UpdateRoomLoadingState;
              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey[900],
                ),
                onPressed: isLoading
                    ? null
                    : () {
                        bool isChanged =
                            nameController.text != room.roomName ||
                            locationController.text != room.location ||
                            capacityController.text != room.capacity.toString();

                        if (!isChanged) {
                          DialogUtils.showErrorDialog(
                            context,
                            'Please change anything first',
                          );
                          return;
                        }

                        if (editFormKey.currentState!.validate()) {
                          viewModel.updateRoom(
                            updateRoomRequest: UpdateRoomRequest(
                              roomId: room.roomId ?? 0,
                              roomName: nameController.text,
                              capacity: int.parse(capacityController.text),
                              location: locationController.text,
                            ),
                          );
                        }
                      },
                child: isLoading
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        ),
                      )
                    : const Text(
                        "Save Changes",
                        style: TextStyle(color: Colors.white),
                      ),
              );
            },
          ),
        ],
      ),
    );
  }
}
