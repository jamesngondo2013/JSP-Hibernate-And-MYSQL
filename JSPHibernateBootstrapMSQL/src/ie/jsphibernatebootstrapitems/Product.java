/**
 * 
 */
package ie.jsphibernatebootstrapitems;

/**
 * @author james.ngondo
 *
 */
public class Product {

    private int productId;
    private String productName;
    private double productPrice;
    private int productQty;
    
    public Product ()
    {
        
    }
    
    

    public Product (String productName, double productPrice, int productQty)
    {
        super();
        this.productName = productName;
        this.productPrice = productPrice;
        this.productQty = productQty;
    }



    public int getProductId ()
    {
        return productId;
    }

    public void setProductId (int productId)
    {
        this.productId = productId;
    }

    public String getProductName ()
    {
        return productName;
    }

    public void setProductName (String productName)
    {
        this.productName = productName;
    }

    public double getProductPrice ()
    {
        return productPrice;
    }

    public void setProductPrice (double productPrice)
    {
        this.productPrice = productPrice;
    }

    public int getProductQty ()
    {
        return productQty;
    }

    public void setProductQty (int productQty)
    {
        this.productQty = productQty;
    }

    @Override
    public String toString ()
    {
        return "Product [productId=" + productId + ", productName=" + productName + ", productPrice=" + productPrice + ", productQty=" + productQty + "]";
    }
    
    
    
}
