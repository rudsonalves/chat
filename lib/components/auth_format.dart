import 'dart:io';

import 'package:flutter/material.dart';

import './user_image_picker.dart';
import '../core/models/auth_form_data.dart';
import '../utils/form_validator.dart';

class AuthForm extends StatefulWidget {
  final void Function(AuthFormData) onSubmit;

  const AuthForm(this.onSubmit, {super.key});

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AuthFormData _formData = AuthFormData();

  void _handleImagePicke(File image) {
    _formData.image = image;
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Theme.of(context).colorScheme.error,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
      ),
    );
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    if (_formData.image == null && _formData.isSignUp) {
      return _showError('Image not selected!');
    }

    widget.onSubmit(_formData);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              if (_formData.isSignUp)
                UserImagePicker(
                  _handleImagePicke,
                ),
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
                initialValue: _formData.password,
                onChanged: (value) => _formData.password = value,
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
                    if (checkPassword != _formData.password) {
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
