package ie.hibernateutils.org;

import java.sql.DriverManager;
import java.sql.Connection;
import org.hibernate.cfg.Configuration;
import org.hibernate.SessionFactory;

public class DBConnUtils {
    
    private static SessionFactory factory = null;
    private static Configuration conf = null;

    /*public static void main (String[] args)
    {
        Connection conn = null;
        
        try {
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsphibernate", "root", "admin");
            if (conn!=null) {
                System.out.println("Connection successful");
            }
        }
        catch (Exception e) {
            System.out.println("Connection not successful");
        }

    }*/
    
    private static SessionFactory buildSessionFactory(){
        
        try {
            
            conf = new Configuration();
            conf.configure("hibernate.cfg.xml");
            System.out.println("Configuration Loaded successfully...");
            
            factory = conf.buildSessionFactory();
            System.out.println("SessionFactory Loaded successfully...");
            
            return factory;
        }
        catch (Throwable e) {
            System.err.println("Session creation failed");
            e.printStackTrace();
            
            throw new ExceptionInInitializerError(e);
            
        }
    }
    
    public static SessionFactory getSessionFactory(){
        
        if (factory == null) //{
            factory = buildSessionFactory();
            
            //return factory;
       // }
        return factory;
    }

}
