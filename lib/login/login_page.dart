import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/home/home_page.dart';

import 'login_bloc.dart';
class LoginScreen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF06041F), // Màu nền của màn hình
      child: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginFailure) {
            // Hiển thị thông báo lỗi nếu đăng nhập thất bại
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Đăng nhập thất bại: ${state.error}')),
            );
          }
        },
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            if (state is LoginLoading) {
              // Hiển thị loading indicator khi đang thực hiện đăng nhập
              return const Center(child: CircularProgressIndicator());
            } else {
              // Hiển thị giao diện đăng nhập
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 150,right: 12,left: 12),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'ĐĂNG NHẬP',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          decoration: TextDecoration.none, // Bỏ gạch chân
                        ),
                      ),
                      const SizedBox(height: 90),
                      Material(
                        color: Colors.transparent,
                        child: TextField(
                          controller: usernameController,
                          decoration: const InputDecoration(
                            labelText: 'Địa chỉ Email',
                            labelStyle: TextStyle(color: Colors.white), // Màu chữ label
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Material(
                        color: Colors.transparent,
                        child: TextField(
                          controller: passwordController,
                          decoration: InputDecoration(
                            labelText: 'Mật khẩu',
                            labelStyle: const TextStyle(color: Colors.white), // Màu chữ label
                            suffixIcon: IconButton(
                              icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off), // Sử dụng biến để thay đổi icon
                              onPressed: () {
                                  _isObscure = !_isObscure; // Đảo ngược trạng thái của mật khẩu
                              },
                            ),
                          ),
                          obscureText: _isObscure, // Ẩn/hiện mật khẩu dựa trên trạng thái của biến
                        ),
                      ),
                      const SizedBox(height: 15),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(),
                          Text('Quên mật khẩu?',style: TextStyle(fontSize: 12,decoration: TextDecoration.none, color: Colors.white),),
                        ],
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(Color(0xFFDE0B30)),
                            overlayColor: MaterialStatePropertyAll((Colors.green)),
                            fixedSize: MaterialStatePropertyAll((Size(400, 50))) ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
                          // Gửi sự kiện LoginButtonPressed với thông tin đăng nhập từ người dùng
                          BlocProvider.of<LoginBloc>(context).add(
                            LoginButtonPressed(
                              username: usernameController.text,
                              password: passwordController.text,
                            ),
                          );
                        },
                        child: const Text('Đăng Nhập',style: TextStyle(color: Colors.white),),
                      ),
                      const SizedBox(height: 25),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Divider(
                              color: Colors.white38, // Đặt màu trắng cho Divider
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8), // Padding giữa Divider và Text
                            child: Text(
                              'Or',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              color: Colors.white38, // Đặt màu trắng cho Divider
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(onPressed: (){},
                                style: const ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(Colors.white12),
                                    fixedSize: MaterialStatePropertyAll(Size(150, 20)) ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/images/google.png', // Đường dẫn đến tệp PNG của logo Google
                                      width: 24, // Độ rộng của hình ảnh
                                      height: 24, // Độ cao của hình ảnh
                                    ),
                                    const Text('Google',style: TextStyle(color: Colors.white),),
                                  ],
                                )),
                            ElevatedButton(onPressed: (){},
                                style: const ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(Colors.white12),
                                    fixedSize: MaterialStatePropertyAll(Size(150, 20)) ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/images/fb.png', // Đường dẫn đến tệp PNG của logo Google
                                      width: 24, // Độ rộng của hình ảnh
                                      height: 24, // Độ cao của hình ảnh
                                    ),
                                    const Text('Facebook',style: TextStyle(color: Colors.white),),
                                  ],
                                )),
                          ],
                        ),
                      ),
                      Text('Bạn chưa có tài khoản? Đăng ký ngay',
                          style: TextStyle(color: Colors.white,fontSize: 10,decoration: TextDecoration.none))
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}