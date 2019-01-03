/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.muqui.corona.service;

import com.muqui.corona.dao.QuinielaDao;
import com.muqui.corona.model.EstadisticaPartido;
import com.muqui.corona.model.EstadisticaTorneo;
import com.muqui.corona.model.Jugador;
import com.muqui.corona.model.Pagina;
import com.muqui.corona.model.Partidos;
import com.muqui.corona.model.Quiniela;
import com.muqui.corona.model.Tablageneral;
import com.muqui.corona.model.Users;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.security.access.method.P;
/**
 *
 * @author mq12
 */
@Service("quinielaService")
@Transactional
public class QuinielaServiceImpl implements QuinielaService {

    @Autowired
    private QuinielaDao dao;
    public List<Partidos> getPartidos() {
        return dao.getPartidos();
    }

    public Pagina getPagina() {
         return dao.getPagina();
    }

    public Users findByUserName(String username) {
         return dao.findByUserName(username);
    }

    public int jugar(Jugador jugador, String username) {
         return dao.jugar(jugador, username);
    }

   
     public List<Partidos> getPartidos(String userId) {
       return dao.getPartidos(userId);
    }

    public Pagina getPagina(String userId) {
      return dao.getPagina(userId);
    }

    @PreAuthorize("#pagina.nombre == authentication.name ")
    public String rutaJugador(@P("pagina")Pagina pagina, String url) {
        if (isSubpagina(pagina)) {
            return url;
        } else {
            return "error";
        }
    }

    
    public boolean isSubpagina(Pagina pagina) {
        return dao.isSubpagina(pagina);
    }

    public List<List<String>> getParticipantesSinLogin(Integer actual, String userId) {
        return dao.getParticipantesSinLogin(actual,userId);
    }

   public Quiniela getQuiniela(int parseInt) {
       return  dao.getQuiniela(parseInt);
    }

    public List<Partidos> getPartidos(int idquiniela) {
       return dao.getPartidos(idquiniela);
    }

    public List<Quiniela> getQuinielasPagina(String userId) {
       return dao.getQuinielasPagina(userId);
    }

    public List<Pagina> getPaginas(String userActual) {
      return dao.getPaginas(userActual);
    }

    public Boolean findOneGruop(String username) {
      return dao.findOneGruop(username);
    }

    public void addGrupo(Users user) {
        dao.addGrupo(user);
    }

    public void updateUser(Users user) {
       dao.updateUser(user);
    }

    public void saveQuiniela(Quiniela quiniela) {
       dao.saveQuiniela(quiniela);
    }

    public List<Jugador> getjugadoresActualIdgrupo(int idGrupo) {
        return dao.getjugadoresActualIdgrupo(idGrupo);
    }

    public void eliminarJugador(String string) {
       dao.eliminarJugador(string);
    }

    public void setQuinielaActualGrupo(String id, String idGrupo) {
        dao.setQuinielaActualGrupo(id,idGrupo);
    }

    public void updatequiniela(Quiniela quiniela, int idGrupo) {
       dao.updatequiniela(quiniela, idGrupo);
    }

    public void setQuinielaActual(String id) {
        dao.setQuinielaActual(id);
    }

    public Partidos getPartidoActualizar(String id) {
        return dao.getPartidoActualizar(id);
    }

    public List<Jugador> getjugadoresActual(int idQuiniela) {
      return dao.getjugadoresActual(idQuiniela);
    }

    public void actualizarResultado(Partidos partido, int idQuiniela) {
      dao.actualizarResultado(partido, idQuiniela);
    }

    public void updatequiniela(Quiniela quiniela) {
        dao.updatequiniela(quiniela);
    }

    public List<Quiniela> getQuinielas() {
      return dao.getQuinielas();
    }

    public List<Pagina> getPaginas() {
      return dao.getPaginas();
    }

    public Boolean findOneEmail(String email) {
        return dao.findOneEmail(email);
    }

    public Boolean findOneUser(String username) {
       return dao.findOneUser(username);
    }

    public void addUser(Users user) {
       dao.addUser(user);
    }

    public Users findByUserEmail(String email) {
       return dao.findByUserEmail(email);
    }

    public List<EstadisticaPartido> calcularTablaGeneral(int idLiga) {
       return dao.calcularTablaGeneral(idLiga);
    }

    public void saveClubTablaGeneral(int idLiga) {
        dao.saveClubTablaGeneral(idLiga);
    }

    public List<Tablageneral> getTablaGeneral() {
      return  dao.getTablaGeneral();
    }

    public List<List<String>> getParticipantesSinLoginImprimir(Integer actual, String userId) {
       return dao.getParticipantesSinLoginImprimir(actual, userId);
    }

    public  List<EstadisticaTorneo> getLigas() {
        return dao.getLigas();
    }

    public String getnombreliga() {
        return dao.getnombreliga();
    }

    public Pagina getPagina(int idPagina) {
      return dao.getPagina(idPagina);
    }

    public void updatePagina(Pagina pagina) {
       dao.updatePagina(pagina);
    }

    public List<Partidos> getPartidosIdGrupo(String idGrupo) {
        return dao.getPartidosIdGrupo(idGrupo);
    }

    public void actualizarResultadoIdGrupo(Partidos partido, String idGrupo) {
       dao.actualizarResultadoIdGrupo(partido, idGrupo);
    }

    
    

   
   
    
}
