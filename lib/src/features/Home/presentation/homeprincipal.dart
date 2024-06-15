import 'package:flutter/material.dart';
import 'package:yachay/src/features/Home/presentation/cursos_list.dart';
import 'package:yachay/src/features/MisCursos/presentation/miscursos.dart';
import 'package:yachay/src/features/perfil/presentation/perfil.dart';

class HomePrincipal extends StatefulWidget {
  const HomePrincipal({super.key});

  @override
  State<HomePrincipal> createState() => _HomePrincipalState();
}

class _HomePrincipalState extends State<HomePrincipal> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: const Color(0xffe1e1e2c),
          appBar: AppBar(
            backgroundColor: const Color(0xff2a2c3e),
            leading: Padding(
              padding: const EdgeInsets.all(10),
              child: Image.asset('assets/istotipo-yanachay.png'),
            ), // Nuevo widget leading

            actions: const [
              Padding(
                padding: EdgeInsets.all(10),
                child: Icon(
                  Icons.shopping_cart,
                  color: Color(0xFF6B6D7F),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Icon(
                  Icons.notifications,
                  color: Color(0xFF6B6D7F),
                ),
              ),
            ],
          ),
          body: _buildBody(),
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: const Color(0xff2a2c3e), // Color de fondo
            ),
            child: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.menu_book),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.insert_chart_outlined),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: CircleAvatar(
                    radius: 12,
                    backgroundImage: NetworkImage(
                        'https://googleflutter.com/sample_image.jpg'), // Reemplaza con la ruta a tu imagen
                  ),
                  label: '',
                ),
              ],
              currentIndex: _selectedIndex,
              onTap: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              showSelectedLabels:
                  false, // No mostrar labels seleccionados
              showUnselectedLabels:
                  false, // No mostrar labels no seleccionados
            ),
          ),
        ));
  }

  Widget _buildBody() {
    switch (_selectedIndex) {
      case 0:
        return const Center(
          child: CursosList(),
        ); // Reemplaza con tu vista
      case 1:
        return const Center(
          child: MisCursos(),
        ); // Reemplaza con tu vista
      case 2:
        return const Center(
          child:
              Text('vista 3', style: TextStyle(color: Colors.white)),
        ); // Reemplaza con tu vista
      case 3:
        return const Center(
          child:
              Text('Perfil', style: TextStyle(color: Colors.white)),
        ); // Reemplaza con tu vista
      default:
        return const Center(
          child: Text('VistaDefecto',
              style: TextStyle(color: Colors.white)),
        ); // Reemplaza con tu vista
    }
  }
}
