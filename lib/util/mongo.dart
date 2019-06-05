import 'package:mongo_dart/mongo_dart.dart';

class MongoAgent {
  MongoAgent.connect(String url) {
    _db = Db(url);
    print('db object created!');
  }
  static Db _db;

  Future getCollection(String collectionName) async {
    await _db.open();
    final collection = _db.collection(collectionName);
    final list = await collection.find().toList();
    await _db.close();
    return list;
  }
}
