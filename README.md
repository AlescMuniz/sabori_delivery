# Sabori Delivery — Primeira entrega (Flutter)

Protótipo acadêmico de um aplicativo de delivery desenvolvido **somente com Flutter**, sem backend, sem banco de dados e sem compras reais.

## O que foi implementado

- Tela inicial inspirada nos dois esboços da atividade, com rolagem vertical.
- Cabeçalho com local de entrega, botão de alteração de endereço e carrinho.
- Título de boas-vindas e campo de pesquisa.
- Banner de promoção personalizado.
- Categorias horizontais com ícones.
- Lista de produtos com imagem, restaurante, avaliação, tempo de entrega, preço e botão **Adicionar**.
- Menu inferior com Início, Buscar, Pedidos e Perfil.
- Conteúdo fictício, em português, e identidade visual exclusiva **Sabori Delivery**.

### Demonstrações locais (sem backend)

A pesquisa filtra os produtos no próprio aplicativo. As categorias filtram por tipo de comida. O botão **Adicionar** registra os itens em memória, e o botão **Carrinho** mostra um resumo demonstrativo. Alterar endereço oferece locais fictícios. Pedidos e Perfil mostram mensagens de protótipo. Nada é transmitido ou salvo em servidores.

## Como abrir no VS Code

É necessário ter o **Flutter SDK** instalado e configurado, além de um emulador Android ou dispositivo compatível. Abra um terminal **dentro da pasta `sabori_delivery`** e execute:

```bash
flutter create . --platforms=android,web
flutter pub get
flutter run
```

> `flutter create .` cria apenas as estruturas nativas padrão do Flutter que não estão incluídas no arquivo ZIP (como `android/` e `web/`). O arquivo `lib/main.dart` e os recursos visuais já estão prontos. Não use `--overwrite`.

Para rodar no navegador, você também pode usar:

```bash
flutter run -d chrome
```

Para verificar o código:

```bash
flutter analyze
```

**Estrutura principal**

```text
sabori_delivery/
├── lib/
│   └── main.dart           # Layout, dados fictícios e ações locais
├── assets/
│   └── images/             # 7 ilustrações PNG incluídas no projeto
├── pubspec.yaml            # Configuração Flutter e assets
├── analysis_options.yaml
└── README.md
```

## Sobre os recursos visuais

As ilustrações de pratos e promoção foram criadas especialmente para este projeto, entregues dentro da pasta `assets/images`. Não precisam de internet para carregar. O projeto usa somente os recursos da biblioteca Flutter, sem pacotes de terceiros.

## Correspondência com o enunciado

| Elemento do esboço | Implementação |
| --- | --- |
| Entregar em / Alterar / Carrinho | Cabeçalho inicial |
| O que você deseja pedir? | Título e saudação |
| Buscar produto ou restaurante | Campo de pesquisa |
| Destaque / Promoção | Banner “Combo da felicidade” |
| Categorias | Cinco opções com ícones |
| Produtos em destaque | Seis produtos fictícios; quatro inicialmente visíveis |
| Rolar a tela para ver os produtos | Lista vertical rolável |
| Menu inferior com quatro ícones | Navegação inferior fixa |

---

**Observação:** o trabalho é uma interface funcional para apresentação. Backend, autenticação, pagamento, banco de dados e pedidos reais não fazem parte desta entrega.
