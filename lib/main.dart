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
                    onPressed: () =>
                        mostrarMensagem(context, 'Alterar endereço em breve'),
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
      bottomNavigationBar: const MenuInferior(indiceAtual: 0),
    );
  }
}

// Menu inferior usado pela página inicial e pela busca.
class MenuInferior extends StatelessWidget {
  const MenuInferior({super.key, required this.indiceAtual});

  final int indiceAtual;

  void abrirTela(BuildContext context, int indice) {
    if (indice == indiceAtual) return;

    if (indice == 0) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const PaginaInicial()),
      );
    } else if (indice == 1) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const PaginaBusca()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Tela disponível em outra etapa')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: indiceAtual,
      selectedItemColor: Colors.deepOrange,
      unselectedItemColor: Colors.grey,
      onTap: (indice) => abrirTela(context, indice),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Início'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Buscar'),
        BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long), label: 'Pedidos'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
      ],
    );
  }
}

// Dados fixos dos produtos, já que o app não tem backend.
class Produto {
  const Produto(this.nome, this.restaurante, this.preco, this.imagem,
      this.avaliacao, this.minutos, this.distanciaKm);

  final String nome;
  final String restaurante;
  final String preco;
  final String imagem;
  final double avaliacao;
  final int minutos;
  final double distanciaKm;
}

const listaProdutos = [
  Produto('Hambúrguer da casa', 'Lanche do Bairro', 'R\$ 25,90',
      'assets/images/burger.png', 4.8, 25, 1.2),
  Produto('Pizza de calabresa', 'Pizzaria Central', 'R\$ 49,90',
      'assets/images/pizza.png', 4.6, 45, 3.5),
  Produto('Combo de sushi', 'Sabor do Japão', 'R\$ 59,90',
      'assets/images/sushi.png', 4.9, 40, 4.1),
  Produto('Poke de salmão', 'Poke Natural', 'R\$ 38,00',
      'assets/images/poke.png', 4.7, 20, 1.8),
  Produto('Pastel de queijo', 'Pastelaria da Praça', 'R\$ 14,00',
      'assets/images/pastel.png', 4.3, 15, 0.8),
  Produto('Brownie de chocolate', 'Doces da Ana', 'R\$ 12,50',
      'assets/images/brownie.png', 4.9, 30, 2.6),
];

class PaginaBusca extends StatefulWidget {
  const PaginaBusca({super.key});

  @override
  State<PaginaBusca> createState() => _PaginaBuscaState();
}

class _PaginaBuscaState extends State<PaginaBusca> {
  final filtros = ['Todos', 'Próximos', 'Entrega rápida', 'Melhor avaliação'];
  String filtroAtual = 'Todos';
  String textoBusca = '';
  int bannerAtual = 0;
  final controleCarrossel = PageController(viewportFraction: 0.92);

  @override
  void dispose() {
    controleCarrossel.dispose();
    super.dispose();
  }

  void mostrarMensagem(String texto) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(texto)),
    );
  }

  // Aplica o texto digitado e o filtro escolhido na lista fixa.
  List<Produto> get resultados {
    return listaProdutos.where((produto) {
      final texto = textoBusca.toLowerCase();
      final combinaTexto = produto.nome.toLowerCase().contains(texto) ||
          produto.restaurante.toLowerCase().contains(texto);

      if (!combinaTexto) return false;
      if (filtroAtual == 'Próximos') return produto.distanciaKm <= 2;
      if (filtroAtual == 'Entrega rápida') return produto.minutos <= 25;
      if (filtroAtual == 'Melhor avaliação') return produto.avaliacao >= 4.8;
      return true;
    }).toList();
  }

  Widget criarBanner(
      String titulo, String subtitulo, String imagem, Color cor) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: cor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(titulo,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(subtitulo,
                    style: const TextStyle(color: Colors.white, fontSize: 12)),
              ],
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child:
                Image.asset(imagem, width: 90, height: 90, fit: BoxFit.cover),
          ),
        ],
      ),
    );
  }

  Widget criarFiltro(String nome) {
    final selecionado = nome == filtroAtual;
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: ChoiceChip(
        label: Text(nome),
        selected: selecionado,
        showCheckmark: false,
        selectedColor: Colors.deepOrange,
        backgroundColor: Colors.white,
        labelStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: selecionado ? Colors.white : Colors.black87,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
              color: selecionado ? Colors.deepOrange : Colors.grey.shade300),
        ),
        onSelected: (_) => setState(() => filtroAtual = nome),
      ),
    );
  }

  Widget criarResultado(Produto produto) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade300),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(produto.imagem,
                  width: 96, height: 96, fit: BoxFit.cover),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(produto.restaurante,
                      style: const TextStyle(fontSize: 11, color: Colors.grey)),
                  Text(produto.nome,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15)),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 14),
                      Text(' ${produto.avaliacao}',
                          style: const TextStyle(fontSize: 11)),
                      const SizedBox(width: 8),
                      const Icon(Icons.schedule, color: Colors.grey, size: 14),
                      Text(' ${produto.minutos} min',
                          style: const TextStyle(
                              fontSize: 11, color: Colors.grey)),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(produto.preco,
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      OutlinedButton(
                        onPressed: () => mostrarMensagem(
                            '${produto.nome} adicionado (demonstração)'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.deepOrange,
                          side: const BorderSide(color: Colors.deepOrange),
                          visualDensity: VisualDensity.compact,
                        ),
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
    final lista = resultados;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('EXPLORAR',
                  style: TextStyle(
                      fontSize: 11,
                      letterSpacing: 1.2,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange)),
              const SizedBox(height: 4),
              const Text('Buscar',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),

              // Campo de pesquisa
              TextField(
                onChanged: (texto) => setState(() => textoBusca = texto),
                decoration: InputDecoration(
                  hintText: 'Produto, categoria ou restaurante',
                  prefixIcon:
                      const Icon(Icons.search, color: Colors.deepOrange),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Carrossel de ofertas
              SizedBox(
                height: 120,
                child: PageView(
                  controller: controleCarrossel,
                  padEnds: false,
                  onPageChanged: (pagina) =>
                      setState(() => bannerAtual = pagina),
                  children: [
                    criarBanner('Combo Sabori', 'Burger + fritas por R\$ 29,90',
                        'assets/images/promo_combo.png', Colors.deepOrange),
                    criarBanner('Semana do poke', '15% off em pokes',
                        'assets/images/poke.png', Colors.teal),
                    criarBanner('Noite japonesa', 'Frete grátis no sushi',
                        'assets/images/sushi.png', Colors.redAccent),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (indice) {
                  return Container(
                    width: indice == bannerAtual ? 18 : 6,
                    height: 6,
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    decoration: BoxDecoration(
                      color: indice == bannerAtual
                          ? Colors.deepOrange
                          : Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(3),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 20),

              const Text('Filtros',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: filtros.map(criarFiltro).toList()),
              ),
              const SizedBox(height: 24),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Resultados',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text(
                      '${lista.length} ${lista.length == 1 ? 'item' : 'itens'}',
                      style: const TextStyle(
                          fontSize: 12, color: Colors.deepOrange)),
                ],
              ),
              const SizedBox(height: 12),
              if (lista.isEmpty)
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 30),
                  child: Center(
                    child: Column(
                      children: [
                        Icon(Icons.search_off, size: 48, color: Colors.grey),
                        SizedBox(height: 8),
                        Text('Nenhum produto encontrado',
                            style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ),
                ),
              ...lista.map(criarResultado),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const MenuInferior(indiceAtual: 1),
    );
  }
}
