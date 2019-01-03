/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.muqui.corona.controller;

import com.muqui.corona.model.Contact;
import com.muqui.corona.model.Jugador;
import com.muqui.corona.model.Pagina;
import com.muqui.corona.model.Partidos;
import com.muqui.corona.model.Quiniela;
import com.muqui.corona.service.QuinielaService;

import java.io.IOException;
import java.util.List;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author mq12
 */
@Controller
@RequestMapping(value = "/quiniela**")
public class JugadorController {

   
    @Autowired
    QuinielaService quinielaService;

    List<List<String>> totalParticipantesG;

    @RequestMapping(value = {"/{userId}", "/{userId}/jugar**"}, method = RequestMethod.GET)
    public String test(@PathVariable String userId, ModelMap model) {
        for (Partidos p : quinielaService.getPartidos(userId)) {

        }
        model.addAttribute("jugador", new Jugador());
        model.addAttribute("partidos", quinielaService.getPartidos(userId));
        model.addAttribute("userId", userId);

        Pagina pagina = quinielaService.getPagina(userId);
         model.addAttribute("pagina", pagina);
        return quinielaService.rutaJugador(pagina, "jugador/jugar");

    }

    @RequestMapping(value = "/{userId}/guardado", method = RequestMethod.POST)
    public String save(@PathVariable String userId, @ModelAttribute("jugador") @Valid Jugador jugador, BindingResult bindingResult, HttpSession session, ModelMap model) {

        for (Partidos p : jugador.getQuiniela().getPartidoses()) {
            System.out.println("Local Please " + p.getLocal());
            System.out.println("Visitante Please " + p.getVisitante());
            System.out.println("Resultado xxxxtt " + p.getResultado());

        }
        model.addAttribute("partidos", jugador.getQuiniela().getPartidoses());
        if (bindingResult.hasErrors()) {
            System.out.println(" Hay error");

            model.addAttribute("userId", userId);

            return "jugar";
        } else {
            model.addAttribute("jugador", jugador);
            String vigente = String.valueOf(quinielaService.jugar(jugador, userId));
            session.setAttribute("vigente", vigente);
            model.addAttribute("userId", userId);

            return "jugador/jugado";
        }

    }

    @RequestMapping(value = "/{userId}/jugado", method = RequestMethod.GET)
    public String save1(@PathVariable String userId, HttpSession session, ModelMap model) {
        Jugador jugador = (Jugador) session.getAttribute("jugadorSessionIndex");
        for (Partidos p : jugador.getQuiniela().getPartidoses()) {
            System.out.println("Local PIEDAD " + p.getLocal());
            System.out.println("Visitante PIEDAD " + p.getVisitante());
            System.out.println("Resultado PIEDAD " + p.getResultado());

        }
        model.addAttribute("partidos", jugador.getQuiniela().getPartidoses());

        model.addAttribute("jugador", jugador);
      //String vigente = String.valueOf(quinielaService.jugar(jugador, username));
       String vigente = String.valueOf(quinielaService.jugar(jugador, userId));
        session.setAttribute("vigente", vigente);
        model.addAttribute("userId", userId);

        return "jugador/jugado";

    }

    @RequestMapping("/{userId}/historial")
    public String historial(@PathVariable String userId, ModelMap model, HttpSession session) {

        List<List<String>> totalParticipantes = null;
        if (session.getAttribute("historial") == null) {

            Pagina p = quinielaService.getPagina(userId);
           
            Quiniela qq = quinielaService.getQuiniela(p.getActual());
            
            session.setAttribute("historial", qq.getIdquiniela());
            session.setAttribute("nombrequiniela", qq.getNombre());

            totalParticipantes = quinielaService.getParticipantesSinLogin(p.getActual(), userId);
            model.addAttribute("partidos", quinielaService.getPartidos(userId));

        } else {

            int idquiniela = (Integer) session.getAttribute("historial");
            totalParticipantes = quinielaService.getParticipantesSinLogin(idquiniela, userId);
            System.out.println("idQIOnielaffdfdfd " + idquiniela);
            model.addAttribute("partidos", quinielaService.getPartidos(idquiniela));

        }
        model.addAttribute("participantes", totalParticipantes);
        model.addAttribute("userId", userId);
        model.addAttribute("quiniela", new Quiniela());
        //model.addAttribute("quinielas", quinielaService.getQuinielasPagina(userId));
         model.addAttribute("quinielas", quinielaService.getQuinielas());
         System.out.println("pafigasfffdsfsd $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ quiniela0" + quinielaService.getQuinielasPagina(userId) +  "user id " + userId);
        Pagina pagina = quinielaService.getPagina(userId);
        return "jugador/historial";

    }

    @RequestMapping(value = "/{userId}/jornada", method = RequestMethod.POST)
    public String editpersonListContainer1(@PathVariable String userId, @ModelAttribute("quiniela") Quiniela quiniela, HttpSession session, ModelMap model) {

        Quiniela qq = quinielaService.getQuiniela(quiniela.getIdquiniela());
        System.out.println("idquiniela " + qq.getIdquiniela());
        System.out.println("nombrequiniela" + qq.getNombre());
        model.addAttribute("userId", userId);
        session.setAttribute("historial", qq.getIdquiniela());
        session.setAttribute("nombrequiniela", qq.getNombre());
        return "redirect:/quiniela/{userId}/historial";

    }

    @RequestMapping("/{userId}/participantes")
    public String participantes(@PathVariable String userId, ModelMap model, HttpSession session) {
        session.setAttribute("userId", userId);
        System.out.println("Nombre: " + userId);
        Pagina p = quinielaService.getPagina(userId);
        model.addAttribute("userId", userId);

        totalParticipantesG = quinielaService.getParticipantesSinLogin(p.getActual(), userId);
        model.addAttribute("participantes", totalParticipantesG);
        model.addAttribute("partidos", quinielaService.getPartidos(userId));

        return "jugador/participantes";
    }

    @RequestMapping(value = "/imprimir", method = RequestMethod.POST)
    @ResponseBody
    public List<List<String>> recuperarpassword(ModelMap model, HttpSession session) {
        String userId = (String) session.getAttribute("userId");
        Pagina p = quinielaService.getPagina(userId);
        List<List<String>> totalParticipantes = quinielaService.getParticipantesSinLoginImprimir(p.getActual(), userId);

        return totalParticipantes;
    }

}
