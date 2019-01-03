/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.muqui.corona.controller;

import com.muqui.corona.model.UserRoles;
import com.muqui.corona.model.Users;
import com.muqui.corona.service.QuinielaService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
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
        model.addAttribute("user", new Users());
        //  return "userregistro";
        return "registro/registro";
    }

    @RequestMapping(value = "/saveuser", method = RequestMethod.POST)
    public String save(@ModelAttribute("user") Users user, ModelMap model, HttpServletRequest request, HttpSession session) {
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        String hashedPassword = passwordEncoder.encode(user.getPassword());
        System.out.println("hashedPassword " + hashedPassword);
        user.setPassword(hashedPassword);
        model.addAttribute("user", user);
        user.setEnabled(true);
        user.setPaginas(null);
        user.setUserRoleses(null);
        quinielaService.addUser(user);
        loginAutomatico(user);
        session.setAttribute("role", "ROLE_ADMIN_GRUPO");
        String redirectUrl = "admingrupo";
        return "redirect:" + redirectUrl;
        // return "userregistrado";
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
