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

class _MyAppLoginState extends State<MyAppLogin> {
  String _nombre = '';
  String _apellido = '';
  String _email = '';
  String _contrasena = '';
  String _repeticionContrasena = '';
  bool _aceptaTerminos = false;
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(30, 30, 44, 100),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 30.0,
          vertical: 50.0,
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
                    fontSize: 36.0,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  '¡Bienvenido de vuelta! Ingresa tus datos, por favor.',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'PT Sans',
                    fontSize: 14.0,
                  ),
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(width: 20),
                  ],
                ),
                SizedBox(height: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment
                      .start, // Alinea los elementos al inicio del eje transversal (horizontal)
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingresa tu correo electrónico';
                        }
                        // Validación de correo electrónico usando una expresión regular
                        bool isValidEmail =
                            RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                .hasMatch(value);
                        if (!isValidEmail) {
                          return 'Por favor ingresa un correo electrónico válido';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _email = value!;
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
                            obscureText:
                                !_showPassword, // Mostrar u ocultar la contraseña según el estado de _showPassword
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
                                  // Cambiar el estado de _showPassword para alternar la visibilidad de la contraseña
                                  setState(() {
                                    _showPassword = !_showPassword;
                                  });
                                },
                                child: Icon(
                                  _showPassword
                                      ? Icons.visibility
                                      : Icons
                                          .visibility_off, // Mostrar el icono correspondiente según el estado de _showPassword
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Ingrese su contraseña';
                              }
                              if (value.length < 6) {
                                return 'Contraseña incorrecta';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _contrasena = value!;
                            },
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                        width:
                            10), // Espacio entre los campos de nombre y apellido
                  ],
                ),
                SizedBox(height: 30),
                CheckboxListTile(
                  title: Text(
                    'Recuérdame',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10.0,
                      fontFamily: 'PT Sans',
                    ),
                  ),
                  controlAffinity: ListTileControlAffinity.leading,
                  value: _aceptaTerminos,
                  onChanged: (newValue) {
                    setState(() {
                      _aceptaTerminos = newValue!;
                    });
                  },
                ),
                SizedBox(height: 15),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.blue,
                    ),
                    overlayColor: MaterialStateProperty.all<Color>(
                      Colors.white.withOpacity(0.2),
                    ),
                    minimumSize: MaterialStateProperty.all<Size>(
                      Size(
                          double.infinity, 50), // Ancho máximo y altura deseada
                    ),
                  ),
                  onPressed: () {
                    _formKey.currentState!.validate();
                  },
                  child: Text(
                    'Regístrate',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.0,
                      fontFamily: 'PT Sans',
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
