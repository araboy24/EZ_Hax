import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ez_hax/models/levels.dart';
import 'package:ez_hax/models/question.dart';
import 'package:ez_hax/models/user.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference usersCollection = Firestore.instance.collection('users');
  final CollectionReference questionsCollection = Firestore.instance.collection('questions');
  // CollectionReference debugReference = Firestore.instance.collection('users').document(uid).collection('debug');
  // final CollectionReference hackReference = Firestore.instance.collection('users').document('hack');
  // final CollectionReference crackReference = Firestore.instance.collection('users').document('crack');

  //TODO This method is so wrong don't use it
  Future updateUserData(String category, int level) async {
    return await usersCollection.document(uid).setData(
      {
      'crack' : {
        initLevels()
      },
      'hack' : {
      initLevels()
      },
      'debug' : {
      initLevels()
      },
      }
    );
  }

  Future initUserData() async {
    return await usersCollection.document(uid).collection('debug').document('unlockedLevels').setData(

         initLevels()

          // 'crack' : {
          //   initLevels()
          // },
          // 'hack' : {
          //   initLevels()
          // },
          // 'debug' : {
          //   initLevels()
          // },

    );
  }

  Future initUserLevels() async {
    initUserHack();
    initUserDebug();
    initUserCrack();
  }

  Future initUserDebug() async {
    return await usersCollection.document(uid).collection('debug').document('unlockedLevels').setData(
        initLevels()
    );
  }

  Future initUserHack() async {
    return await usersCollection.document(uid).collection('hack').document('unlockedLevels').setData(
        initLevels()
    );
  }

  Future initUserCrack() async {
    return await usersCollection.document(uid).collection('crack').document('unlockedLevels').setData(
        initLevels()
    );
  }


  Future unlockAllLevels() async{
    unlockAllDebug();
    unlockAllCrack();
    unlockAllHack();
    print('all levels unlocked');
  }

  Future unlockSpecificLevel(String cat, int level) async {
    return await usersCollection.document(uid).collection(cat).document('unlockedLevels').updateData(
      {level.toString(): true}
    );
  }

  //Unlock all levels via floating action button on home
  Future unlockAllDebug() async {
    return await usersCollection.document(uid).collection('debug').document('unlockedLevels').setData(
        unlockLevels()
    );
  }
  Future unlockAllHack() async {
    return await usersCollection.document(uid).collection('hack').document('unlockedLevels').setData(
        unlockLevels()
    );
  }
  Future unlockAllCrack() async {
    return await usersCollection.document(uid).collection('crack').document('unlockedLevels').setData(
        unlockLevels()
    );
  }



  Levels _levelsFromSnapshot(DocumentSnapshot snapshot){
    return Levels(
      name: 'debug',
      unlockedLevels: snapshot.data
    );
  }

  // Get level doc stream
  Stream<Levels> get userData {
    return usersCollection.document(uid).collection('debug').document('unlockedLevels').snapshots()
        .map(_levelsFromSnapshot);
  }

  LevelData _levelDataFromSnapshot(DocumentSnapshot snapshot){
    return LevelData(
      unlockedLevels: snapshot.data
    );
  }

  QuestionData _questionDataFromSnapshot(QuerySnapshot snapshot){
    return QuestionData(
      question: snapshot.documents[1].data['question'], //snapshot.['question/question'],
      code:  snapshot.documents[1].data['code'],
      a:  snapshot.documents[0].data['a'],
      b:  snapshot.documents[0].data['b'],
      c:  snapshot.documents[0].data['c'],
      d:  snapshot.documents[0].data['d'],
      correctChoice: snapshot.documents[0].data['correct'],

      /*
      code: snapshot.data['question/code'],
      a: snapshot.data['choices/a'],
      b: snapshot.data['choices/b'],
      c: snapshot.data['choices/c'],
      d: snapshot.data['choices/d'],
      correctChoice: snapshot.data['choices/correct'],
       */
    );
  }

  Stream<LevelData> get levelData {
    return usersCollection.document(uid).collection('debug').document('unlockedLevels').snapshots()
        .map(_levelDataFromSnapshot);
  }

  Stream<LevelData> get debugData {
    return usersCollection.document(uid).collection('debug').document('unlockedLevels').snapshots()
        .map(_levelDataFromSnapshot);
  }

  Stream<LevelData> get hackData {
    return usersCollection.document(uid).collection('hack').document('unlockedLevels').snapshots()
        .map(_levelDataFromSnapshot);
  }

  Stream<LevelData> get crackData {
    return usersCollection.document(uid).collection('crack').document('unlockedLevels').snapshots()
        .map(_levelDataFromSnapshot);
  }

  Map initLevels(){
    Map<String, bool> levels = {
      '1':true,
    };
    for (var i = 2; i < 31; i++){
      levels[i.toString()] = false;
      //levels.update(i, (value) => false);
    }
    return levels;
  }

  // Currently goes to 30
  Map unlockLevels(){
    Map<String, bool> levels = {};
    for (var i = 1; i < 31; i++){
      levels[i.toString()] = true;
      //levels.update(i, (value) => false);
    }
    return levels;
  }

  // Future<Question> getQuestion(String category, int level) async {
  //   await
  //
  // }

  Stream<QuestionData> get questionData {
    return questionsCollection.document('crack').collection('1').snapshots()
        .map(_questionDataFromSnapshot);
  }

  Stream<QuestionData> get crackQuestionData {
    return questionsCollection.document('crack').collection('1').snapshots()
        .map(_questionDataFromSnapshot);
  }

  Stream<QuestionData> get hackQuestionData {
    return questionsCollection.document('hack').collection('1').snapshots()
        .map(_questionDataFromSnapshot);
  }

  Stream<QuestionData> get debugQuestionData {
    return questionsCollection.document('debug').collection('1').snapshots()
        .map(_questionDataFromSnapshot);
  }

  Stream<QuestionData> loadQuestionFromFirebase(String category, int level){
    return questionsCollection.document(category).collection(level.toString()).snapshots()
        .map(_questionDataFromSnapshot);
  }

}