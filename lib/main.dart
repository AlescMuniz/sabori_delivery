import 'package:flutter/material.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sabori Delivery',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const PaginaLogin(),
    );
  }
}

class PaginaLogin extends StatelessWidget {
  const PaginaLogin({super.key});

  // Mostra uma mensagem porque o aplicativo ainda é só uma interface.
  void mostrarMensagem(BuildContext context, String texto) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(texto)),
    );
  }

  // Leva para a página inicial, já que não existe login de verdade.
  void entrar(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const PaginaInicial()),
    );
  }

  Widget criarCampo(String rotulo, String dica, IconData icone,
      {bool senha = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(rotulo,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        TextField(
          obscureText: senha,
          decoration: InputDecoration(
            hintText: dica,
            prefixIcon: Icon(icone, color: Colors.deepOrange),
            suffixIcon: senha ? const Icon(Icons.visibility_off) : null,
            filled: true,
            fillColor: Colors.grey.shade100,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }

  Widget criarFoto(String imagem) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: CircleAvatar(
        radius: 22,
        backgroundColor: Colors.orange.shade100,
        backgroundImage: AssetImage(imagem),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const SizedBox(height: 16),

              // Marca
              Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(22),
                ),
                child: const Icon(Icons.delivery_dining,
                    color: Colors.white, size: 52),
              ),
              const SizedBox(height: 8),
              const Text('Sabori',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange)),
              const SizedBox(height: 20),
              const Text('Entrar',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
              const SizedBox(height: 6),
              const Text('Acesse sua conta para pedir sua comida favorita.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 13, color: Colors.grey)),
              const SizedBox(height: 14),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  criarFoto('assets/images/burger.png'),
                  criarFoto('assets/images/pizza.png'),
                  criarFoto('assets/images/sushi.png'),
                  criarFoto('assets/images/brownie.png'),
                ],
              ),
              const SizedBox(height: 28),

              // Formulário
              criarCampo('E-mail', 'Digite seu e-mail', Icons.email_outlined),
              const SizedBox(height: 16),
              criarCampo('Senha', 'Digite sua senha', Icons.lock_outline,
                  senha: true),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () => mostrarMensagem(
                      context, 'Recuperar senha disponível em outra etapa'),
                  child: const Text('Esqueci minha senha',
                      style: TextStyle(fontSize: 12)),
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () => entrar(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text('Entrar',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(height: 20),

              // Divisor "ou"
              Row(
                children: [
                  Expanded(child: Divider(color: Colors.grey.shade300)),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text('ou',
                        style: TextStyle(fontSize: 12, color: Colors.grey)),
                  ),
                  Expanded(child: Divider(color: Colors.grey.shade300)),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: OutlinedButton.icon(
                  onPressed: () => mostrarMensagem(
                      context, 'Login com Google apenas ilustrativo'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.black87,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  icon: const Text('G',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue)),
                  label: const Text('Continuar com Google',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Não tem uma conta?',
                      style: TextStyle(fontSize: 12, color: Colors.grey)),
                  TextButton(
                    onPressed: () => mostrarMensagem(
                        context, 'Cadastro disponível em outra etapa'),
                    child: const Text('Criar conta',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PaginaInicial extends StatelessWidget {
  const PaginaInicial({super.key});

  // Mostra uma mensagem porque o aplicativo ainda é só uma interface.
  void mostrarMensagem(BuildContext context, String texto) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(texto)),
    );
  }

  Widget criarCategoria(IconData icone, String nome) {
    return Column(
      children: [
        CircleAvatar(
          radius: 28,
          backgroundColor: Colors.orange.shade100,
          child: Icon(icone, color: Colors.deepOrange, size: 28),
        ),
        const SizedBox(height: 6),
        Text(nome, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget criarProduto(
    BuildContext context,
    String nome,
    String restaurante,
    String preco,
    String imagem,
  ) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: Colors.grey.shade300),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                imagem,
                width: 78,
                height: 78,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(restaurante,
                      style: const TextStyle(fontSize: 11, color: Colors.grey)),
                  Text(nome,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14)),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(preco,
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      TextButton(
                        onPressed: () => mostrarMensagem(
                            context, '$nome adicionado (demonstração)'),
                        child: const Text('Adicionar',
                            style: TextStyle(fontSize: 12)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Endereço e carrinho
              Row(
                children: [
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Entregar em',
                            style: TextStyle(fontSize: 11, color: Colors.grey)),
                        Text('Centro, São Roque',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () => mostrarMensagem(
                        context, 'Alterar endereço em breve'),
                    child: const Text('Alterar'),
                  ),
                  OutlinedButton(
                    onPressed: () => mostrarMensagem(
                        context, 'Carrinho disponível em outra etapa'),
                    child: const Text('Carrinho'),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const Text('Olá, bem-vindo ao Sabori!',
                  style: TextStyle(fontSize: 13, color: Colors.grey)),
              const SizedBox(height: 5),
              const Text('O que você deseja pedir?',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 18),

              // Campo de pesquisa
              TextField(
                decoration: InputDecoration(
                  hintText: 'Buscar produto ou restaurante',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Promoção
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.orange.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('PROMOÇÃO DA SEMANA',
                              style: TextStyle(
                                  fontSize: 11, color: Colors.deepOrange)),
                          const SizedBox(height: 5),
                          const Text('Combo de hambúrguer',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold)),
                          const Text('A partir de R\$ 29,90'),
                          const SizedBox(height: 8),
                          ElevatedButton(
                            onPressed: () => mostrarMensagem(
                                context, 'Promoção apenas ilustrativa'),
                            child: const Text('Ver promoção'),
                          ),
                        ],
                      ),
                    ),
                    Image.asset('assets/images/burger.png',
                        width: 90, height: 90, fit: BoxFit.cover),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              const Text('Categorias',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 14),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  criarCategoria(Icons.lunch_dining, 'Lanches'),
                  criarCategoria(Icons.local_pizza, 'Pizzas'),
                  criarCategoria(Icons.ramen_dining, 'Japonesa'),
                  criarCategoria(Icons.cake, 'Doces'),
                ],
              ),
              const SizedBox(height: 26),

              const Text('Produtos em destaque',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              criarProduto(context, 'Hambúrguer da casa', 'Lanche do Bairro',
                  'R\$ 25,90', 'assets/images/burger.png'),
              criarProduto(context, 'Pizza de calabresa', 'Pizzaria Central',
                  'R\$ 49,90', 'assets/images/pizza.png'),
              criarProduto(context, 'Pastel de queijo', 'Pastelaria da Praça',
                  'R\$ 14,00', 'assets/images/pastel.png'),
              criarProduto(context, 'Brownie de chocolate', 'Doces da Ana',
                  'R\$ 12,50', 'assets/images/brownie.png'),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.grey,
        onTap: (indice) {
          if (indice != 0) {
            mostrarMensagem(context, 'Tela disponível em outra etapa');
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Início'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Buscar'),
          BottomNavigationBarItem(
              icon: Icon(Icons.receipt_long), label: 'Pedidos'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),
    );
  }
}
