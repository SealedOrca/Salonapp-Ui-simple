import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class ComingSoonPage extends StatefulWidget {
  @override
  _ComingSoonPageState createState() => _ComingSoonPageState();
}

class _ComingSoonPageState extends State<ComingSoonPage> {
  Artboard? _artboard;
  RiveAnimationController? _animationController;

  @override
  void initState() {
    super.initState();
    _loadRiveFile();
  }

  Future<void> _loadRiveFile() async {
    final data = await rootBundle.load('assets/coming_soon.riv');
    final file = RiveFile.import(data);
    setState(() {
      _artboard = file.mainArtboard;
      _animationController = SimpleAnimation('Animation1');
      _artboard?.addController(_animationController!);
    });
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coming Soon'),
      ),
      body: Center(
        child: _artboard != null
            ? Rive(
                artboard: _artboard!,
                fit: BoxFit.cover,
              )
            : const CircularProgressIndicator(),
      ),
    );
  }
}
