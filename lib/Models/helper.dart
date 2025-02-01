import 'package:cloud_firestore/cloud_firestore.dart';

String formatDate(Timestamp timestamp) {
  // Convert Timestamp to DateTime
  DateTime dateTime = timestamp.toDate();

  // Get year
  String year = dateTime.year.toString();

  // Get month (add leading zero if necessary)
  String month = dateTime.month.toString().padLeft(2, '0');

  // Get day (add leading zero if necessary)
  String day = dateTime.day.toString().padLeft(2, '0');

  // Final formatted date
  String formattedDate = '$day/$month/$year';

  return formattedDate;
}
