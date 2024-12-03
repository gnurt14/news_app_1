import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  RxBool isObscureText = true.obs;  // Quản lý trạng thái ẩn/mở mật khẩu
  RxBool isLoading = false.obs;  // Quản lý trạng thái đang tải

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signUp(String email, String password, String confirmPassword) async {
    if (password != confirmPassword) {
      Get.snackbar('Lỗi', 'Mật khẩu và mật khẩu xác nhận không khớp.');
      return;
    }

    try {
      isLoading.value = true;

      // Đăng ký tài khoản mới với email và mật khẩu
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Xử lý sau khi đăng ký thành công
      Get.snackbar('Đăng ký thành công!', 'Tạo tài khoản mới thành công.');

      // Chuyển sang màn hình đăng nhập (hoặc trang chính)
      // Get.offAllNamed('/home');

    } catch (e) {
      // Xử lý lỗi
      Get.snackbar('Lỗi', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // Phương thức để chuyển đổi trạng thái ẩn/mở mật khẩu
  void togglePasswordVisibility() {
    isObscureText.value = !isObscureText.value;
  }
}
