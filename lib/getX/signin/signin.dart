import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SigninController extends GetxController {
  RxString id = ''.obs;
  RxString password = ''.obs;
  RxBool saveId = false.obs;

  final storage = GetStorage();

  onChangeId(value) => id.value = value;

  onChangePassword(value) => password.value = value;

  @override
  void onInit() {
    super.onInit();
    storage.listenKey('saveId', (value) {
      saveId.value = value == 'true' ? true : false;
    });
  }
}

class Signin extends StatelessWidget {
  Signin({Key? key}) : super(key: key);

  // final SigninController _signinController = SigninController();
  final SigninController _signinController = Get.put(SigninController());
  final _formKey = GlobalKey<FormState>();

  final storage = GetStorage();

  InputDecoration _inputDecoration({String? labelText, IconData? iconData}) {
    return InputDecoration(
      labelText: labelText,
      labelStyle: const TextStyle(
        color: Color(0x44ffffff),
      ),
      // floatingLabelBehavior: FloatingLabelBehavior.never,
      floatingLabelStyle: const TextStyle(
        color: Color(0x44ffffff),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: Color(0xFFfe5b60),
        ),
      ),
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: Color(0x44ffffff),
        ),
      ),
      // icon: Icon(
      //   iconData,
      //   color: const Color(0xFFCCCCCC),
      // ),
      // prefixIcon: Icon(
      //   iconData,
      //   color: const Color(0xFFCCCCCC),
      // ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      backgroundColor: const Color(0xFF161C21),
      body: SafeArea(
        child: Center(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                          autofocus: true,
                          cursorColor: const Color(0xFFFE5B60),
                          style: const TextStyle(color: Colors.white),
                          decoration: _inputDecoration(
                              labelText: '아이디 *', iconData: Icons.person),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }

                            if (!GetUtils.isEmail(value)) {
                              return 'Email is not valid';
                            }
                            return null;
                          },
                          onChanged: _signinController.onChangeId,
                        ),
                        const SizedBox(height: 10.0),
                        TextFormField(
                          autofocus: true,
                          cursorColor: Colors.red,
                          style: const TextStyle(color: Colors.white),
                          decoration: _inputDecoration(
                              labelText: '비밀번호 *', iconData: Icons.lock),
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          onChanged: _signinController.onChangePassword,
                        ),
                        const SizedBox(height: 10.0),
                        Row(
                          children: [
                            Obx(
                              () => Checkbox(
                                fillColor: MaterialStateProperty.all(
                                    const Color(0xFFFE5B60)),
                                activeColor: Colors.white,
                                checkColor: const Color(0xFFFFFFFF),
                                value: _signinController.saveId.value,
                                // onChanged: _signinController.onChangeSaveId),
                                onChanged: (value) =>
                                    storage.write('saveId', value.toString()),
                              ),
                            ),
                            const Text(
                              '아이디 저장',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xFFFE5B60),
                      minimumSize:
                          Size(MediaQuery.of(context).size.width, 50.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Obx(() => Text(
                                '${_signinController.id} ${_signinController.password} ${_signinController.saveId}')),
                          ),
                        );
                      }
                    },
                    child: const Text('로그인'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
