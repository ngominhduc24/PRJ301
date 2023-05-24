/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utils;

/**
 *
 * @author ASUS PC
 */
public class HandleMagicNumber {
    public enum UserRole {
        ADMIN(1), USER(2), STAFF(3);
 
        private final int value;
 
        private UserRole(int value) {
            this.value = value;
        }
        
        public int getValue() {
            return value;
        }
    }
    
}
