import 'package:flutter/material.dart';
import 'package:yachay/src/features/login/data/user-data.dart';
import 'package:yachay/src/features/login/data/user.dart';

final _formKey = GlobalKey<FormState>();

class MyAppLogin extends StatefulWidget {
  const MyAppLogin({super.key});

  @override
  State<MyAppLogin> createState() => _MyAppLoginState();
}

class _MyAppLoginState extends State<MyAppLogin> {
  bool _aceptaRecordarSesion = false;
  bool _showPassword = false;
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();

  bool validacionDatos(String email, String pass) {
    for (User user in users) {
      if (user.verificarCredenciales(email, pass)) {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 30, 30, 44),
      body: ListView(
        padding: const EdgeInsets.symmetric(
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
                  child: Image.asset('../assets/isotipo-azul.png'),
                ),
                const Text(
                  'Bienvenido',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Open Sans',
                    fontSize: 25.0,
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  '¡Bienvenido de vuelta! Ingresa tus datos, por favor.',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'PT Sans',
                    fontSize: 14.0,
                  ),
                ),
                const SizedBox(height: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Correo electrónico',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                        fontFamily: 'PT Sans',
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: user,
                      enableInteractiveSelection: false,
                      autofocus: true,
                      textCapitalization:
                          TextCapitalization.characters,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor:
                            const Color.fromRGBO(52, 54, 70, 100),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      style: const TextStyle(color: Colors.white),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingresa tu correo electrónico';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Contraseña',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.0,
                              fontFamily: 'PT Sans',
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: pass,
                            obscureText: !_showPassword,
                            enableInteractiveSelection: false,
                            autofocus: true,
                            textCapitalization:
                                TextCapitalization.characters,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: const Color.fromRGBO(
                                  52, 54, 70, 100),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(20.0),
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
                            style:
                                const TextStyle(color: Colors.white),
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
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        // Pendiente la lógica para recuperar contraseña
                      },
                      child: const Text(
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
                        const Text(
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
                const SizedBox(height: 35),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.blue,
                    ),
                    overlayColor: MaterialStateProperty.all<Color>(
                      Colors.white.withOpacity(0.2),
                    ),
                    minimumSize: MaterialStateProperty.all<Size>(
                      const Size(double.infinity, 50),
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      if (validacionDatos(user.text, pass.text) ==
                          true) {
                        // Imprimir mensaje de éxito
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Inicio exitoso'),
                          ),
                        );

                        // Navegar a la nueva pantalla
                        Navigator.pushReplacementNamed(
                            context, '/home');
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                                'Correo o contraseña incorrectos'),
                          ),
                        );
                      }
                    }
                  },
                  child: const Text(
                    'Iniciar sesión',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.0,
                      fontFamily: 'PT Sans',
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {
                      // Pendiente la lógica para iniciar sesión con Google
                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.white),
                    ),
                    child: const Text('Iniciar sesión con Google',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                            fontFamily: 'PT Sans')),
                  ),
                ),
                const SizedBox(height: 10.0),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  child: const Text(
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
