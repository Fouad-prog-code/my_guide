class DataManager {
  static final DataManager _instance = DataManager._internal();

  factory DataManager() {
    return _instance;
  }

  DataManager._internal();

  // 👨‍🏫 Doctors/Teachers
  List<Map<String, dynamic>> doctors = [
    {
      "id": 1,
      "name": "Ahmed Fawzy",
      "email": "ahmed@school.com",
      "specialization": "Math",
    },
    {
      "id": 2,
      "name": "Dr. Sami Ahmed",
      "email": "ali@school.com",
      "specialization": "Physics",
    },
    {
      "id": 3,
      "name": "Steven Alisha",
      "email": "sara@school.com",
      "specialization": "Programming",
    },
    {
      "id": 4,
      "name": "Fouad Fawzy",
      "email": "omar@school.com",
      "specialization": "English",
    },
    {
      "id": 5,
      "name": "Dr Mona",
      "email": "mona@school.com",
      "specialization": "Logic",
    },
    {
      "id": 6,
      "name": "Dr Khaled",
      "email": "khaled@school.com",
      "specialization": "Statistics",
    },
  ];

  // 🏫 Rooms
  List<Map<String, dynamic>> rooms = [
    {"id": 1, "name": "Room 1", "capacity": 50, "location": "Building A"},
    {"id": 2, "name": "Room 2", "capacity": 50, "location": "Building A"},
    {"id": 3, "name": "Room 3", "capacity": 40, "location": "Building B"},
    {"id": 4, "name": "Room 4", "capacity": 40, "location": "Building B"},
  ];

  // 🎓 Groups (Firoq)
  List<Map<String, dynamic>> groups = [
    {"id": 1, "year": "1", "department": null},
    {"id": 2, "year": "2", "department": null},
    {"id": 3, "year": "3", "department": null},
    {"id": 4, "year": "4", "department": "cs"},
    {"id": 5, "year": "4", "department": "it"},
    {"id": 6, "year": "4", "department": "network"},
    {"id": 7, "year": "4", "department": "is"},
  ];

  // 📘 Subjects
  List<Map<String, dynamic>> subjects = [
    {
      "id": 1,
      "name": "Math 1",
      "doctorId": 1,
      "year": "1",
      "department": null,
      "hoursPerWeek": 2,
      "sessions": 1,
    },
    {
      "id": 2,
      "name": "Physics",
      "doctorId": 2,
      "year": "1",
      "department": null,
      "hoursPerWeek": 2,
      "sessions": 1,
    },
    {
      "id": 3,
      "name": "Programming",
      "doctorId": 3,
      "year": "1",
      "department": null,
      "hoursPerWeek": 3,
      "sessions": 1,
    },
    {
      "id": 4,
      "name": "English",
      "doctorId": 4,
      "year": "1",
      "department": null,
      "hoursPerWeek": 2,
      "sessions": 1,
    },
    {
      "id": 5,
      "name": "Logic",
      "doctorId": 5,
      "year": "1",
      "department": null,
      "hoursPerWeek": 2,
      "sessions": 1,
    },
    {
      "id": 6,
      "name": "Statistics",
      "doctorId": 6,
      "year": "1",
      "department": null,
      "hoursPerWeek": 2,
      "sessions": 1,
    },
    {
      "id": 7,
      "name": "DS",
      "doctorId": 1,
      "year": "2",
      "department": null,
      "hoursPerWeek": 2,
      "sessions": 1,
    },
    {
      "id": 8,
      "name": "OOP",
      "doctorId": 2,
      "year": "2",
      "department": null,
      "hoursPerWeek": 3,
      "sessions": 1,
    },
  ];

  // 👤 Users (Students, Teachers, Admins)
  List<Map<String, dynamic>> users = [
    {
      "id": 1,
      "name": "Admin User",
      "email": "admin@school.com",
      "role": "admin",
      "password": "admin123",
    },
  ];

  // 📅 Generated Timetables
  List<Map<String, dynamic>> timetables = [];

  // Add Doctor
  void addDoctor(Map<String, dynamic> doctor) {
    doctor['id'] = doctors.isEmpty ? 1 : doctors.last['id'] + 1;
    doctors.add(doctor);
  }

  // Add Room
  void addRoom(Map<String, dynamic> room) {
    room['id'] = rooms.isEmpty ? 1 : rooms.last['id'] + 1;
    rooms.add(room);
  }

  // Add Subject
  void addSubject(Map<String, dynamic> subject) {
    subject['id'] = subjects.isEmpty ? 1 : subjects.last['id'] + 1;
    subjects.add(subject);
  }

  // Add User (Student, Teacher, Admin)
  void addUser(Map<String, dynamic> user) {
    user['id'] = users.isEmpty ? 1 : users.last['id'] + 1;
    users.add(user);
  }

  // Add Group
  void addGroup(Map<String, dynamic> group) {
    group['id'] = groups.isEmpty ? 1 : groups.last['id'] + 1;
    groups.add(group);
  }

  // Delete Doctor
  void deleteDoctor(int id) {
    doctors.removeWhere((doc) => doc['id'] == id);
  }

  // Delete Room
  void deleteRoom(int id) {
    rooms.removeWhere((room) => room['id'] == id);
  }

  // Update Subject
  void updateSubject(int id, Map<String, dynamic> updatedData) {
    final index = subjects.indexWhere((subject) => subject['id'] == id);
    if (index != -1) {
      subjects[index].addAll(updatedData);
    }
  }

  // Delete Subject
  void deleteSubject(int id) {
    subjects.removeWhere((subject) => subject['id'] == id);
  }

  // Delete User
  void deleteUser(int id) {
    users.removeWhere((user) => user['id'] == id);
  }

  // Generate Timetables
  Map<String, List<Map<String, dynamic>>> generateTimetables() {
    timetables.clear();

    Map<String, List<Map<String, dynamic>>> generatedTimetables = {};

    for (var group in groups) {
      String groupKey =
          'Year${group['year']}${group['department'] ?? 'General'}';
      List<Map<String, dynamic>> groupTimetable = [];

      // Get subjects for this group
      var groupSubjects = subjects
          .where(
            (subject) =>
                subject['year'] == group['year'] &&
                (group['department'] == null ||
                    subject['department'] == group['department']),
          )
          .toList();

      // Create schedule
      int dayIndex = 0;
      List<String> days = [
        'Saturday',
        'Sunday',
        'Monday',
        'Tuesday',
        'Wednesday',
      ];

      for (var subject in groupSubjects) {
        for (int session = 0; session < subject['sessions']; session++) {
          int roomId = (dayIndex % rooms.length) + 1;
          String day = days[dayIndex % days.length];
          String time = "${08 + (session % 5)}:00";

          groupTimetable.add({
            'subject': subject['name'],
            'doctor': doctors.firstWhere(
              (d) => d['id'] == subject['doctorId'],
            )['name'],
            'room': rooms.firstWhere((r) => r['id'] == roomId)['name'],
            'day': day,
            'time': time,
            'duration': '1 hour',
          });

          dayIndex++;
        }
      }

      generatedTimetables[groupKey] = groupTimetable;
    }

    timetables = generatedTimetables.values.expand((t) => t).toList();
    return generatedTimetables;
  }

  // Get stats
  int getTotalDoctors() => doctors.length;
  int getTotalRooms() => rooms.length;
  int getTotalSubjects() => subjects.length;
  int getTotalGroups() => groups.length;
  int getTotalUsers() => users.length;
}
