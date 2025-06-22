/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package putrimarket.koneksi;

import java.sql.*;

/**
 *
 * @author tobis
 */
public class koneksi {
    private Connection koneksi;
    private final String DATABASE_NAME = "putri_market";
    private final String DATABASE_USER = "root";
    private final String DATABASE_PASSWORD = "";
    public Connection connect() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Berhasil Connect Driver"); 
        } catch (ClassNotFoundException e) {
            System.out.println("Gagal Menemukan Driver MYSQL!");
        }
        
        String url = "jdbc:mysql://localhost/" + DATABASE_NAME;
        try {
            koneksi = DriverManager.getConnection(url, DATABASE_USER, DATABASE_PASSWORD);
            System.out.println("Berhasil Connect ke Database");
        } catch (SQLException e) {
            System.out.println("Gagal Connect ke Database. Error :: " + e);
        }
        return koneksi;
    }
}
