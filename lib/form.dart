import 'package:flutter/material.dart';
import 'package:oloworay_autos/src/constant/form_error.dart';
import 'package:oloworay_autos/src/constant/strings.dart';

class MyForm extends StatefulWidget {
  const MyForm({Key? key}) : super(key: key);

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  bool _showPassword = false;
  bool _agreeToTerms = false;
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  void _toggleShowPassword() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Form is valid, perform form submission logic here
      // For example, you can display a snackbar with the entered password
      if(_agreeToTerms == true){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Password: ${_passwordController.text}')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: _passwordController,
                    obscureText: !_showPassword,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a password';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Password',
                      suffixIcon: IconButton(
                        icon: Icon(_showPassword
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: _toggleShowPassword,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: _submitForm,
                    child: const Text('Submit'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                Checkbox(
                  value: _agreeToTerms,
                  onChanged: (value) {
                    setState(() {
                      _agreeToTerms = value!;
                    });
                  },
                ),
                const Text('Agree to Terms and Conditions'),
              ],
            ),
            FormError(errors: tError)
          ],
        ),
      ),
    );
  }
}
