import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vodth_mobile/core/base/base_view_model.dart';

class AboutUsViewModel extends BaseViewModel {
  var aboutUs;

  AboutUsViewModel() {
    load();
  }

  Future<void> load() async {
    await getAboutUs();
    notifyListeners();
  }

  Future<void> getAboutUs() async {
    try {
      var snapshot =
          await FirebaseFirestore.instance.collection('aboutUs').get();

      aboutUs = snapshot.docs.map((doc) {
        return doc.data();
      }).toList();

      // print(aboutUs);
    } catch (e) {
      print("Error getting events: $e");
    }
  }
}
