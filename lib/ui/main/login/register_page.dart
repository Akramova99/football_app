import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/ui/main/login/register_cubit.dart';
import 'package:football_app/ui/main/login/register_state.dart';

import '../../../service/flutter_toast.dart';
import '../home/home_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isPasswordVisible = false;

  final TextEditingController _nicknameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // checkRegistration() async {
  //   String email = _emailController.text.toString().trim();
  //   String password = _passwordController.text.toString().trim();
  //   String nickname = _nicknameController.text.toString().trim();
  //   if (email.isNotEmpty && nickname.isNotEmpty && password.isNotEmpty) {
  //     RegisterUser registerUser =
  //         RegisterUser(username: nickname, email: email, password: password);
  //     var response = await AuthService.registration(registerUser);
  //     Logger().i("ishlamoqda");
  //     Logger().i(response);
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => const HomePage(),
  //       ),
  //     );
  //   }
  // }

  @override
  void dispose() {
    _nicknameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    final cubit = context.read<RegisterCubit>();
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Image.asset(
              'assets/images/logo.png',
            ),
            const SizedBox(height: 30),
            const Text(
              'Ro\'yhatdan O\'tish',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 50),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.grey[200],
              ),
              child: TextField(
                controller: _nicknameController,
                decoration: const InputDecoration(
                  labelText: 'Nickname',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 12.0,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.grey[200],
              ),
              child: TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Phone or Email',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 12.0,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.grey[200],
              ),
              child: TextField(
                controller: _passwordController,
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                    labelText: 'Password',
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 12.0,
                    ),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                      child: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    )),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              // height: 52,
              child: BlocBuilder<RegisterCubit, RegisterState>(
                  bloc: cubit,
                  builder: (context, state) {
                    final isLoading = state == RegisterLoaded();
                    if (state == RegisterLoaded()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                      );
                    }
                    if (state == RegisterError()) {
                      showToast("Something went wrong");
                    }
                    return ElevatedButton(
                      onPressed: isLoading
                          ? null
                          : () {
                              final email = _emailController.text.trim();
                              final password = _passwordController.text.trim();
                              final nickname = _nicknameController.text.trim();
                              if (email.isNotEmpty &&
                                  password.isNotEmpty &&
                                  nickname.isNotEmpty) {
                                cubit.registration(
                                    email: email,
                                    password: password,
                                    nickname: nickname);

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const HomePage(),
                                  ),
                                );
                              } else {
                                showToast("Incorrect email or password");
                              }
                            },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF00B900),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50,
                          vertical: 15,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Ro\'yhatdan o\'tish',
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                    );
                  }),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  'Akkauntingiz bormi?',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Kirish",
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
