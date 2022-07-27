import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PageGuardWidget extends StatefulWidget {
  final RouteGuard guard;
  final Module module;
  final Widget? child;
  const PageGuardWidget(
      {Key? key, required this.guard, required this.module, this.child})
      : super(key: key);

  @override
  PageGuardWidgetState createState() => PageGuardWidgetState();
}

class PageGuardWidgetState extends State<PageGuardWidget> {
  late Future<bool> guardFuture;
  late Future<bool> algo;

  @override
  void initState() {
    super.initState();
    // ignore: todo
    //TODO: Mover o guard para o módulo quando resolver o bug do modular
    guardFuture = Future.value(widget.guard.canActivate(Modular.to.path,
        ParallelRoute(name: widget.module.routes.first.parent)));
    guardFuture.then((canActivate) {
      if (!canActivate) Modular.to.navigate(widget.guard.redirectTo!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: guardFuture,
      builder: (context, guardSnapshot) {
        return widget.child ?? Container();
      },
    );
  }
}
