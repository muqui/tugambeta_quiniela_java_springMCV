/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.muqui.corona.controller;

import com.muqui.corona.model.Users;
import com.muqui.corona.service.JsonResponse;
import com.muqui.corona.service.QuinielaService;
import com.muqui.corona.service.ValidatorRegistro;
import java.util.Map;
import java.util.stream.Collectors;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.MediaType;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ValidationUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author mq12
 */
@Controller
public class RegistroController {

    @Autowired
    QuinielaService quinielaService;
    @Autowired
    @Qualifier("userDetailsService")
    UserDetailsService userDetailsService;
    @Autowired
    @Qualifier("authenticationManager")
    AuthenticationManager authenticationManager;

    @RequestMapping(value = {"/registro"}, method = RequestMethod.GET)
    public String crearQuiniela(ModelMap model) {
        
        return "registro/registro";
    }

    @RequestMapping(value = "/saveuser", produces = {MediaType.APPLICATION_JSON_VALUE})
    @ResponseBody
    public JsonResponse addUser(@ModelAttribute @Valid Users user, BindingResult result) {
        ValidatorRegistro validatorRegistro = new ValidatorRegistro();
        boolean correo = quinielaService.getEmail(user.getEmail().trim());
        boolean username = quinielaService.getUusername(user.getUsername().trim());
        validatorRegistro.setCorreo(correo);
        validatorRegistro.setUsername(username);
        validatorRegistro.validate(user, result);
        JsonResponse res = new JsonResponse();
        if (!result.hasErrors()) {
            quinielaService.addUser(user);
            loginAutomatico(user);
            res.setValidated(true);
            res.setResult(user);
            res.setRedirectUrl("http://localhost:8080/admingrupo");
        } else {
            res.setValidated(false);
            res.setResult(result.getAllErrors());
        }

        return res;
    }


  
    
    @RequestMapping(value = "/availableemailrecuperar", method = RequestMethod.GET)
    @ResponseBody
    public String availableEmail(@RequestParam String email) {
        Boolean available = !quinielaService.findOneEmail(email);
        System.out.println("valor" + available + " nombre " + email);
        return available.toString();
    }

    @RequestMapping(value = "/availableemail", method = RequestMethod.GET)
    @ResponseBody
    public String availableEmail1(@RequestParam String email) {
        Boolean available = quinielaService.findOneEmail(email);
        System.out.println("valor" + available + " nombre " + email);
        return available.toString();
    }

    @RequestMapping(value = "/availableuser", method = RequestMethod.GET)
    @ResponseBody
    public String availableUser(@RequestParam String username) {
        Boolean available = quinielaService.findOneUser(username);
        System.out.println("valor" + available + " nombre " + username);
        return available.toString();
    }

    public void loginAutomatico(Users user) {

        String username = user.getUsername();
        String password2 = user.getPasswordConfirm();
        UserDetails userDetails = userDetailsService.loadUserByUsername(username);
        UsernamePasswordAuthenticationToken auth = new UsernamePasswordAuthenticationToken(userDetails, password2, userDetails.getAuthorities());
        authenticationManager.authenticate(auth);
        if (auth.isAuthenticated()) {
            SecurityContextHolder.getContext().setAuthentication(auth);
        }

    }
}
