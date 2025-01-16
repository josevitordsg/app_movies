import 'package:flutter/material.dart';

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

  void _navigateToNextScreen(BuildContext context) {
    if (!_formKey.currentState!.validate()) return;

    // Lógica de navegação (substitua pela próxima tela adequada)
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Navegando para próxima tela...')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dados de Login"),
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
              TextFormField(
                decoration: const InputDecoration(hintText: "Digite seu nome de usuário"),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),

              const Text(
                "Senha",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Digite sua senha",
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
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Confirme sua senha",
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
                onChanged: (value) {
                  _sharedData["confirmPassword"] = value;
                },
              ),
              const SizedBox(height: 32),

              Center(
                child: ElevatedButton(
                  onPressed: () => _navigateToNextScreen(context),
                  child: const Text("Continuar"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
