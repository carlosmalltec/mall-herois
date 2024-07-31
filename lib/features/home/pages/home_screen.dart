import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:malltec_heroes/components/styles/const_colors.dart';
import 'package:malltec_heroes/constants/const_pages.dart';
import '../controllers/home_controllers.dart';

import '../../../components/no_has_data/error_list_data.dart';
import '../../../components/no_has_data/no_has_data.dart';
import '../../../helpers/enums/type_states.dart';
import '../components/list_heroes.dart';
import '../components/shimmer_list_heroes.dart';

class HomeScreen extends StatefulWidget {
  final HomeControllers controller;
  const HomeScreen({super.key, required this.controller});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeControllers get _controller => widget.controller;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _controller.getHeroes();
      await _controller.checkRequestStorage();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ConstColors.blueStrong,
        title: const Text(
          'Cadastro de Heróis',
          style: TextStyle(
              color: ConstColors.blueWhite, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.add_outlined,
              color: ConstColors.blueWhite,
              size: 35,
            ),
            tooltip: 'novo cadastro',
            onPressed: () => Modular.to.navigate(ConstPages.registerHeroesPage),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async => await _controller.getHeroes(),
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AnimatedBuilder(
                animation: _controller,
                builder: (context, Widget? widget) {
                  if (_controller.loadingStates == TypeStates.loading) {
                    return const ShimmerListHeroes();
                  }
                  if (_controller.loadingStates == TypeStates.notHasData) {
                    return const Center(child: NotHasData());
                  }
                  if (_controller.loadingStates == TypeStates.errorData) {
                    return Center(
                        child: ErrorListData(
                      description: _controller.errorListData,
                    ));
                  }
                  return Expanded(
                    child: ListViewSeparatedHeroes(
                        onChangeValue: (d) {},
                        listData: _controller.listHeroes),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
