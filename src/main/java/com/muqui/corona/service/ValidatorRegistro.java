/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.muqui.corona.service;

import com.muqui.corona.model.Users;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

/**
 *
 * @author mq12
 */
public class ValidatorRegistro  implements Validator  {
    private boolean correo;
    private boolean username;
    @Override
    public boolean supports(Class<?> type) {
         return type == Users.class;
    }

    @Override
    public void validate(Object o, Errors errors) {
         Users users = (Users) o;
          //valida que la contraseña y su confirmacion sean iguales
        if (!users.getPasswordConfirm().equalsIgnoreCase(users.getPassword())) {
            errors.rejectValue("passwordConfirm", "La contraseña no coincide", "Contraseña diferente");
           
        }
        //valida password vacio
         if(users.getPassword().length() == 0){
             errors.rejectValue("password", "contraseña vacia", "Campo vacio");
        }
        //valida longitud de password
         if(users.getPassword().length() > 0 && users.getPassword().length() < 6){
             errors.rejectValue("password", "Longitud no validad", "longitud no valida");
        }
        //valida correo vacio
        if(users.getEmail().length() == 0){
             errors.rejectValue("email", "Email Campo vacio", "Campo vacio");
        }
        //Valida formato correcto de correo
         if(!users.getEmail().matches("^[a-zA-Z0-9_!#$%&’*+/=?`{|}~^.-]+@[a-zA-Z0-9.-]+$") && users.getEmail().length() > 0){
             errors.rejectValue("email", "Correo no Valido. ", "Campo vacio");
        }
        
        //valida correo unico
        if (!isCorreo()) {
            errors.rejectValue("email", "Este correo ya está registrado. Elige otro.", "Correo registrado");
        }
        //Valida usuario unico
         if (!isUsername()) {
            errors.rejectValue("username", "Este nombre de usuario ya está en uso. Elige otro", "usuario registrado");
        }
        
        //Valida usuario vacio
        if(users.getUsername().length() == 0){
             errors.rejectValue("username", "ingresa tu nombre.", "Campo vacio");
        }
        //valida longitud del usuario
        if(users.getUsername().length() > 0 && users.getUsername().length() < 6){
             errors.rejectValue("username", "Longitud no validad", "longitud no valida");
        }
       
        
    }

    /**
     * @return the correo
     */
    public boolean isCorreo() {
        return correo;
    }

    /**
     * @param correo the correo to set
     */
    public void setCorreo(boolean correo) {
        this.correo = correo;
    }

    /**
     * @return the username
     */
    public boolean isUsername() {
        return username;
    }

    /**
     * @param username the username to set
     */
    public void setUsername(boolean username) {
        this.username = username;
    }
    
}
