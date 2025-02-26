class User {
    final int id;
    final String firstName;
    final String lastName;

    User.fromJson(Map<String, dynamic> data)
        : id = data['id'] ?? 0,
        firstName = data['firstName'] ?? '',
        lastName = data['lastName'] ?? '';

    void userInformation() {
        print("User ID: $id, User Name: $firstName $lastName");
    }
}