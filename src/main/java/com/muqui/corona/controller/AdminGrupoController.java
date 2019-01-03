/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.muqui.corona.controller;

import com.muqui.corona.model.Pagina;
import com.muqui.corona.model.Partidos;
import com.muqui.corona.model.Quiniela;
import com.muqui.corona.model.Users;
import com.muqui.corona.service.QuinielaService;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author mq12
 */
@Controller
public class AdminGrupoController {

    /*
      OBTENER AL USUARIO ACTUAL
    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            String username = authentication.getName();
    
     */
    @Autowired
    QuinielaService quinielaService;

    @RequestMapping(value = "/admingrupo**", method = RequestMethod.GET)
    public String adminGrupoPage(ModelMap model) {

        model.addAttribute("grupos", quinielaService.getPaginas(getUserActual()));

        //return "admingrupo";
        return "admingrupo/admingrupo";
    }

    @RequestMapping(value = "/admingrupo/administrargrupo**", method = RequestMethod.GET)
    public String adminGrupoquiniela(ModelMap model, HttpSession session, @RequestParam String id) {

        session.setAttribute("sessionIDPagina", id);

        System.out.println("IDpagina: " + session.getAttribute("sessionIDPagina").toString());

        return "admingrupo/admingrupoquiniela";

    }
    
              @RequestMapping(value = "/admingrupo/doblesytriples**", method = RequestMethod.GET)
    public String dobleytriples(ModelMap model, HttpSession session, @RequestParam String id) {

        session.setAttribute("sessionIDPagina", id);
        int idPagina = Integer.parseInt(id);
       
          model.addAttribute("pagina",  quinielaService.getPagina(idPagina));
        return "admingrupo/doblesytriples";

    }

    @RequestMapping(value = "/admingrupo/crearquiniela**", method = RequestMethod.GET)
    public String adminGrupoCrearquiniela(ModelMap model, HttpSession session, HttpServletRequest request, @RequestParam(value = "f", required = false) String flush, @RequestParam(value = "message", required = false) String message) {

        /*
            crear quiniela
         */
        if (flush != null) {
            session.setAttribute("partidoLista", getDummyPartidosLista());
        }
        if (session.getAttribute("partidoLista") == null) {
            session.setAttribute("partidoLista", getDummyPartidosLista());
        }
        model.addAttribute("partidoLista", (Quiniela) session.getAttribute("partidoLista"));
        if (message != null) {
            model.addAttribute("message", message);
        }
        model.addAttribute("cp", request.getContextPath());

        return "admingrupo/admingrupocrearquiniela";

    }

    private Quiniela getDummyPartidosLista() {
        List<Partidos> personList = new LinkedList<Partidos>();
        for (int i = 0; i < 9; i++) {
            personList.add(new Partidos("", ""));
        }
        return new Quiniela(personList);
    }

    @RequestMapping(value = "/admingrupo/editpersonlistcontainer", method = RequestMethod.POST)
    public String editpersonListContainer(@ModelAttribute Quiniela quiniela, HttpSession session) {

        String idGrupo = session.getAttribute("sessionIDPagina").toString();
//        for (Partidos p : quiniela.getPartidoses()) {
//            System.out.println("Local: " + p.getLocal());
//            System.out.println("Visitante: " + p.getVisitante());
//        }
        try {

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
            SimpleDateFormat output = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Date d = sdf.parse(quiniela.getFechaTemporal());
            Timestamp timeStampDate = new Timestamp(d.getTime());
            quiniela.setFechaLimite(timeStampDate);
            quiniela.setPaginaTipo(idGrupo);
            String formattedTime = output.format(d);
            System.out.println(" timerewrwADmin " + formattedTime);
        } catch (Exception e) {//this generic but you can control another types of exception
            System.out.println("E" + e);
        }

        System.out.println(" nombre quiniela ............................................................................" + quiniela.getNombre());
        System.out.println(" fecha ............................................................................" + quiniela.getFechaLimite());
        //  System.out.println(" nombre pagina xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx " + quiniela.getPagina().getNombre());

        quinielaService.saveQuiniela(quiniela);

        // employeeService.saveQuiniela(new Quiniela(quiniela.getPagina(), quiniela.getNombre(), (Timestamp) quiniela.getFechaLimite(), quiniela.getPartidoses(), null, null));
        // personService.saveQuiniela(new Quiniela(quiniela.getPagina(), quiniela.getNombre(), (Timestamp) quiniela.getFechaLimite(), 
        //      quiniela.getPartidoses(), null, null));
        return "redirect:/admingrupo/crearquiniela";

    }
//
    @RequestMapping("/admingrupo/quinielas")
    public String editar(@ModelAttribute Quiniela quiniela, ModelMap model, HttpSession session) {
        String idGrupo = session.getAttribute("sessionIDPagina").toString();
        System.out.println("idprugogetsession " + idGrupo);
        model.addAttribute("quinielas", quinielaService.getQuinielasPagina(idGrupo));

        return "admingrupo/admingrupoquinielas";
    }

    @RequestMapping("/admingrupo/actualquiniela")
    public String actual(@ModelAttribute Quiniela quiniela, @RequestParam String id, ModelMap model, HttpSession session) {
        System.out.println("id Quinielaaaaaaaaaaaaaaaaaaa   xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxyyyyyy   = " + id);
        String idGrupo = session.getAttribute("sessionIDPagina").toString();
        quinielaService.setQuinielaActualGrupo(id, idGrupo);

        return "redirect:/admingrupo/quinielas";
    }

