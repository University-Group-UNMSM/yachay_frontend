// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

final _formKey = GlobalKey<FormState>();

class MyAppRegistro extends StatefulWidget {
  const MyAppRegistro({super.key});

  @override
  State<MyAppRegistro> createState() => _MyAppRegistroState();
}

class _MyAppRegistroState extends State<MyAppRegistro> {
  String _nombre = '';
  String _apellido = '';
  String _email = '';
  String _contrasena = '';
  String _repeticionContrasena = '';
  bool _aceptaTerminos = false;
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
                  child: Image.asset('images/logo.png'),
                ),
                Text(
                  'Registrate',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Open Sans',
                    fontSize: 36.0,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  '¿Cuál es su función?',
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
                    TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.transparent), // Botón transparente
                        overlayColor: MaterialStateProperty.all<Color>(
                            Colors.white.withOpacity(
                                0.2)), // Color de superposición al presionar
                        side: MaterialStateProperty.all<BorderSide>(
                          BorderSide(
                              color: Colors.white, width: 2), // Bordes blancos
                        ),
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          EdgeInsets.symmetric(
                              vertical: 12.0,
                              horizontal: 40.0), // Ajuste del tamaño del botón
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Estudiante',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.0,
                          fontFamily: 'PT Sans',
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.transparent), // Botón transparente
                        overlayColor: MaterialStateProperty.all<Color>(
                            Colors.white.withOpacity(
                                0.2)), // Color de superposición al presionar
                        side: MaterialStateProperty.all<BorderSide>(
                          BorderSide(
                              color: Colors.white, width: 2), // Bordes blancos
                        ),
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          EdgeInsets.symmetric(
                              vertical: 12.0,
                              horizontal: 40.0), // Ajuste del tamaño del botón
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Profesor',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.0,
                          fontFamily: 'PT Sans',
                        ),
                      ),
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
                            'Nombre',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.0,
                              fontFamily: 'PT Sans',
                            ),
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            style: TextStyle(
                              color: Colors.white,
                            ),
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
                                return 'Campo obligatorio';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _nombre = value!;
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                        width:
                            10), // Espacio entre los campos de nombre y apellido
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Apellido',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.0,
                              fontFamily: 'PT Sans',
                            ),
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            style: TextStyle(
                              color: Colors.white,
                            ),
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
                                return 'Campo obligatorio';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _apellido = value!;
                            },
                          ),
                        ],
                      ),
                    ),
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
                      style: TextStyle(
                        color: Colors.white,
                      ),
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
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            obscureText: true,
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
                                return 'Ingresa una contraseña';
                              }
                              if (value.length < 6) {
                                return 'Debe tener al menos 6 caracteres';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _contrasena = value!;
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                        width:
                            10), // Espacio entre los campos de nombre y apellido
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Repetir contraseña',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.0,
                              fontFamily: 'PT Sans',
                            ),
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            obscureText: true,
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
                                return 'Repite la contraseña';
                              }
                              if (value != _contrasena) {
                                return 'Contraseñas no coinciden';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _repeticionContrasena = value!;
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                CheckboxListTile(
                  title: Text(
                    'Al registrarme acepto los términos y condiciones y la política de privacidad de OnlyCourses.',
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
