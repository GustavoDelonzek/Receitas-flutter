import 'package:flutter/material.dart';

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
                return Card(
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
                        MaterialPageRoute(
                          builder: (context) => DetalhesScreen(receita: receita),
                        ),
                      );
                    },
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

class DetalhesScreen extends StatelessWidget {
  final Map<String, String> receita;

  const DetalhesScreen({super.key, required this.receita});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(receita['nome']!),
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
                receita['imagem']!,
                width: double.infinity,
                height: 400,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              receita['nome']!,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.deepOrange),
            ),
            const SizedBox(height: 8),
            Text(
              receita['descricao']!,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
