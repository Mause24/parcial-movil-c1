import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _onNavigate(BuildContext context, String route) {
    context.push(route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 20,
            children: [
              ElevatedButton(
                onPressed: () => _onNavigate(context, "/first"),
                child: Text("First View"),
              ),
              ElevatedButton(
                onPressed: () => _onNavigate(context, "/second"),
                child: Text("Second View"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
