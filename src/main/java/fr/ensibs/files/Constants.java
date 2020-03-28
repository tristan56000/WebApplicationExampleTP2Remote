package fr.ensibs.files;

import javax.crypto.spec.SecretKeySpec;

/**
 * Class gathering all the constants
 * @author Tristan Guerin
 * @version 1
 */
public class Constants {

    /**
     * Name of the database
     */
    public static final String database = "GUERIN";

    /**
     * New table of the database
     */
    public static final String tableEncrypted = "user";

    /**
     * Password of the AES algorithm to encrypt/decrypt the database's table
     */
    public static final String AESpassword = "sqlfdgjiwolalolawolalolasqlfdgji";

    /**
     * AES key
     */
    public static final SecretKeySpec AESKey = new SecretKeySpec(Constants.AESpassword.getBytes(),"AES");

}
