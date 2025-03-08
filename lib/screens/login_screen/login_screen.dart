import 'package:flutter/material.dart';
import 'package:flutter_provider/provider/login_provider.dart';
import 'package:provider/provider.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Login Screen'),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
        child: Consumer<AuthProvider>(
          builder: (context,value,child){
            return Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                          hintText: 'Email'
                      ),
                    ),
                    TextFormField(
                      controller: _passwordController,
                      decoration: const InputDecoration(
                          hintText: 'Password'
                      ),
                    ),
                    ElevatedButton(
                        onPressed: (){
                          value.login(_emailController.text.toString(), _passwordController.text.toString());
                        },
                        child: value.isLoading ? CircularProgressIndicator(
                          color: Colors.red,
                        ): Text('Login')
                    ),

                  ],
                )
            );
          }
        ),
      ),
    );
  }
}
