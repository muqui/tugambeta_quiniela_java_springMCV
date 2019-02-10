/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.muqui.corona.service;

import com.muqui.corona.model.EstadisticaPartido;
import com.muqui.corona.model.EstadisticaTorneo;
import com.muqui.corona.model.Jugador;
import com.muqui.corona.model.Pagina;
import com.muqui.corona.model.Partidos;
import com.muqui.corona.model.Quiniela;
import com.muqui.corona.model.Tablageneral;
import com.muqui.corona.model.Users;
import java.util.List;

/**
 *
 * @author mq12
 */
public interface QuinielaService {

    

    public List<Partidos> getPartidos();

    public Pagina getPagina();

    public Users findByUserName(String username);

    public int jugar(Jugador jugador, String username);

    public List<Partidos> getPartidos(String userId);

    public Pagina getPagina(String userId);

    public String rutaJugador(Pagina pagina, String jugadorjugar);

    public List<List<String>> getParticipantesSinLogin(Integer actual, String userId);

    public Quiniela getQuiniela(int actual);

    public List<Partidos> getPartidos(int idquiniela);

    public List<Quiniela> getQuinielasPagina(String userId);

   public List<Pagina> getPaginas(String userActual);

    public Boolean findOneGruop(String username);

    public void addGrupo(Users user);

    public void updateUser(Users user);

    public void saveQuiniela(Quiniela quiniela);

    public List<Jugador> getjugadoresActualIdgrupo(int idGrupo);

    public void eliminarJugador(String string);

    public void setQuinielaActualGrupo(String id, String idGrupo);

    public void updatequiniela(Quiniela quiniela, int idGrupo);

    public void setQuinielaActual(String id);

    public Partidos getPartidoActualizar(String id);

    public List<Jugador> getjugadoresActual(int idQuiniela);

    public void actualizarResultado(Partidos partido, int idQuiniela);

    public void updatequiniela(Quiniela quiniela);

    public List<Quiniela> getQuinielas();

    public List<Pagina> getPaginas();

    public Boolean findOneEmail(String email);

    public Boolean findOneUser(String username);

    public void addUser(Users user);

    public Users findByUserEmail(String email);

    public List<EstadisticaPartido> calcularTablaGeneral(int idLiga);

    public void saveClubTablaGeneral(int idLiga);

    public  List<Tablageneral> getTablaGeneral();

    public List<List<String>> getParticipantesSinLoginImprimir(Integer actual, String userId);

    public  List<EstadisticaTorneo> getLigas();

    public String getnombreliga();

    public Pagina getPagina(int idPagina);

    public void updatePagina(Pagina pagina);

    public List<Partidos> getPartidosIdGrupo(String idGrupo);

    public void actualizarResultadoIdGrupo(Partidos partido, String idGrupo);

   public void eliminarGrupo(String nombre);

    public boolean getEmail(String email);

    public boolean getUusername(String username);

 

   
   
}