    @RequestMapping(value = "/admingrupo/resultados**", method = RequestMethod.GET)
    public String crearQuiniela(ModelMap model, HttpSession session, HttpServletRequest request, @RequestParam(value = "f", required = false) String flush, @RequestParam(value = "message", required = false) String message) {
      

        String idGrupo = session.getAttribute("sessionIDPagina").toString();
       model.addAttribute("partidos", quinielaService.getPartidosIdGrupo(idGrupo));
       
        return "admingrupo/admingruporesultados";

    }

    @RequestMapping("/admingrupo/editar")
    public String editUser(@RequestParam String id, ModelMap model) {

        model.addAttribute("partido", quinielaService.getPartidoActualizar(id));

        return "admingrupo/admingrupoeditar";

    }

    @RequestMapping("/admingrupo/update")
    public String updateUser(@ModelAttribute("partido") Partidos partido, ModelMap model, HttpSession session) {
        System.out.println("x partido xxxxxxxxxxxxxx&&&&&&''''?????" + partido.getIdpartidos() + " local " + partido.getLocal() + " visita " + partido.getVisitante());
        String idGrupo = session.getAttribute("sessionIDPagina").toString();

        quinielaService.actualizarResultadoIdGrupo(partido, idGrupo);

        return "redirect:/admingrupo/resultados";

    }

    @RequestMapping("/admingrupo/eliminarparticipante")
    public String eliminarparticipante(ModelMap model, HttpSession session) {
        int idGrupo = Integer.parseInt(session.getAttribute("sessionIDPagina").toString());

        model.addAttribute("jugadores", quinielaService.getjugadoresActualIdgrupo(idGrupo));

        return "admingrupo/admingrupoeliminarparticipante";
    }

    @RequestMapping("/admingrupo/eliminarjugador")
    public String eliminarparticipantesave(ModelMap model, @RequestParam String id) {

        System.out.println("id jugador: " + id);

        quinielaService.eliminarJugador("" + id);

        return "redirect:/admingrupo/eliminarparticipante";
    }

    @RequestMapping("/admingrupo/editarquiniela")
    public String editar(@ModelAttribute Quiniela quiniela, @RequestParam String id, ModelMap model) {
        System.out.println("id Quinielaaaaaaaaaaaaaaaaaaa   xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx   = " + id);
        quiniela = quinielaService.getQuiniela(Integer.parseInt(id));

        model.addAttribute("quiniela", quiniela);

        return "admingrupo/admingrupoeditarquiniela";
    }

    @RequestMapping("/admingrupo/updatequiniela")
    public String updatequiniela(@ModelAttribute Quiniela quiniela, ModelMap model, HttpSession session) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
        SimpleDateFormat output = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        try {
            Date d;
            d = sdf.parse(quiniela.getFechaTemporal());
            Timestamp timeStampDate = new Timestamp(d.getTime());
            quiniela.setFechaLimite(timeStampDate);
        } catch (ParseException ex) {
           // Logger.getLogger(QuinielaController.class.getName()).log(Level.SEVERE, null, ex);
        }
       
        int idGrupo = Integer.parseInt(session.getAttribute("sessionIDPagina").toString());
        quinielaService.updatequiniela(quiniela, idGrupo);

        return "redirect:/admingrupo/quinielas";
    }

     @RequestMapping("/admingrupo/formulariocambiarclavegrupo")
    public String formChangePassword( ModelMap model, HttpSession session , @RequestParam String nombre) {
      
        Users user = quinielaService.findByUserName(nombre);            
          model.addAttribute("user",  user);
        return "/admingrupo/cambiarClave";
    }
      @RequestMapping("/admingrupo/cambiarclave")
    public String ChangePassword(@ModelAttribute Users user, ModelMap model, HttpSession session) {
          System.out.println("usexeeew " + user.getUsername() + "  " + user.getPassword()  +  user.isEnabled());
        quinielaService.updateUser(user);
        return "redirect:/admingrupo";
    }
       @RequestMapping("/admingrupo/formchangepassword")
    public String formchangepassword(ModelMap model) {
        Users user = quinielaService.findByUserName(getUserActual());
        model.addAttribute("user", user);
        return "admingrupo/formchangepassword";

    }
           @RequestMapping("/admingrupo/cambiardoblesytriples")
    public String cambiardoblesytriples(@ModelAttribute Pagina pagina, ModelMap model, HttpSession session) {
          
        //quinielaService.updateUser(user);
        quinielaService.updatePagina(pagina);
        return "redirect:/admingrupo";
    }


    @RequestMapping("/admingrupo/changepassword")
    public String changepassword(@ModelAttribute Users user, ModelMap model) {

        quinielaService.updateUser(user);
        System.out.println("namesssss: " + user.getUsername());
        return "redirect:/admingrupo";

    }
    
    public String getUserActual() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String username = authentication.getName();
        return username;
    }

    @RequestMapping(value = "/availablegroup", method = RequestMethod.GET)
    @ResponseBody
    public String findOneGruop(@RequestParam String username) {
        Boolean available = quinielaService.findOneGruop(username);
        System.out.println("valor" + available + " nombre " + username);
        return available.toString();
    }

    @RequestMapping(value = "/creargrupo", method = RequestMethod.POST)
    public String addGrupo(@ModelAttribute("user") Users user, ModelMap model, HttpServletRequest request) {
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        String hashedPassword = passwordEncoder.encode(user.getPassword());
        System.out.println("hashedPassword " + hashedPassword);
        user.setPassword(hashedPassword);
        model.addAttribute("user", user);
        user.setEmail("email");
        user.setEnabled(true);
        user.setPaginas(null);
        user.setUserRoleses(null);

        quinielaService.addGrupo(user);
        String redirectUrl = "admingrupo";
        return "redirect:" + redirectUrl;
        // return "userregistrado";
    }
}
