import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';
import 'package:stevo_flutter/models/material.dart';
import 'package:stevo_flutter/models/assessment.dart';
import 'package:stevo_flutter/models/topic.dart';
import 'package:stevo_flutter/models/user.dart';
import 'package:stevo_flutter/services/assessment.dart';
import 'package:stevo_flutter/services/attempt.dart';
import 'package:stevo_flutter/services/material.dart';
import 'package:stevo_flutter/services/topic.dart';

import '../models/attempt.dart';

class UserInfo extends ChangeNotifier {
  User _user = User(
    id: "1",
    firstName: "John",
    lastName: "Doe",
    email: "",
    role: "student",
  );
  List<Topic> _topics = [];
  List<MaterialModel> _materials = [];
  Topic _currentTopic = Topic.empty();
  MaterialModel _currentMaterial = MaterialModel.empty();
  List<Assessment> _assessments = [];

  Assessment currentAssessment = Assessment.empty();
  Attempt currentAttempt = Attempt.empty();
  List<Attempt> _attempts = [];

  //load attempts
  loadAttempts() async {
    print("Loading attempts");
    //_attempts = await getAttempts(currentAssessment.id);
    if (_attempts != false) {
      print("Attempts loaded");
      //print attempt names
      for (var attempt in _attempts) {
        print(attempt.id);
      }
      notifyListeners();
      return true;
    } else {
      print("Error loading attempts");
      return false;
    }
  }

  //load Attempts by assessment id
  loadAttemptsByAssessmentId(String id) async {
    print("Loading attempts");
    _attempts = await getAttemptsByAssessment(id);
    if (_attempts != false) {
      print("Attempts loaded");
      //print attempt names
      for (var attempt in _attempts) {
        print(attempt.id);
      }
      notifyListeners();
      return true;
    } else {
      print("Error loading attempts");
      return false;
    }
  }

  //load user assessments using myAssessments service
  loadAssessments() async {
    print("Loading assessments");
    _assessments = await getMyAssessments();
    if (_assessments != false) {
      print("Assessments loaded");
      //print assessment names
      for (var assessment in _assessments) {
        print(assessment.name);
      }
      notifyListeners();
      return true;
    } else {
      print("Error loading assessments");
      return false;
    }
  }

  //assessments getter:
  List<Assessment> get getAssessments => _assessments;

  //create and set attempt
  startAttempt() async {
    currentAttempt = await createAttempt(currentAssessment.id);
    if (currentAttempt.id != "") {
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }

  //load attempt
  loadAttempt(String id) async {
    currentAttempt = await getAttempt(id);
    notifyListeners();
  }

  //submit attempt
  submitAssessment(List<List<String>> answers) async {
    var result = await submitAttempt(currentAttempt.id, answers);
    if (result != false) {
      currentAttempt = result;
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }

  //load test from id
  loadTest(String id) async {
    currentAssessment = await getAssessment(id);
    notifyListeners();
  }

  //get current test
  Assessment get getCurrentTest => currentAssessment;

  //set current test
  setCurrentTest(Assessment test) {
    currentAssessment = test;
    notifyListeners();
  }

  Topic get currentTopic => _currentTopic;

  List<Topic> get topics => _topics;

  setCurrentTopic(Topic topic) {
    _currentTopic = topic;
    notifyListeners();
  }

  //set Current Topic by id, iterate through topics and set current topic
  setCurrentTopicById(String id) {
    for (var topic in _topics) {
      if (topic.id == id) {
        _currentTopic = topic;
        notifyListeners();
        return;
      }
    }
  }

  loadTopics() async {
    print("Loading topics");
    _topics = await getTopics();
    //loop through topics and print the id of each topic
    if (_topics != false) {
      for (var topic in _topics) {
        print(topic.id);
      }
      print("Topics loaded");
      notifyListeners();
    } else {
      print("Error loading topics");
    }
    //notifyListeners();
  }

  getTopicsList() {
    print(_topics);
    return _topics;
  }

  void updateTopics(List<Topic> topics) {
    _topics.clear();
    _topics.addAll(topics);
    notifyListeners();
  }

  List<MaterialModel> get materials => _materials;

  set materials(List<MaterialModel> materials) {
    _materials = materials;
    notifyListeners();
  }

  loadMaterials() async {
    print("Loading materials");
    _materials = await getMaterialsOfTopic(_currentTopic.id!);
    if (_materials != false) {
      print("Materials loaded");
      notifyListeners();
    } else {
      print("Error loading materials");
    }
    notifyListeners();
  }

  deleteMaterialFromTopic(String id) async {
    print("Deleting material");
    bool result = await deleteMaterial(id);
    if (result) {
      print("Material deleted");
      notifyListeners();
    } else {
      print("Error deleting material");
    }
    //load Materials again after deleting
    loadMaterials();
    //notifyListeners();
  }

  User get user => _user;

  set user(User user) {
    _user = user;
    notifyListeners();
  }

  void updateUserInfo() {
    _user.updateUserInfo();
    notifyListeners();
  }
}
