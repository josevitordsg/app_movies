import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final _formKey = GlobalKey<FormState>();

  final Map<String, dynamic> _sharedData = {};
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  bool _isSending = false; // Indicador de carregamento

  final firebaseUrl = Uri.https(
    'projetoapppobreflix-default-rtdb.firebaseio.com',
    '/users.json',
  );

  String? _validateField(String? value) {
    if (value == null || value.isEmpty) {
      return "Este campo é obrigatório.";
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Digite uma senha.";
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Confirme sua senha.";
    }
    if (value != _sharedData["password"]) {
      return "As senhas não coincidem.";
    }
    return null;
  }

  Future<void> _saveDataToFirebase() async {
    setState(() {
      _isSending = true; 
    });

    try {
      final response = await http.post(
        firebaseUrl,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "username": _sharedData["username"],
          "password": _sharedData["password"],
          "favorites": []
        }),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Dados salvos com sucesso!')),
        );
        _formKey.currentState!.reset();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao salvar os dados: ${response.body}')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao salvar os dados: $e')),
      );
    } finally {
      setState(() {
        _isSending = false;
      });
    }
  }

  void _submitForm(BuildContext context) {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();
    _saveDataToFirebase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(30, 30, 30, 50),
      appBar: AppBar(
        title: const Text("Dados de Login"),
        backgroundColor: const Color.fromRGBO(30, 30, 30, 50),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Nome de Usuário",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.1),
                  hintText: 'Digite seu nome de usuário',
                  hintStyle: const TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
                keyboardType: TextInputType.text,
                validator: _validateField,
                onSaved: (value) {
                  _sharedData["username"] = value;
                },
              ),
              const SizedBox(height: 16),
              const Text(
                "Senha",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.1),
                  hintText: "Digite sua senha",
                  hintStyle: const TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() => _isPasswordVisible = !_isPasswordVisible);
                    },
                  ),
                ),
                obscureText: !_isPasswordVisible,
                validator: _validatePassword,
                onChanged: (value) {
                  _sharedData["password"] = value;
                },
              ),
              const SizedBox(height: 16),
              const Text(
                "Confirme a Senha",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.1),
                  hintText: "Confirme sua senha",
                  hintStyle: const TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isConfirmPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() => _isConfirmPasswordVisible = !_isConfirmPasswordVisible);
                    },
                  ),
                ),
                obscureText: !_isConfirmPasswordVisible,
                validator: _validateConfirmPassword,
              ),
              const SizedBox(height: 32),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  elevation: 6.0,
                  backgroundColor: const Color.fromARGB(255, 212, 18, 4),
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 130),
                  ),
                  onPressed: _isSending ? null : () => _submitForm(context),
                  child: _isSending
                      ? const SizedBox(
                          height: 16,
                          width: 16,
                          child: CircularProgressIndicator(),
                        )
                      : const Text('Continuar',
                      style: TextStyle(fontSize: 15, color: Colors.white),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
