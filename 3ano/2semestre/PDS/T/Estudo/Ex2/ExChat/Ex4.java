public class ShoppingCart { /* ... */ }
public class ProductDAO { /* ... (acesso a dados do produto) ... */ }

      
// 1. Criar um Controller (Pure Fabrication)
public class ProductController {
    private ShoppingCart cart;
    private ProductDAO dao;

    public ProductController(ShoppingCart cart, ProductDAO dao) {
        this.cart = cart;
        this.dao = dao;
    }

    public void addProductToCart(Product product) {
        cart.addItem(product);
        dao.updateStock(product.getId(), -1);
    }
}

// 2. A View apenas delega a ação para o Controller
public class ProductView extends JFrame {
    private JButton addToCartButton;
    private Product currentProduct;
    private ProductController controller; // A View tem uma referência ao Controller

    public ProductView(ProductController controller) {
        this.controller = controller;
        // ... inicialização da UI ...
        addToCartButton.addActionListener(e -> {
            // A única responsabilidade da UI é chamar o controller
            controller.addProductToCart(currentProduct);
            JOptionPane.showMessageDialog(this, "Produto adicionado!");
        });
    }
}


/*Foi introduzido um Controller, que atua como intermediário entre a UI e o domínio.
 A ProductView agora tem alta coesão, focando-se apenas na apresentação.
  A lógica de negócio está encapsulada no ProductController, que pode ser testado e reutilizado independentemente da UI.
   Esta separação de responsabilidades é a essência do padrão Controller. */


//Não percebi muito bem