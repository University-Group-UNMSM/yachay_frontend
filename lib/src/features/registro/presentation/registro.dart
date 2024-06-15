// ignore_for_file: unused_field
import 'package:flutter/material.dart';

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
      backgroundColor: Color.fromARGB(255, 30, 30, 44),
      body: ListView(
        padding: const EdgeInsets.symmetric(
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
                  child: Image.asset('assets/isotipo-azul.png'),
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Registrarte',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Open Sans',
                      fontSize: 36.0,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '¿Cuál es tu función?',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'PT Sans',
                      fontSize: 14.0,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: TextButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors
                                    .transparent), // Botón transparente
                            overlayColor: MaterialStateProperty.all<Color>(
                                Colors.white.withOpacity(
                                    0.2)), // Color de superposición al presionar
                            side:
                                MaterialStateProperty.all<BorderSide>(
                              const BorderSide(
                                  color: Colors.white,
                                  width: 2), // Bordes blancos
                            ),
                            padding: MaterialStateProperty.all<
                                EdgeInsetsGeometry>(
                              const EdgeInsets.symmetric(
                                  vertical: 20.0,
                                  horizontal:
                                      50.0), // Ajuste del tamaño del botón
                            ),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)))),
                        onPressed: () {},
                        child: const Text(
                          'Estudiante',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                            fontFamily: 'PT Sans',
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors
                                    .transparent), // Botón transparente
                            overlayColor: MaterialStateProperty.all<Color>(
                                Colors.white.withOpacity(
                                    0.2)), // Color de superposición al presionar
                            side:
                                MaterialStateProperty.all<BorderSide>(
                              const BorderSide(
                                  color: Colors.white,
                                  width: 2), // Bordes blancos
                            ),
                            padding: MaterialStateProperty.all<
                                EdgeInsetsGeometry>(
                              const EdgeInsets.symmetric(
                                  vertical: 20.0, horizontal: 50.0),
                            ),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)))),
                        onPressed: () {},
                        child: const Text(
                          'Profesor',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                            fontFamily: 'PT Sans',
                          ),
                        ),
                      ),
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
                            'Nombre',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.0,
                              fontFamily: 'PT Sans',
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            style: const TextStyle(
                                color: Colors.white, height: 1),
                            enableInteractiveSelection: true,
                            autofocus: true,
                            textCapitalization:
                                TextCapitalization.characters,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: const Color.fromRGBO(
                                  52, 54, 70, 100),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(12),
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
                    const SizedBox(
                        width:
                            10), // Espacio entre los campos de nombre y apellido
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Apellido',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.0,
                              fontFamily: 'PT Sans',
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            style: const TextStyle(
                                color: Colors.white, height: 1),
                            enableInteractiveSelection: true,
                            autofocus: true,
                            textCapitalization:
                                TextCapitalization.characters,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: const Color.fromRGBO(
                                  52, 54, 70, 100),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(12),
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
                const SizedBox(height: 15),
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
                      style: const TextStyle(
                          color: Colors.white, height: 1),
                      enableInteractiveSelection: false,
                      autofocus: true,
                      textCapitalization:
                          TextCapitalization.characters,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor:
                            const Color.fromRGBO(52, 54, 70, 100),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingresa tu correo electrónico';
                        }
                        // Validación de correo electrónico usando una expresión regular
                        bool isValidEmail = RegExp(
                                r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
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
                            style: const TextStyle(
                                color: Colors.white, height: 1),
                            obscureText: true,
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
                                    BorderRadius.circular(12),
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
                            onChanged: (value) {
                              _contrasena = value;
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                        width:
                            10), // Espacio entre los campos de nombre y apellido
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Repetir contraseña',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.0,
                              fontFamily: 'PT Sans',
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            style: const TextStyle(
                                color: Colors.white, height: 1),
                            obscureText: true,
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
                                    BorderRadius.circular(12),
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
                            onChanged: (value) {
                              _repeticionContrasena = value;
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                CheckboxListTile(
                  title: const Text(
                    'Al registrarme acepto los términos y condiciones y la política de privacidad de OnlyCourses.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11.0,
                      fontFamily: 'PT Sans',
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 0, vertical: 0),
                  controlAffinity: ListTileControlAffinity.leading,
                  value: _aceptaTerminos,
                  onChanged: (newValue) {
                    setState(() {
                      _aceptaTerminos = newValue!;
                    });
                  },
                ),
                const SizedBox(height: 15),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.blue,
                    ),
                    overlayColor: MaterialStateProperty.all<Color>(
                      Colors.white.withOpacity(0.2),
                    ),
                    minimumSize: MaterialStateProperty.all<Size>(
                      const Size(double.infinity,
                          50), // Ancho máximo y altura deseada
                    ),
                  ),
                  onPressed: () {
                    _formKey.currentState!.validate();
                  },
                  child: const Text(
                    'Registrarse',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                      fontFamily: 'PT Sans',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  '¿Ya tienes una cuenta? Inicia sesión',
                  style: TextStyle(color: Colors.white),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  child: const Text(
                    'desde aquí',
                    style: TextStyle(color: Colors.blue),
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
