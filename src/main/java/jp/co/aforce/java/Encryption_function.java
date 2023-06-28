package jp.co.aforce.java;

public class Encryption_function {
	
    private static final int SHIFT = 3; // ずらす文字数
	
    public static String encryption(String email) {
        StringBuilder encryptedEmail = new StringBuilder();
        for (int i = 0; i < email.length(); i++) {
            char c = email.charAt(i);
            if (Character.isLetter(c)) {
                c = (char) (c + SHIFT);
                if ((Character.isLowerCase(email.charAt(i)) && c > 'z') ||
                        (Character.isUpperCase(email.charAt(i)) && c > 'Z')) {
                    c = (char) (c - 26);
                }
            }
            encryptedEmail.append(c);
        }
        return encryptedEmail.toString();
    }
    
    public static String decryption(String encryptedEmail) {
        StringBuilder decryptedEmail = new StringBuilder();
        for (int i = 0; i < encryptedEmail.length(); i++) {
            char c = encryptedEmail.charAt(i);
            if (Character.isLetter(c)) {
                c = (char) (c - SHIFT);
                if ((Character.isLowerCase(encryptedEmail.charAt(i)) && c < 'a') ||
                        (Character.isUpperCase(encryptedEmail.charAt(i)) && c < 'A')) {
                    c = (char) (c + 26);
                }
            }
            decryptedEmail.append(c);
        }
        return decryptedEmail.toString();
    }
}
