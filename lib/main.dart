import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app_v1/config/theme/app_theme.dart';
import 'package:yes_no_app_v1/presentation/providers/chat_provider.dart';
import 'package:yes_no_app_v1/presentation/screens/chat/chat_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Donde tengo el guión bajo se coloca el context. En este caso, sin embargo, como no lo necesito
        // coloco el guión bajo en su lugar. Podemos hacerlo siempre que no necesitemos usar el context, ya que
        // por fuerza necesitamos pasar el argumento.
        ChangeNotifierProvider(create: (_) => ChatProvider())
      ],
      child: MaterialApp(
          title: 'Material App',
          debugShowCheckedModeBanner: false,
          theme: AppTheme(selectedColor: 6).theme(),
          home: const ChatScreen()),
    );
  }
}
