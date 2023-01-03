import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shamo_frontend/models/meesage_model.dart';
import 'package:shamo_frontend/models/product_model.dart';
import 'package:shamo_frontend/models/user_model.dart';

class MessageService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<List<MessageModel>> getMessagesByUserId({required int userId}) {
    try {
      return firestore
          .collection('messages')
          .where('userId', isEqualTo: userId)
          .snapshots()
          .map((QuerySnapshot list) {
        var result = list.docs.map<MessageModel>(
          (DocumentSnapshot message) {
            print(message.data());
            return MessageModel.fromJson(
                message.data() as Map<String, dynamic>);
          },
        ).toList();

        print('SEBELUM SORT : $result');

        result.sort(
          (MessageModel a, MessageModel b) =>
              a.createdAt!.compareTo(b.createdAt!),
        );

        print('SETELAH SORT : $result');

        return result;
      });
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }

  Future<void> addMessage(
      {UserModel? user,
      bool isFromUser = false,
      String message = '',
      ProductModel? product}) async {
    try {
      firestore.collection('messages').add({
        'userId': user?.id,
        'userName': user?.name,
        'userImage': user?.profilePhotoUrl,
        'isFromUser': isFromUser,
        'message': message,
        'product':
            product is UninitializedProductModel ? {} : product?.toJson(),
        'createdAt': DateTime.now().toString(),
        'updatedAt': DateTime.now().toString(),
      }).then(
        (value) => print('Pesan berhasil dikirim!'),
      );
    } catch (e) {
      throw Exception('Pesan Gagal Dikirim');
    }
  }
}
