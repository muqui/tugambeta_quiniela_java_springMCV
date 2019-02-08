/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.muqui.corona.controller;

import com.muqui.corona.model.EstadisticaPartido;
import com.muqui.corona.model.Jugador;
import com.muqui.corona.model.Jugadorresultados;
import com.muqui.corona.model.Pagina;
import com.muqui.corona.model.Partidos;
import com.muqui.corona.model.UserRoles;
import com.muqui.corona.model.Users;
import com.muqui.corona.service.QuinielaService;
import java.util.List;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author mq12
 */
@Controller
public class IndexController {

    @Autowired
    QuinielaService quinielaService;
    List<List<String>> totalParticipantesG = null;

    @RequestMapping(value = {"/"}, method = RequestMethod.GET)
    public String crearQuiniela(ModelMap model, HttpSession session) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = auth.getName(); //get logged in username
        System.out.println("Nombre indexxxxxxxxxxxxxxxxxxxxx >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> " + name);
        model.addAttribute("jugador", new Jugador());
        //  model.addAttribute("partidos", quinielaService.getPartidos());

        List<Partidos> partidos = quinielaService.getPartidos(name);
        System.out.println("Lista indexxxxxxxxxxxxxxxxxxxxx >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> " + partidos);

      //  if (partidos != null) {
            if (partidos == null) {
                model.addAttribute("partidos", quinielaService.getPartidos());
                model.addAttribute("pagina", quinielaService.getPagina());
            } else {
                model.addAttribute("partidos", partidos);
                model.addAttribute("pagina", quinielaService.getPagina(name));

                //participantes
                session.setAttribute("userId", name);
                System.out.println("Nombre: " + name);
                Pagina p = quinielaService.getPagina(name);
                model.addAttribute("userId", name);

                totalParticipantesG = quinielaService.getParticipantesSinLogin(p.getActual(), name);
                model.addAttribute("participantes", totalParticipantesG);
                model.addAttribute("partidos", quinielaService.getPartidos(name));

                //end participantes
                System.out.println("PARTICIPANTETES  ###################################################################################################" + totalParticipantesG);

            }
          //  model.addAttribute("tablageneral", quinielaService.getTablaGeneral());
          //  model.addAttribute("nombreliga", quinielaService.getnombreliga());
         // model.addAttribute("nombreliga", "");
       // }

        return "index";
    }

    @RequestMapping(value = "/entrar", method = RequestMethod.GET)
    public String entrar(HttpSession session) {
        String role = "";
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String username = authentication.getName();
        Users usuario = quinielaService.findByUserName(username);

        for (UserRoles p : usuario.getUserRoleses()) {
            System.out.println("ROLErolex2121 " + p.getRole());
            role = p.getRole();

        }
        session.setAttribute("role", role);
//        if (role.equalsIgnoreCase("ROLE_ADMIN")) {
//            System.out.println("ROLE_ADMIN ");
//            return "redirect:admin";
//        } else if (role.equalsIgnoreCase("ROLE_JUGADOR")) {
//
//            System.out.println("10/04/2017: " + username);
//            String redirectUrl = "quiniela/" + username;
//            System.out.println("Redireccionuqui " + redirectUrl);
//            return "redirect:" + redirectUrl;
//        } else if (role.equalsIgnoreCase("ROLE_ADMIN_GRUPO")) {
//            System.out.println("ROLE_ADMIN_GRUPO ");

//            return "redirect:admingrupo";
//        } else {
//            System.out.println("10/04/2017default: " + username);
//            String redirectUrl = "quiniela/pruebas";
//            return "redirect:" + redirectUrl;
//        }
        if (role.equalsIgnoreCase("ROLE_ADMIN")) {
            System.out.println("ROLE_ADMIN ");
            return "redirect:/admin";
        } else if (role.equalsIgnoreCase("ROLE_ADMIN_GRUPO")) {
            System.out.println("ROLE_ADMIN_GRUPO ");
            return "redirect:/admingrupo";
        } else {
            return "redirect:/";
        }

    }

    @RequestMapping(value = {"/comojugar"}, method = RequestMethod.GET)
    public String comoJugar() {

        return "comojugar";
    }

    @RequestMapping(value = "/guardar", method = RequestMethod.GET)
    public String save(@ModelAttribute("jugador") @Valid Jugador jugador, BindingResult bindingResult, HttpSession session, ModelMap model) {
        for (Partidos p : jugador.getQuiniela().getPartidoses()) {
            System.out.println("Local PIEDADgod " + p.getLocal());
            System.out.println("Visitante PIEDADdog " + p.getVisitante());
            System.out.println("Resultado PIEDAD " + p.getResultado());

        }
        session.setAttribute("jugadorSessionIndex", jugador);
        String role = "";
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String username = authentication.getName();
        Users usuario = quinielaService.findByUserName(username);

        for (UserRoles p : usuario.getUserRoleses()) {
            System.out.println("ROLE xaxaxaaxaxaxaxaxaxaxaxaxaxaxaxaxaxaxaxaxax__________xxxxxxxxxxxxxxx__________12121212121212121212121212121221212122121 " + p.getRole() + " uusaio " + usuario.getUsername());
            role = p.getRole();

        }

        Pagina pagina = quinielaService.getPagina(usuario.getUsername());//quinielaService.getPagina();
        String error2y3 = "";
        int limiteDobles = Integer.parseInt(pagina.getDobles());
        int limiteTriples = Integer.parseInt(pagina.getTriples());
        int triples = 0;
        int dobles = 0;
        for (Partidos p : jugador.getQuiniela().getPartidoses()) {
//            System.out.println("Local Please " + p.getLocal());
//            System.out.println("Visitante Please " + p.getVisitante());
//            System.out.println("Resultado xxxxtt " + p.getResultado());
            if (p.getResultado().length() == 3) {
                dobles += 1;
            }
            if (p.getResultado().length() == 5) {
                triples += 1;
            }

        }
        System.out.println("doblesy: " + dobles + "triplesx: " + triples + " limite2: " + limiteDobles + " limite3 " + limiteTriples);
        model.addAttribute("partidos", jugador.getQuiniela().getPartidoses());
        if (dobles > limiteDobles || triples > limiteTriples) {
            error2y3 = "limite de dobles: " + limiteDobles + " limite de triples: " + limiteTriples;
            model.addAttribute("error2y3", error2y3);
            System.out.println("doble o trples incorrecto");
            return "index";
        } else if (bindingResult.hasErrors()) {
            System.out.println(" Hay error");
            return "index";
        } else {

            if (role.equalsIgnoreCase("ROLE_ADMIN")) {
                System.out.println("ROLE_ADMIN ");
                return "redirect:admin";
            } else if (role.equalsIgnoreCase("ROLE_JUGADOR")) {

                System.out.println("10/04/2017: " + username);
                String redirectUrl = "quiniela/" + username + "/jugado";
                System.out.println("Redireccionuqui " + redirectUrl);

                //String vigente = String.valueOf(quinielaService.jugar(jugador, username));
                return "redirect:" + redirectUrl;
            } else if (role.equalsIgnoreCase("ROLE_ADMIN_GRUPO")) {
                System.out.println("ROLE_ADMIN_GRUPO ");
                return "redirect:admingrupo";
            } else {
                System.out.println("10/04/2017default: " + username);
                String redirectUrl = "quiniela/pruebas";
                return "redirect:" + redirectUrl;
            }
        }
    }
}
