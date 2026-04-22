import 'dart:math';

import 'package:my_guide/features/ui/admin/widgets/mock_data.dart';

class TimetableGenerator {
  static Map<String, List<Map<String, dynamic>>> generate() {
    final rand = Random();

    Map<String, List<Map<String, dynamic>>> result = {};

    Set<String> doctorBusy = {};
    Set<String> roomBusy = {};
    Set<String> groupBusy = {};

    for (var subject in MockData.subjects) {
      int sessions = subject["sessions"];

      String groupKey = "${subject['year']}_${subject['department']}";

      result.putIfAbsent(groupKey, () => []);

      while (sessions > 0) {
        bool placed = false;

        List<String> shuffledDays = List.from(MockData.days)..shuffle(rand);
        List<String> shuffledHours = List.from(MockData.hours)..shuffle(rand);
        List<Map<String, dynamic>> shuffledRooms = List.from(MockData.rooms)
          ..shuffle(rand);

        for (var day in shuffledDays) {
          for (var hour in shuffledHours) {
            for (var room in shuffledRooms) {
              String dKey = "${subject['doctorId']}_$day\_$hour";
              String rKey = "${room['id']}_$day\_$hour";
              String gKey = "$groupKey\_$day\_$hour";

              if (!doctorBusy.contains(dKey) &&
                  !roomBusy.contains(rKey) &&
                  !groupBusy.contains(gKey)) {
                result[groupKey]!.add({
                  "subject": subject["name"],
                  "doctorId": subject["doctorId"],
                  "room": room["name"],
                  "day": day,
                  "hour": hour,
                });

                doctorBusy.add(dKey);
                roomBusy.add(rKey);
                groupBusy.add(gKey);

                sessions--;
                placed = true;
                break;
              }
            }
            if (placed) break;
          }
          if (placed) break;
        }

        if (!placed) break;
      }
    }

    return result;
  }
}
