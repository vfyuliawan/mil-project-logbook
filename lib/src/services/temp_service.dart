part of 'services.dart';

class TemperatureService {
  final tempCollection =
      FirebaseFirestore.instance.collection(tempRecordCollectionName);

  Future<Either<String, List<TempRecordingModel>>> fetchListSuhu() async {
    try {
      final querySnapshot = await tempCollection.get();
      final data = querySnapshot.docs
          .map((e) => TempRecordingModel.fromMap(e.data()))
          .toList();
      return right(data);
    } catch (e) {
      return left(e.toString());
    }
  }
}
