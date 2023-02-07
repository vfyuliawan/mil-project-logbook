part of 'services.dart';

class TempRecordService {
  final tempRecordCollection =
      FirebaseFirestore.instance.collection(tempRecordCollectionName);
  final usersCollection =
      FirebaseFirestore.instance.collection(usersCollectionName);

  Future<Either<String, String>> addNewTempRecord(
      TempRecordingModel data) async {
    try {
      tempRecordCollection.doc(data.id).set(data.toMap());
      return right('Data Berhasil di Input');
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, String>> updateTempRecord(
      String id, TempRecordingModel data) async {
    try {
      tempRecordCollection.doc(data.id).update(data.toMap());
      return right('Berhasil Menambahkan Produk');
    } catch (e) {
      return left(e.toString());
    }
  }
}
