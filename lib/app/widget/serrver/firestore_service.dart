import 'package:aplication000/app/widget/serrver/UserModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class DataService {
  Future<List<Operation>> getEntryOperations(
      String entryId, String carId) async {
    return [];
  }
}

class FirestoreService {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> dodajPodatke(String docId, String carId, String entryId,
      Map<String, dynamic> podaci) async {
    try {
      await _firestore
          .collection('fs')
          .doc(docId)
          .collection('cars')
          .doc(carId)
          .collection('entries')
          .doc(entryId)
          .collection('operations')
          .add(podaci);
    } catch (e) {
      print('lol: $e');
      throw e;
    }
  }
}
