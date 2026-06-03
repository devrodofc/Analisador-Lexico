import java.io.FileReader;
import java.io.FileNotFoundException;
import lexer.Lexer;
import parser.parser; // Importa a classe gerada pelo JCup

public class Main {
    public static void main(String[] args) {
        System.out.println("======================================");
        System.out.println("  Iniciando Compilador Front-End      ");
        System.out.println("======================================");

        try {
            // 1. Abrir o ficheiro de código-fonte
            // O Java vai procurar este ficheiro na raiz do projeto
            FileReader arquivo = new FileReader("input.txt");
            System.out.println("[INFO] Arquivo input.txt carregado com sucesso.\n");
            
            // 2. Instanciar o Analisador Léxico (Scanner) 
            // O Lexer recebe o arquivo como fluxo de leitura
            Lexer scanner = new Lexer(arquivo);
            
            // 3. Instanciar o Analisador Sintático (Parser)
            // O Parser recebe o Scanner como parâmetro para poder "puxar" os tokens
            parser analisadorSintatico = new parser(scanner);
            
            // 4. Iniciar o processo de Análise (O Pipeline)
            // O método parse() é o gatilho que inicia as chamadas ao next_token()
            analisadorSintatico.parse();
            
            System.out.println("\n[INFO] Compilacao finalizada com sucesso!");
            
        } catch (FileNotFoundException e) {
            System.err.println("\n[ERRO] Arquivo input.txt não encontrado! Certifique-se de que ele esta na raiz do projeto.");
        } catch (Exception e) {
            System.err.println("\n[ERRO] Falha durante a compilacao: " + e.getMessage());
            // Imprime o rastro do erro para facilitar o debug (útil para alunos e engenheiros)
            e.printStackTrace(); 
        }
    }
}