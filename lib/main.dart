// Flutter Dio HTTP 客户端
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: DioHome());
  }
}

class DioHome extends StatefulWidget {
  const DioHome({super.key});

  @override
  State<DioHome> createState() => _DioHomeState();
}

class _DioHomeState extends State<DioHome> {
  Object? _payload;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final dio = Dio();
    try {
      final res = await dio.get<Map<String, dynamic>>(
        'https://jsonplaceholder.typicode.com/posts/1',
      );
      setState(() {
        _payload = res.data;
        _loading = false;
      });
    } catch (e) {
      setState(() {
        _payload = e.toString();
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dio')),
      body: Center(
        child: _loading
            ? const CircularProgressIndicator()
            : SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: SelectableText('$_payload'),
              ),
      ),
    );
  }
}
