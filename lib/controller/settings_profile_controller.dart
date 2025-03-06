
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

class SettingsProfileController extends GetxController {
  final GetStorage _storage = GetStorage();
  final RxString _photoUrl = ''.obs;
  final RxString _username = ''.obs;

  String get photoUrl => _photoUrl.value;
  String get username => _username.value;

  @override
  void onInit() {
    super.onInit();

    _photoUrl.value = _storage.read('photoUrl') ?? '';
    _username.value = _storage.read('username') ?? 'User';
  }

  Future<void> changeProfilePhoto() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      _photoUrl.value = image.path;
      _storage.write('photoUrl', image.path);
    } else {
      _photoUrl.value = '';
    }
  }

  void changeUsername(String newUsername) {
    _username.value = newUsername;
    _storage.write('username', newUsername);
  }
}
