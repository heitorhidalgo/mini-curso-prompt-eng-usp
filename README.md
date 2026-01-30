# 🐛 Caça aos Bugs - Flutter Edition

Bem-vindo ao exercício prático de **Debugging e Refatoração** em Flutter. Este projeto foi criado como parte de um mini-curso de Prompt Engineering, com o objetivo de identificar e corrigir erros comuns no desenvolvimento mobile.

## 📋 Sobre o Projeto

O aplicativo simula um cenário real onde um desenvolvedor se depara com um código "quebrado". O objetivo foi analisar o código, identificar falhas e aplicar as correções adequadas.

**Os desafios enfrentados e resolvidos foram:**
1.  **Erro de Sintaxe:** Falta de pontuação bloqueando a compilação.
2.  **Erro de Lógica (Estado):** A tela não atualizava ao alterar variáveis.
3.  **Erro de Layout (Overflow):** Texto longo quebrando a visualização da tela.

## 🚀 Tecnologias Utilizadas

* [Flutter](https://flutter.dev/) - Framework UI do Google.
* [Dart](https://dart.dev/) - Linguagem de programação.
* **Material Design** - Padrão visual.

## 🛠️ Soluções Aplicadas

Para tornar o código funcional e robusto, as seguintes correções foram implementadas:

### 1. Gerenciamento de Estado
Utilizamos o `setState(() {})` para notificar o Flutter de que a variável `_likes` foi alterada, forçando a reconstrução da UI para exibir o novo valor.

### 2. Layout Responsivo
Envolvemos o widget de texto em um `Expanded` dentro da `Row`. Isso garante que o texto respeite os limites da tela e quebre a linha automaticamente, evitando o erro de *RenderFlex overflow*.

## 📦 Como Executar

Para rodar este projeto na sua máquina local:

1.  **Clone o repositório** (se ainda não o fez).
2.  **Baixe as dependências:**
    ```bash
    flutter pub get
    ```
3.  **Execute o app:**
    ```bash
    flutter run
    ```

---
*Desenvolvido durante a jornada de aprendizado em Prompt Engineering.*