import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Receitas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<Map<String, String>> receitas = const [
   {
      'imagem': 'https://img.band.uol.com.br/image/2023/11/24/penne-a-bolonhesa-de-linguica-toscana-13659.png',
      'nome': 'Macarrão à Bolonhesa',
      'descricao': 'Uma deliciosa receita italiana com molho de carne.',
    },
    {
      'imagem': 'https://recipesblob.oetker.com.br/assets/a81bc035eb7f407faaa2c93e04edaf78/750x910/bolo-de-aniversrio-de-chocolate.jpg',
      'nome': 'Bolo de Chocolate',
      'descricao': 'Um bolo fofinho e úmido coberto com chocolate cremoso.',
    },
    {
      'imagem': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrYYhIZarIDimCI8iYHdJ_vZePMdkJ7vXA9w&s',
      'nome': 'Salada Caesar',
      'descricao': 'Uma salada refrescante com molho especial.',
    },
    {
      'imagem': 'https://recipesblob.oetker.com.br/assets/a81bc035eb7f407faaa2c93e04edaf78/750x910/bolo-de-aniversrio-de-chocolate.jpg',
      'nome': 'Bolo de Chocolate',
      'descricao': 'Um bolo fofinho e úmido coberto com chocolate cremoso.',
    },
    {
      'imagem': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrYYhIZarIDimCI8iYHdJ_vZePMdkJ7vXA9w&s',
      'nome': 'Salada Caesar',
      'descricao': 'Uma salada refrescante com molho especial.',
    },
    {
      'imagem': 'https://recipesblob.oetker.com.br/assets/a81bc035eb7f407faaa2c93e04edaf78/750x910/bolo-de-aniversrio-de-chocolate.jpg',
      'nome': 'Bolo de Chocolate',
      'descricao': 'Um bolo fofinho e úmido coberto com chocolate cremoso.',
    },
    {
      'imagem': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrYYhIZarIDimCI8iYHdJ_vZePMdkJ7vXA9w&s',
      'nome': 'Salada Caesar',
      'descricao': 'Uma salada refrescante com molho especial.',
    },
     {
      'imagem': 'https://img.band.uol.com.br/image/2023/11/24/penne-a-bolonhesa-de-linguica-toscana-13659.png',
      'nome': 'Macarrão à Bolonhesa',
      'descricao': 'Uma deliciosa receita italiana com molho de carne.',
    },
    {
      'imagem': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrYYhIZarIDimCI8iYHdJ_vZePMdkJ7vXA9w&s',
      'nome': 'Salada Caesar',
      'descricao': 'Uma salada refrescante com molho especial.',
    },
     {
      'imagem': 'https://img.band.uol.com.br/image/2023/11/24/penne-a-bolonhesa-de-linguica-toscana-13659.png',
      'nome': 'Macarrão à Bolonhesa',
      'descricao': 'Uma deliciosa receita italiana com molho de carne.',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Receitas Deliciosas'),
        backgroundColor: Colors.deepOrange,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Escolha sua Receita Favorita!',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.deepOrange),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(10.0),
              itemCount: receitas.length,
              itemBuilder: (context, index) {
                final receita = receitas[index];
                return AnimatedListItem(
                  child: Card(
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    color: Colors.orange.shade50,
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(10),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          receita['imagem']!,
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(
                        receita['nome']!,
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.deepOrange),
                      ),
                      subtitle: Text(receita['descricao']!),
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            transitionDuration: const Duration(milliseconds: 500),
                            pageBuilder: (_, __, ___) => DetalhesScreen(receita: receita),
                            transitionsBuilder: (_, animation, __, child) {
                              return ScaleTransition(
                                scale: animation,
                                child: child,
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class AnimatedListItem extends StatefulWidget {
  final Widget child;

  const AnimatedListItem({super.key, required this.child});

  @override
  _AnimatedListItemState createState() => _AnimatedListItemState();
}

class _AnimatedListItemState extends State<AnimatedListItem> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: _animation,
      child: widget.child,
    );
  }
}

class DetalhesScreen extends StatefulWidget {
  final Map<String, String> receita;

  const DetalhesScreen({super.key, required this.receita});

  @override
  _DetalhesScreenState createState() => _DetalhesScreenState();
}

class _DetalhesScreenState extends State<DetalhesScreen> with SingleTickerProviderStateMixin {
  late AnimationController _rotateController;

  @override
  void initState() {
    super.initState();
    _rotateController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _rotateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.receita['nome']!),
        backgroundColor: Colors.deepOrange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(
                widget.receita['imagem']!,
                width: double.infinity,
                height: 400,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              widget.receita['nome']!,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.deepOrange),
            ),
            const SizedBox(height: 8),
            Text(
              widget.receita['descricao']!,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
      floatingActionButton: AnimatedBuilder(
        animation: _rotateController,
        builder: (_, child) {
          return Transform.rotate(
            angle: _rotateController.value * 2 * pi,
            child: child,
          );
        },
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.deepOrange,
          child: const Icon(Icons.favorite),
        ),
      ),
    );
  }
}