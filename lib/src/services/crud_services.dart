import 'package:bus_booking/src/services/exceptions/crud_failure.dart';
import 'package:bus_booking/src/utils/popup_warning.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CrudServices {

  final FirebaseFirestore service = FirebaseFirestore.instance;

  Future<void> insert(String collection,dynamic data) async {

    try{
      await service.collection(collection).doc(data.id).set(data.toJson());
    } on FirebaseException catch(e){
      final ex = CrudFailure.code(e.code);
      PopupWarning.Warning(
        title: "Try again later",
        message: ex.message,
        type: 1
      );
    }catch(_) {
      final ex = CrudFailure();
      PopupWarning.Warning(
          title: "Try again later",
          message: ex.message,
          type: 1
      );
      throw ex;
    }
  }
}