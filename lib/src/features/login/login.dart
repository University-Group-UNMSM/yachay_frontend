import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
import 'package:probandoflutter/main.dart';

final _formKey = GlobalKey<FormState>();

class MyAppLogin extends StatefulWidget {
  const MyAppLogin({super.key});

  @override
  State<MyAppLogin> createState() => _MyAppLoginState();
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyAppLogin(),
    );
  }
}

class User {
  final String email;
  final String pass;

  User(this.email, this.pass);

  bool verificarCredenciales(String emailToCheck, String passToCheck) {
    return email == emailToCheck && pass == passToCheck;
  }
}

class _MyAppLoginState extends State<MyAppLogin> {
  bool _aceptaRecordarSesion = false;
  bool _showPassword = false;
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();

  final List<User> _users = [
    User('user1', 'pass1'),
    User('user2', 'pass2'),
    User('user3', 'pass3'),
  ];

  bool validacionDatos(String email, String pass) {
    for (User user in _users) {
      if (user.verificarCredenciales(email, pass)) {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(30, 30, 44, 100),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 30.0,
          vertical: 15.0,
        ),
        children: <Widget>[
          Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset('images/yachaylogo.png'),
                ),
                Text(
                  'Bienvenido',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Open Sans',
                    fontSize: 25.0,
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  '¡Bienvenido de vuelta! Ingresa tus datos, por favor.',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'PT Sans',
                    fontSize: 14.0,
                  ),
                ),
                SizedBox(height: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Correo electrónico',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                        fontFamily: 'PT Sans',
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: user,
                      enableInteractiveSelection: false,
                      autofocus: true,
                      textCapitalization: TextCapitalization.characters,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromRGBO(52, 54, 70, 100),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      style: TextStyle(color: Colors.white),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingresa tu correo electrónico';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Contraseña',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.0,
                              fontFamily: 'PT Sans',
                            ),
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            controller: pass,
                            obscureText: !_showPassword,
                            enableInteractiveSelection: false,
                            autofocus: true,
                            textCapitalization: TextCapitalization.characters,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color.fromRGBO(52, 54, 70, 100),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              suffixIcon: InkWell(
                                onTap: () {
                                  setState(() {
                                    _showPassword = !_showPassword;
                                  });
                                },
                                child: Icon(
                                  _showPassword
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            style: TextStyle(color: Colors.white),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Ingrese su contraseña';
                              }
                              return null;
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        // Pendiente la lógica para recuperar contraseña
                      },
                      child: Text(
                        '¿Olvidaste tu contraseña?',
                        style: TextStyle(
                          fontFamily: 'PT Sans',
                          fontWeight: FontWeight.w400,
                          fontSize: 12.0,
                          color: Color(0xFF0177FB),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          'Recuérdame',
                          style: TextStyle(
                            fontFamily: 'PT Sans',
                            fontWeight: FontWeight.w400,
                            fontSize: 12.0,
                            color: Colors.white,
                          ),
                        ),
                        Checkbox(
                          value: _aceptaRecordarSesion,
                          onChanged: (newValue) {
                            setState(() {
                              _aceptaRecordarSesion = newValue!;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 35),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.blue,
                    ),
                    overlayColor: MaterialStateProperty.all<Color>(
                      Colors.white.withOpacity(0.2),
                    ),
                    minimumSize: MaterialStateProperty.all<Size>(
                      Size(double.infinity, 50),
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      if (validacionDatos(user.text, pass.text) == true) {
                        // Imprimir mensaje de éxito
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Inicio exitoso'),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Correo o contraseña incorrectos'),
                          ),
                        );
                      }
                    }
                  },
                  child: Text(
                    'Iniciar sesión',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.0,
                      fontFamily: 'PT Sans',
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {
                      // Pendiente la lógica para iniciar sesión con Google
                    },
                    child: Text('Iniciar sesión con Google',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                            fontFamily: 'PT Sans')),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                InkWell(
                  onTap: () {
                    // Pendiente la lógica para navegar a la pantalla de registro
                  },
                  child: Text(
                    '¿Aún no tienes una cuenta? Registrarte aquí.',
                    style: TextStyle(
                      fontFamily: 'PT Sans',
                      fontWeight: FontWeight.w400,
                      fontSize: 12.0,
                      color: Color(0xFF0177FB),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
