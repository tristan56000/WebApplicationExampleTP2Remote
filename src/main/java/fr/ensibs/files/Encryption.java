package fr.ensibs.files;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import java.nio.charset.StandardCharsets;
import java.util.Base64;

/**
 * Represents the AES symetric protocol used to encrypt/decrypt messages
 * @author Tristan Guerin
 * @version 1
 */
public class Encryption {

    /**
     * Encrypts a string using AES symmetric protocol
     * @param strToEncrypt string to encrypt
     * @param secretKeySpec secret key used to encrypt
     * @return string encrypted
     */
    public static String encrypt(String strToEncrypt, SecretKeySpec secretKeySpec){
        try{
            byte[] iv = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
            IvParameterSpec ivspec = new IvParameterSpec(iv);

            Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
            cipher.init(Cipher.ENCRYPT_MODE, secretKeySpec, ivspec);
            return Base64.getEncoder().encodeToString(cipher.doFinal(strToEncrypt.getBytes(StandardCharsets.UTF_8)));
        }catch (Exception e){
            System.out.println("Error while encrypting: " + e.toString());
            e.printStackTrace();
        }return null;
    }

    /**
     * Decrypts a string using AES symmetric protocol
     * @param strToDecrypt string to decrypt
     * @param secretKeySpec secret key used to decrypt
     * @return string decrypted
     */
    public static String decrypt(String strToDecrypt, SecretKeySpec secretKeySpec){
        try{
            byte[] iv = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
            IvParameterSpec ivspec = new IvParameterSpec(iv);

            Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5PADDING");
            cipher.init(Cipher.DECRYPT_MODE, secretKeySpec, ivspec);
            return new String(cipher.doFinal(Base64.getDecoder().decode(strToDecrypt)));
        }catch (Exception e){
            System.out.println("Error while decrypting: " + e.toString());
            e.printStackTrace();
        }return null;
    }




    /*
    public static void main(String[] args) {
        try {
            SecretKeySpec secretKeySpec = Constants.AESKey;
            String db = Constants.database;
            String table = Constants.tableEncrypted;
            String url = "jdbc:mysql://localhost:3306/" + db + "?allowMultiQueries=true&serverTimezone=Europe/Paris";
            String user = Constants.databaseUsername;
            String password = Constants.databasePassword;

            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection(url, user, password);

            String name = "tristan";
            String passwordd = "test1";
            int salary = 1000;
            int age = 21;

            String sqlStatement = "INSERT INTO "+db+"."+table+"(name,password,salary,age) values(?, ?, ?, ?)";
            PreparedStatement preparedStatement = connection.prepareStatement(sqlStatement);

            preparedStatement.setString(1, encrypt(name, secretKeySpec));
            preparedStatement.setString(2, encrypt(passwordd, secretKeySpec));
            preparedStatement.setString(3, encrypt(String.valueOf(salary), secretKeySpec));
            preparedStatement.setString(4, encrypt(String.valueOf(age), secretKeySpec));

            int result = preparedStatement.executeUpdate();
            preparedStatement.close();
            String sql1 = "select * from "+db+"."+table+" where id =1";
            Statement statement = connection.createStatement();
            statement.execute(sql1);
            ResultSet resultSet1 = statement.getResultSet();
            while (resultSet1.next()) {
                System.out.println(resultSet1.getString("name"));
                System.out.println(resultSet1.getString("password"));
                System.out.println(resultSet1.getString("salary"));
                System.out.println(resultSet1.getString("age"));
                System.out.println();
                System.out.println();
                System.out.println(decrypt(resultSet1.getString("name"), secretKeySpec));
                System.out.println(decrypt(resultSet1.getString("password"), secretKeySpec));
                System.out.println(decrypt(resultSet1.getString("salary"), secretKeySpec));
                System.out.println(decrypt(resultSet1.getString("age"), secretKeySpec));
            }
            connection.close();
        }catch (Exception e){
            e.printStackTrace();
        }

    }*/

}
