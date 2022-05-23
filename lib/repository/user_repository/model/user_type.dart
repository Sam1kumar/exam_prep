enum UserType { instructor, student }

extension UserTypeX on UserType {
  int get intValue => {
        UserType.instructor: 0,
        UserType.student: 1,
      }[this]!;

  String get userTypeName => {
        UserType.student: 'Student',
        UserType.instructor: 'Instructor',
      }[this]!;
}

UserType getUserTypeFromInt(int value) {
  switch (value) {
    case 1:
      return UserType.student;
    case 0:
      return UserType.instructor;
    default:
      return UserType.student;
  }
}
