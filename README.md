# Compilador - Analisador Léxico
## Aspectos Teóricos da Computação - 2026.1

Um compilador didático que implementa análise léxica e sintática, desenvolvido como projeto acadêmico na Universidade de Fortaleza (Unifor).

---

## 📋 Descrição

Este projeto implementa um **compilador** com as seguintes etapas:
- **Análise Léxica**: Tokenização do código-fonte usando JFlex
- **Análise Sintática**: Parsing dos tokens usando CUP (Java-based Compiler Compiler)

O projeto é desenvolvido em **Java** e utiliza ferramentas de geração de analisadores léxicos e sintáticos.

---

## 📁 Estrutura do Projeto

```
.
├── input.txt                      # Arquivo de entrada para análise
├── README.md                      # Este arquivo
├── gen/                          # Arquivos gerados automaticamente
│   ├── lexer/
│   │   └── Lexer.java           # Analisador léxico gerado
│   └── parser/
│       ├── parser.java           # Analisador sintático gerado
│       └── sym.java              # Símbolos e terminais
├── lib/                          # Bibliotecas externas
│   └── java-cup-11b.jar          # Java CUP library
│   └── jflex.jar                  # JFlex library (v1.9.1)
├── src/                          # Código-fonte
│   ├── Main.java                 # Classe principal
│   ├── lexer/
│   │   └── scanner.flex          # Especificação do analisador léxico (JFlex)
│   └── parser/
│       └── parser.cup            # Especificação do analisador sintático (CUP)
└── out/                          # Arquivos compilados (.class)
```

---

## 🔧 Pré-requisitos

- **Java JDK** 8 ou superior instalado e configurado no PATH (`java` e `javac`).
- **JFlex** - Gerador de analisadores léxicos
- **CUP** - Java-based Compiler Compiler (já incluído em `lib/`)

---

## 🛠️ Como Compilar

### 1. Preparar os Diretórios
O JCup e o compilador Java precisam que as pastas de destino existam previamente:
```powershell
mkdir gen\parser
mkdir out

### 2. Gerar o analisador léxico (JFlex)
```bash
jflex src/lexer/scanner.flex -d gen/lexer/
```

### 3. Gerar o analisador sintático (CUP)
```bash
java -jar lib/java-cup-11b.jar -destdir gen/parser/ src/parser/parser.cup
```

### 4. Compilar o código Java
```bash
javac -d out -cp "gen/lexer;gen/parser;lib/java-cup-11b.jar;src" src/Main.java
```

---

## ▶️ Como Executar

### Executar o compilador
```bash
java -cp "out;lib/java-cup-11b.jar" Main < input.txt
```

Ou, se o arquivo de entrada estiver especificado no programa:
```bash
java -cp "out;lib/java-cup-11b.jar" Main
```

---

## 📚 Tecnologias Utilizadas

| Ferramenta | Versão | Descrição |
|-----------|--------|----------|
| **Java** | 8+ | Linguagem de programação |
| **JFlex** | - | Gerador de analisadores léxicos |
| **CUP** | 11b | Java-based Compiler Compiler |

---

## 📝 Notas Importantes

- Os arquivos em `gen/` são gerados automaticamente a partir de `src/lexer/scanner.flex` e `src/parser/parser.cup`
- Não modifique manualmente os arquivos gerados
- O arquivo `input.txt` contém o código-fonte a ser analisado
- Os arquivos compilados são armazenados em `out/`

---

## 📖 Referências

- [JFlex Documentation](https://jflex.de/)
- [CUP Parser Generator](https://mvnrepository.com/artifact/com.github.vbmacher/java-cup/11b)
- [Java Documentation](https://docs.oracle.com/javase/tutorial/)

---

## 👤 Autor

Rodrigo Morais Herrmann
Desenvolvido como projeto acadêmico para a disciplina de Aspectos Teóricos da Computação - Unifor 2026.1
