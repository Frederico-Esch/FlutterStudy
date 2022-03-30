import 'package:carona_teste/components/card_navigation.dart';
import 'package:carona_teste/components/list_carona.dart';
import 'package:carona_teste/model/carona.dart';
import 'package:carona_teste/utils/app_categories.dart';
import 'package:carona_teste/utils/database_controller.dart';
import 'package:carona_teste/utils/type_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CaronaScreen extends StatefulWidget {
  const CaronaScreen({Key? key}) : super(key: key);

  @override
  State<CaronaScreen> createState() => _CaronaScreenState();
}

class _CaronaScreenState extends State<CaronaScreen> {
  List<Carona> _caronas = [];
  late final TypeController _typeController;
  String screenTitle = "Loading";
  Widget body = const Text("Loading");

  @override
  void dispose() {
    _typeController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _typeController = context.read<TypeController>();

    _typeController.addListener(() {
      _loadCaronas().then((_) => setState(() {}));
      switch (_typeController.type) {
        case CaronaType.capob:
          screenTitle = "CAP - Ouro Branco";
          body = ListCarona(
            key: UniqueKey(),
            caronas: _caronas.where((carona) => !carona.indoProCap).toList(),
            reload: () => _loadCaronas().then((_) => _typeController.notify()),
          );
          break;
        case CaronaType.obcap:
          screenTitle = "Ouro Branco - CAP";
          body = ListCarona(
            key: UniqueKey(),
            caronas: _caronas.where((carona) => carona.indoProCap).toList(),
            reload: () => _loadCaronas().then((_) => _typeController.notify()),
          );
          break;
        case CaronaType.oferecer:
          screenTitle = "Oferecer Carona";
          body = const Text("Oferecer");
          break;
        default:
          screenTitle = "Loading";
          body = const Text("Loading");
      }
    });
    _loadCaronas().then((_) => _typeController.notify());
    super.initState();
  }

  Future<void> _loadCaronas() async {
    _caronas = await DataBaseController.caronas;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(screenTitle),
        centerTitle: true,
      ),
      body: body,
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            DrawerHeader(
              child: Container(
                color: Colors.grey,
              ),
            ),
            CardNavigation(category: Categories.Logar, inDrawer: true),
            CardNavigation(
              category: Categories.CAPOB,
              inDrawer: true,
              disabled: _typeController.type == CaronaType.capob,
              navigate: false,
            ),
            CardNavigation(
              category: Categories.OBCAP,
              inDrawer: true,
              disabled: _typeController.type == CaronaType.obcap,
              navigate: false,
            ),
            CardNavigation(
              category: Categories.CARONA,
              inDrawer: true,
              disabled: _typeController.type == CaronaType.oferecer,
              navigate: false,
            ),
          ],
        ),
      ),
    );
  }
}
