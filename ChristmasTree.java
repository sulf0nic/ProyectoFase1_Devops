import java.util.Random;

public class ChristmasTree {
    public static void main(String[] args) {
        
        int height = 10; // Altura fija del árbol de Navidad
        Random random = new Random();
        System.out.print("Programa de arbol de navidad ")
        // Dibujar la parte superior del árbol
        for (int i = 1; i <= height; i++) {
            for (int j = height; j > i; j--) {
                System.out.print(" ");
            }
            for (int k = 1; k <= (2 * i - 1); k++) {
                // 20% de probabilidad de colocar una esfera
                if (random.nextDouble() < 0.2) {
                    System.out.print("O");
                } else {
                    System.out.print("*");
                }
            }
            System.out.println();
        }
        
        // Dibujar el tronco del árbol
        for (int i = 1; i <= height / 3; i++) {
            for (int j = 1; j < height; j++) {
                System.out.print(" ");
            }
            System.out.println("*");
        }
    }
}
