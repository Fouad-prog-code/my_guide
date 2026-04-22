class MockData {
  /// 👨‍🏫 Doctors
  static List<Map<String, dynamic>> doctors = [
    {"id": 1, "name": "Dr Ahmed"},
    {"id": 2, "name": "Dr Ali"},
    {"id": 3, "name": "Dr Sara"},
    {"id": 4, "name": "Dr Omar"},
    {"id": 5, "name": "Dr Mona"},
    {"id": 6, "name": "Dr Khaled"},
  ];

  /// 🏫 Rooms (4 rooms)
  static List<Map<String, dynamic>> rooms = [
    {"id": 1, "name": "R1"},
    {"id": 2, "name": "R2"},
    {"id": 3, "name": "R3"},
    {"id": 4, "name": "R4"},
  ];

  /// 🎓 Years + Departments
  static List<Map<String, dynamic>> groups = [
    {"year": "1", "department": null},
    {"year": "2", "department": null},
    {"year": "3", "department": null},
    {"year": "4", "department": "cs"},
    {"year": "4", "department": "it"},
    {"year": "4", "department": "network"},
    {"year": "4", "department": "is"},
  ];

  /// 📘 Subjects (6 لكل فرقة تقريبًا)
  static List<Map<String, dynamic>> subjects = [
    /// First Year
    {
      "id": 1,
      "name": "Math 1",
      "doctorId": 1,
      "year": "1",
      "department": null,
      "sessions": 1,
    },
    {
      "id": 2,
      "name": "Physics",
      "doctorId": 2,
      "year": "1",
      "department": null,
      "sessions": 1,
    },
    {
      "id": 3,
      "name": "Programming",
      "doctorId": 3,
      "year": "1",
      "department": null,
      "sessions": 1,
    },
    {
      "id": 4,
      "name": "English",
      "doctorId": 4,
      "year": "1",
      "department": null,
      "sessions": 1,
    },
    {
      "id": 5,
      "name": "Logic",
      "doctorId": 5,
      "year": "1",
      "department": null,
      "sessions": 1,
    },
    {
      "id": 6,
      "name": "Statistics",
      "doctorId": 6,
      "year": "1",
      "department": null,
      "sessions": 1,
    },

    /// Second Year
    {
      "id": 7,
      "name": "DS",
      "doctorId": 1,
      "year": "2",
      "department": null,
      "sessions": 1,
    },
    {
      "id": 8,
      "name": "OOP",
      "doctorId": 2,
      "year": "2",
      "department": null,
      "sessions": 1,
    },
    {
      "id": 9,
      "name": "DB",
      "doctorId": 3,
      "year": "2",
      "department": null,
      "sessions": 1,
    },
    {
      "id": 10,
      "name": "Math 2",
      "doctorId": 4,
      "year": "2",
      "department": null,
      "sessions": 1,
    },
    {
      "id": 11,
      "name": "Networks",
      "doctorId": 5,
      "year": "2",
      "department": null,
      "sessions": 1,
    },
    {
      "id": 12,
      "name": "Web",
      "doctorId": 6,
      "year": "2",
      "department": null,
      "sessions": 1,
    },

    /// Fourth Year CS
    {
      "id": 13,
      "name": "AI",
      "doctorId": 1,
      "year": "4",
      "department": "cs",
      "sessions": 1,
    },
    {
      "id": 14,
      "name": "ML",
      "doctorId": 2,
      "year": "4",
      "department": "cs",
      "sessions": 1,
    },
    {
      "id": 15,
      "name": "Cloud",
      "doctorId": 3,
      "year": "4",
      "department": "cs",
      "sessions": 1,
    },
    {
      "id": 16,
      "name": "Security",
      "doctorId": 4,
      "year": "4",
      "department": "cs",
      "sessions": 1,
    },
    {
      "id": 17,
      "name": "Big Data",
      "doctorId": 5,
      "year": "4",
      "department": "cs",
      "sessions": 1,
    },
    {
      "id": 18,
      "name": "Advanced CS",
      "doctorId": 6,
      "year": "4",
      "department": "cs",
      "sessions": 1,
    },

    /// third Year CS
    {
      "id": 19,
      "name": "OOP2",
      "doctorId": 3,
      "year": "3",
      "department": null,
      "sessions": 1,
    },
    {
      "id": 20,
      "name": "Network3",
      "doctorId": 2,
      "year": "3",
      "department": null,
      "sessions": 1,
    },
    {
      "id": 21,
      "name": "OS",
      "doctorId": 1,
      "year": "3",
      "department": null,
      "sessions": 1,
    },
    {
      "id": 22,
      "name": "VD",
      "doctorId": 6,
      "year": "3",
      "department": null,
      "sessions": 1,
    },
    {
      "id": 23,
      "name": "HG",
      "doctorId": 5,
      "year": "3",
      "department": null,
      "sessions": 1,
    },
    {
      "id": 24,
      "name": "Advanced OS",
      "doctorId": 6,
      "year": "3",
      "department": null,
      "sessions": 1,
    },

    /// forth Year it
    {
      "id": 25,
      "name": "ALG",
      "doctorId": 3,
      "year": "4",
      "department": 'it',
      "sessions": 1,
    },
    {
      "id": 26,
      "name": "Network2",
      "doctorId": 2,
      "year": "4",
      "department": 'it',
      "sessions": 1,
    },
    {
      "id": 27,
      "name": "DS2",
      "doctorId": 1,
      "year": "4",
      "department": 'it',
      "sessions": 1,
    },
    {
      "id": 28,
      "name": "DD",
      "doctorId": 6,
      "year": "4",
      "department": 'it',
      "sessions": 1,
    },
    {
      "id": 29,
      "name": "HG",
      "doctorId": 5,
      "year": "4",
      "department": 'it',
      "sessions": 1,
    },
    {
      "id": 30,
      "name": "Advanced OS",
      "doctorId": 6,
      "year": "4",
      "department": 'it',
      "sessions": 1,
    },
  ];

  static List<String> days = [
    "Sunday",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
  ];

  /// ⏱️ كل محاضرة = ساعتين
  static List<String> hours = ["9-11", "11-1", "1-3", "3-5"];
}
