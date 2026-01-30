# 📱 Mini-Curso: Prompt Engineering com Flutter

Este repositório documenta a jornada prática realizada durante o mini-curso de **Prompt Engineering**, onde os desafios originais (focados em HTML/JS) foram estrategicamente **adaptados para o ecossistema Flutter**.

O objetivo foi utilizar IA Generativa para acelerar o desenvolvimento mobile, focando em boas práticas de arquitetura, Clean Code e UX.

## 🚀 Tecnologias Utilizadas
* **Flutter** (Framework UI)
* **Dart** (Linguagem)
* **Git/GitHub** (Versionamento)
* **Material Design** (Padrões Visuais)

---

## 📚 Jornada de Aprendizado

Abaixo, a evolução dos exercícios realizados, partindo do básico até formulários complexos.

### 1️⃣ Hello World Dinâmico (State Management)
* **Desafio:** Criar um botão que altera o texto da tela.
* **Conceitos Flutter:** `StatefulWidget`, `setState`, hierarquia de Widgets.
* **Adaptação:** Migração da manipulação de DOM (Web) para Reconstrução de Árvore de Widgets (Mobile).

### 2️⃣ Lista de Tarefas (List Manipulation)
* **Desafio:** Input de texto que adiciona itens em uma lista visual.
* **Conceitos Flutter:** `ListView.builder`, `TextEditingController`, Arrays dinâmicos.
* **Destaque:** Renderização eficiente de listas infinitas.

### 3️⃣ Calculadora Funcional (Logic & Layout)
* **Desafio:** Calculadora com 4 operações básicas e histórico.
* **Conceitos Flutter:** `GridView` vs `Column/Row` layouts, `Parsing` de String para Double, lógica de UX.
* **Destaque:** Layout responsivo e tratamento de concatenação de strings.

### 4️⃣ Caça aos Bugs (Debugging)
* **Desafio:** Identificar e corrigir propositalmente erros de Sintaxe, Estado e Layout.
* **Correções Aplicadas:**
    * ✅ Uso de `Expanded` para evitar *RenderFlex Overflow*.
    * ✅ Implementação correta do `setState` para atualização de tela.
    * ✅ Correção de sintaxe Dart.

### 5️⃣ Cadastro Seguro (Forms & Validation)
* **Desafio Final:** Tela de cadastro completa com validações robustas.
* **Conceitos Flutter:** `Form`, `GlobalKey<FormState>`, `TextFormField`, `RegExp`.
* **Funcionalidades:**
    * 🔒 **Senha Forte:** Exige mín. 8 caracteres, números e maiúsculas.
    * 📧 **E-mail Real:** Validação via Regex (requer domínio válido).
    * 👤 **UX:** Feedback visual com `SnackBar` e helper texts.

---

## 📦 Como executar o projeto

1.  Clone este repositório:
    ```bash
    git clone [https://github.com/SEU-USUARIO/mini-curso-prompt-eng-usp.git](https://github.com/SEU-USUARIO/mini-curso-prompt-eng-usp.git)
    ```
2.  Entre na pasta:
    ```bash
    cd mini-curso-prompt-eng-usp
    ```
3.  Baixe as dependências:
    ```bash
    flutter pub get
    ```
4.  Execute o app:
    ```bash
    flutter run
    ```

---
*Desenvolvido por Heitor Hidalgo com auxílio de IA Generativa.*