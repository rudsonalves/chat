import 'package:chat/models/auth_form_data.dart';
import 'package:chat/utils/form_validator.dart';
import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  final void Function(AuthFormData) onSubmit;

  const AuthForm(this.onSubmit, {super.key});

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final AuthFormData _formData = AuthFormData();

  @override
  void dispose() {
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    widget.onSubmit(_formData);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              if (_formData.isSignUp)
                TextFormField(
                  key: const ValueKey('name'),
                  initialValue: _formData.name,
                  onChanged: (value) => _formData.name = value,
                  validator: FormValidator.isValidName,
                  decoration: const InputDecoration(
                    labelText: 'Nome',
                  ),
                ),
              TextFormField(
                key: const ValueKey('email'),
                initialValue: _formData.email,
                onChanged: (value) => _formData.email = value,
                validator: FormValidator.isValidEmail,
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
              ),
              TextFormField(
                key: const ValueKey('password'),
                initialValue: _formData.pasword,
                onChanged: (value) => _formData.pasword = value,
                validator: FormValidator.isValidPassword,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Your password',
                ),
              ),
              if (_formData.isSignUp)
                TextFormField(
                  key: const ValueKey('check_password'),
                  validator: (value) {
                    final checkPassword = value ?? '';
                    if (checkPassword != _formData.pasword) {
                      return 'Password don\'t match!';
                    }
                    return null;
                  },
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Confirm your password',
                  ),
                ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: _submit,
                child: Text(_formData.isLogin ? 'Sign Up' : 'Sign In'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(_formData.isLogin
                      ? 'Already have account?'
                      : 'Don’t have Account?'),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _formData.toggleAuthMode();
                      });
                    },
                    child: Text(_formData.isLogin ? 'Login!' : 'Sign Up!'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
