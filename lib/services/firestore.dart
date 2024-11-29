import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:future_me/model/UserModel.dart';
import 'package:uuid/uuid.dart';

class FirestoreService {
  var uuid = Uuid();
  final CollectionReference goals =
      FirebaseFirestore.instance.collection("UserTaskList");
  final CollectionReference goalTitles =
      FirebaseFirestore.instance.collection("UserTask");

  //Set value in the database
  Future<dynamic> addGoal(Goal goal, String userId) async {
    final taskId = uuid.v4();
    final timeStamp = Timestamp.now();
    try {
      await goalTitles.add({
        "user_id": userId,
        "task_id": taskId,
        "time_stamp": timeStamp,
        "task_title": goal.nameOfGoal,
      });

      dynamic res = await goals.add({
        "time_stamp": timeStamp,
        "task_id": taskId,
        "time_set": goal.timeSpan,
        "days_done": 0,
        "task_list": goal.goals,
        "task_title": goal.nameOfGoal,
      });
      return res;
    } catch (ex) {
      return null;
    }
  }

//Read the database values and display them in the task,save the task list and save the number of days data is saved
  Stream<QuerySnapshot> getTasksStream(String userID) {
    final taskStream =
        goalTitles.where('user_id', isEqualTo: userID).snapshots();
        // goalTitles.where('user_id', isEqualTo: userID).orderBy('time_stamp', descending: true).snapshots();

    return taskStream;
  }

  //get particular goal
  Stream<QuerySnapshot> getGoalStream(String taskID) {
    final taskStream = goals.where('task_id', isEqualTo: taskID).snapshots();

    return taskStream;
  }


  Future<void> updateGoal(String docID, int newDays) async {
    try {
      await FirebaseFirestore.instance.collection("UserTaskList").doc(docID).update({
        "days_done": newDays,
      });
      print("Days done updated successfully!");
    } catch (ex) {
      print("Error updating days done: $ex");
    }
  }

//Delete the task if the user says they are no longer doing
}

class Goal {
  String? nameOfGoal;
  List<String>? goals;
  String? timeSpan;

  Goal({this.nameOfGoal, this.goals, this.timeSpan});
}
