/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.muqui.corona.dao;

import com.muqui.corona.model.EstadisticaPartido;
import com.muqui.corona.model.EstadisticaTorneo;
import com.muqui.corona.model.Jugador;
import com.muqui.corona.model.Jugadorresultados;
import com.muqui.corona.model.Pagina;
import com.muqui.corona.model.Partidos;
import com.muqui.corona.model.Quiniela;
import com.muqui.corona.model.Tablageneral;
import com.muqui.corona.model.UserRoles;
import com.muqui.corona.model.Users;
import com.muqui.corona.service.Codigo;
import com.muqui.corona.service.FechaLimite;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.hibernate.Session;
import org.hibernate.Query;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import org.springframework.stereotype.Repository;

/**
 *
 * @author mq12
 */
@Repository("quinielaDao")
public class QuinielaDaoImpl implements QuinielaDao {

    @Autowired
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sf) {
        this.sessionFactory = sf;
    }

    public Users findByUserName(String username) {
        Session session = this.sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Users where username= :username ");
        query.setParameter("username", username);
        List<?> list = query.list();
        Users u = (Users) list.get(0);

        System.out.println(u);

        return u;
    }

    /*
    Obtiene partido de la quiniela Actual
     */
    public List<Partidos> getPartidos() {
        Pagina pagina = getPagina();
        int actual = -10;
        if (pagina != null) {
            actual = pagina.getActual();
        }

        System.out.println("Pagina selecccionasda partidos 02/01/2018   ID ::::::::::::::::::::::::::::::::::: " + actual);
        Session session = this.sessionFactory.getCurrentSession();
        Query query = session.createQuery("FROM Partidos as p  WHERE p.quiniela.idquiniela = :id");

        query.setParameter("id", actual);
        List<Partidos> list = query.list();

        if (list.size() > 0) {
            return list;
        } else {
            System.out.println("ES NULL  000000000000000000000000000000000000000000000000000000000000000000");
            return null;
        }
    }

    public Pagina getPagina() {
        Session session = this.sessionFactory.getCurrentSession();
        Query query = session.createQuery("FROM Pagina as p WHERE p.tipo= :tipo ");
        query.setParameter("tipo", "q_ligamx");
        List<?> list = query.list();

        if (list.size() > 0) {
            Pagina u = (Pagina) list.get(0);
            return u;
        } else {
            return null;
        }

    }

    public int jugar(Jugador jugador, String userId) {
        Session session = this.sessionFactory.getCurrentSession();
        Codigo codigo = new Codigo();
        int vigente = 0;
        List<Jugadorresultados> misResultados = new LinkedList<Jugadorresultados>();
        for (Partidos p : jugador.getQuiniela().getPartidoses()) {
            Jugadorresultados jugadorresultados = new Jugadorresultados(null, p, null, p.getResultado());
            //System.out.println("resultado " + jugadorresultados.getResultado());
            // System.out.println("resultado " + jugadorresultados.getPartidos().getIdpartidos());
            misResultados.add(jugadorresultados);
        }
        Pagina pagina = getPagina(userId);
        Quiniela quiniela = getQuiniela(pagina.getActual());
        vigente = new FechaLimite().Limite(quiniela.getFechaLimite());
        if (vigente == -1) {//esta vigente
            jugador.setAciertos(0);
            jugador.setCodigo(codigo.getCadenaAlfanumAleatoria());
            jugador.setQuiniela(quiniela);

            for (Partidos p : jugador.getQuiniela().getPartidoses()) {
//                System.out.println("Resultado xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" + p.getResultado());
//                System.out.println("id partido" + p.getIdpartidos());
            }

//            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
//            String username = authentication.getName();
//            jugador.setUsers(new Users(username, true)); //corregir como guardar el user
            jugador.setUsers(findByUserName(userId));
            session.persist(jugador);

            Jugador j = getJugador(jugador.getCodigo(), jugador.getJugador());
            for (Jugadorresultados r : misResultados) {
                r.setJugador(j);
                r.setQuiniela(quiniela);

                session.persist(r);
            }

        } else {
            System.out.println("NO ESTA VIGENTE ...................................................................................");
        }

        return vigente;
    }

    public Pagina getPagina(String nombre) {
        Session session = this.sessionFactory.getCurrentSession();
        Query query = session.createQuery("FROM Pagina as p WHERE p.nombre= :nombre ");
        query.setParameter("nombre", nombre);
        List<?> list = query.list();

        if (list.size() > 0) {
            Pagina u = (Pagina) list.get(0);
            return u;
        } else {
            return null;
        }
    }

    public Quiniela getQuiniela(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Query query = session.createQuery("FROM Quiniela as q WHERE q.idquiniela   =" + id);
        List<?> list = query.list();
        Quiniela q = (Quiniela) list.get(0);
        return q;
    }

    public Quiniela getQuiniela(String nombre) {
        Session session = this.sessionFactory.getCurrentSession();
        Query query = session.createQuery("FROM Quiniela as q WHERE q.nombre ='" + nombre + "' order by q.idquiniela desc");
        List<?> list = query.list();
        Quiniela u = (Quiniela) list.get(0);
        return u;
    }

    public Jugador getJugador(String codigo, String nombre) {
        System.out.println("Jugador " + nombre + "codigo " + codigo);
        Session session = this.sessionFactory.getCurrentSession();

        Query query = session.createQuery("FROM Jugador as j WHERE j.jugador ='" + nombre + "'  and j.codigo  ='" + codigo + "'");
        System.out.println();
        List<?> list = query.list();
        Jugador jugador = (Jugador) list.get(0);
        return jugador;
    }

    public List<Partidos> getPartidos(String userId) {
        Pagina pagina = getPagina(userId);
        int actual = -10;
        if (pagina != null) {
            actual = pagina.getActual();
        }

        System.out.println("Pagina selecccionasda   ID ::::::::::::::::::::::::::::::::::: " + actual);
        Session session = this.sessionFactory.getCurrentSession();
        Query query = session.createQuery("FROM Partidos as p  WHERE p.quiniela.idquiniela = :id");
        query.setParameter("id", actual);
        List<Partidos> list = query.list();
        if (list.size() > 0) {
            return list;
        } else {
            return null;
        }
    }

    public boolean isSubpagina(Pagina pagina) {
        Session session = this.sessionFactory.getCurrentSession();
        Query query = session.createQuery("FROM Pagina as p WHERE p.nombre= :userId ");
        query.setParameter("userId", pagina.getNombre());
        List<?> list = query.list();
        return list.size() > 0 ? true : false;
    }

    public List<List<String>> getParticipantesSinLogin(Integer actual, String userId) {
        List<List<String>> totalParticipantes = new ArrayList<List<String>>();
        List<String> participante = null;
        Quiniela q = getQuiniela(actual);

        Session session = this.sessionFactory.getCurrentSession();
        Query query = session.createQuery("FROM Jugador as j WHERE j.quiniela.idquiniela = :id and j.users.username = :username order by j.aciertos desc ");
        query.setParameter("id", q.getIdquiniela());

        query.setParameter("username", userId);
        List<Jugador> jugadores = query.list();
        participante = new ArrayList<String>();
        participante.add("Jugador");
        participante.add("Codigo");

        for (Partidos p : q.getPartidoses()) {
            participante.add("" + p.getLocal());

        }
        participante.add("Aciertos");
        totalParticipantes.add(participante);

        for (Jugador j : jugadores) {
            participante = new ArrayList<String>();
            participante.add("" + j.getJugador());
            participante.add("" + j.getCodigo());
            for (Partidos p : q.getPartidoses()) {
                System.out.println("id partido " + p.getIdpartidos());
                for (Jugadorresultados r : j.getJugadorresultadoses()) {
                    int idp = p.getIdpartidos();
                    int idj = r.getPartidos().getIdpartidos();
                    if (idp == idj) {
                        System.out.println("Local: " + p.getLocal() + " visita: " + p.getVisitante() + " id_partido: " + p.getIdpartidos() + " mi_resultado: " + r.getResultado() + "mi_resultado_id" + r.getPartidos().getIdpartidos());
                        participante.add("" + r.getResultado());
                    }
                }

            }
            participante.add("" + j.getAciertos());
            totalParticipantes.add(participante);
        }

        return totalParticipantes;
    }

    public List<Partidos> getPartidos(int idQuiniela) {
        Session session = this.sessionFactory.getCurrentSession();
        Query query = session.createQuery("FROM Partidos as p  WHERE p.quiniela.idquiniela = :id");
        // query.setParameter("nombre", userId);
        query.setParameter("id", idQuiniela);
        List<Partidos> list = query.list();
        return list;
    }

    public List<Quiniela> getQuinielasPagina(String idPagina) {
        //Pagina p = getPagina(idPagina);
        Session session = this.sessionFactory.getCurrentSession();
        Query query = session.createQuery("FROM Quiniela as q  WHERE q.paginaTipo  = :paginaTipo");

        query.setParameter("paginaTipo", idPagina);
        // query.setParameter("paginaTipo", p.getTipo());

        List<Quiniela> quinielas = query.list();
        // System.out.println("re432ffx " +  p.getTipo());
        return quinielas;
    }

    public List<Pagina> getPaginas(String nombre) {
        Session session = this.sessionFactory.getCurrentSession();
        Query query = session.createQuery("FROM Pagina as p WHERE p.users.username= :nombre  ");
        query.setParameter("nombre", nombre);
        List<Pagina> list = query.list();

        for (Pagina p : list) {

            System.out.println("Coronass: " + p.getUsers().getPassword());
        }

        return list;
    }

    public Boolean findOneGruop(String grupo) {
        if (findOnePagina(grupo) == true && findOneUser(grupo) == true) {
            return true;
        } else {
            return false;
        }

    }

    public Boolean findOnePagina(String username) {
        Session session = this.sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Pagina where nombre= :username ");
        query.setParameter("username", username);
        List<?> list = query.list();

        if (list.size() > 0) {
            System.out.println("true");
            return false;
        } else {
            System.out.println("false");
            return true;
        }

    }

    public Boolean findOneUser(String username) {
        Session session = this.sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Users where username= :username ");
        query.setParameter("username", username);
        List<?> list = query.list();

        if (list.size() > 0) {
            System.out.println("true");
            return false;
        } else {
            System.out.println("false");
            return true;
        }

    }

    public void addGrupo(Users user) {
        System.out.println("user: " + user.getUsername() + "userpassa " + user.getPassword() + " tipo: " + user.getPasswordConfirm());
        String tipoQuiniela = user.getTipoPaguina();
        Pagina p = getPaginaTipo(tipoQuiniela);

        System.out.println("xxxeee " + p);
        int actual = 0;
        if (p != null && !p.getTipo().equalsIgnoreCase("q_personal")) {
            actual = p.getActual();
        }
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        String nombrePagina = user.getUsername();
        String username = authentication.getName();
        Session session = this.sessionFactory.openSession();
        session.beginTransaction();
        session.save(user);
        session.save(new UserRoles(user, "ROLE_JUGADOR"));
        System.out.println("tipo quinielea: " + tipoQuiniela);

        System.out.println("username " + username);
        session.save(new Pagina(findByUserName(username), nombrePagina, actual, tipoQuiniela, null, "0", "0"));

        session.getTransaction().commit();
        System.out.println("user name " + user.getUsername());
    }

    public Pagina getPaginaTipo(String tipoPagina) {
        Session session = this.sessionFactory.getCurrentSession();
        Query query = session.createQuery("FROM Pagina as p WHERE p.tipo= :tipo ");
        query.setParameter("tipo", tipoPagina);
        List<?> list = query.list();
        if (list.size() > 0) {
            Pagina u = (Pagina) list.get(0);
            return u;
        } else {
            return null;
        }

    }

    public void updateUser(Users userGrupo) {
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        String hashedPassword = passwordEncoder.encode(userGrupo.getPassword());
        userGrupo.setPassword(hashedPassword);

        Session session = this.sessionFactory.getCurrentSession();
        session.update(userGrupo);

    }

    public void saveQuiniela(Quiniela quiniela) {
        for (Partidos p : quiniela.getPartidoses()) {
            System.out.println("Local: dao " + p.getLocal());
            System.out.println("Visitante: dao " + p.getVisitante());
        }
        // Pagina pagina = getPagina(quiniela.getPagina().getNombre());
        // quiniela.setPagina(pagina);
        // System.out.println("MuquiMuquiMuquiMuquiMuquiMuquiMuquiMuquiMuquiMuquiMuquiMuquiPagina " + pagina.getNombre() + " id " + pagina.getId());
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(quiniela);
        Quiniela quinielaInsertada = getQuiniela(quiniela.getNombre());
        System.out.println("quinielaInsertada" + quinielaInsertada.getIdquiniela());
        for (Partidos p : quiniela.getPartidoses()) {
            p.setQuiniela(quinielaInsertada);
            p.setGoleslocal(0);
            p.setGolesvisita(0);
            p.setResultado("-");
            session.persist(p);
        }
        // pagina.setActual(quinielaInsertada.getIdquiniela());
        //  session.update(pagina);
    }

    public List<Jugador> getjugadoresActualIdgrupo(int idGrupo) {

        Pagina pagina = getPaginaID(idGrupo);
        Session session = this.sessionFactory.getCurrentSession();
        Query query = session.createQuery("FROM Jugador as j WHERE j.quiniela.idquiniela = :id");

        query.setParameter("id", pagina.getActual());
        List<Jugador> list = query.list();
        return list;
    }

    public Pagina getPaginaID(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Query query = session.createQuery("FROM Pagina as p WHERE p.id= :id ");
        query.setParameter("id", id);
        List<?> list = query.list();
        Pagina u = (Pagina) list.get(0);

        return u;
    }

    public void eliminarJugador(String id) {
        Jugador jugador = getJugador(id);
        Session session = this.sessionFactory.getCurrentSession();
        session.delete(jugador);

    }

    public Jugador getJugador(String id) {

        Session session = this.sessionFactory.getCurrentSession();

        Query query = session.createQuery("FROM Jugador as j WHERE j.idjugar  = " + id);
        List<?> list = query.list();
        Jugador j = (Jugador) list.get(0);
        return j;
    }

    public void setQuinielaActualGrupo(String id, String grupo) {
        System.out.println("id Quiniela: " + id + "  id grupo: " + grupo);
        int idGrupo = Integer.parseInt(grupo);
        Pagina pagina = getPaginaID(idGrupo);
        int idQuiniela = Integer.parseInt(id);
        pagina.setActual(idQuiniela);
        Session session = this.sessionFactory.getCurrentSession();
        session.update(pagina);

    }

    public void updatequiniela(Quiniela quiniela, int idGrupo) {
        Pagina pagina = getPaginaID(idGrupo);
        quiniela.setPaginaTipo(pagina.getId().toString());

        Session session = this.sessionFactory.getCurrentSession();
        session.update(quiniela);
    }

    public void setQuinielaActual(String id) {
        int idQuiniela = Integer.parseInt(id);

        Quiniela quiniela = getQuiniela(idQuiniela);
        Session session = this.sessionFactory.getCurrentSession();
        Query query = session.createQuery("update Pagina set actual =" + quiniela.getIdquiniela() + "  where tipo = '" + quiniela.getPaginaTipo() + "'");
        query.executeUpdate();
        // session.update(pagina);
    }

    public Partidos getPartidoActualizar(String id) {
        Session session = this.sessionFactory.getCurrentSession();
        int entero = Integer.valueOf(id);
        Query query = session.createQuery("FROM Partidos as p WHERE p.idpartidos = " + entero);
        List<?> list = query.list();
        Partidos partido = (Partidos) list.get(0);
        return partido;

    }

    public List<Jugador> getjugadoresActual(int idQuiniela) {

        Session session = this.sessionFactory.getCurrentSession();
        Query query = session.createQuery("FROM Jugador as j WHERE j.quiniela.idquiniela = :id");

        query.setParameter("id", idQuiniela);
        List<Jugador> list = query.list();
        return list;
    }

    public void actualizarResultado(Partidos partido, int idQuiniela) {

        int glocal = partido.getGoleslocal();
        int gvisita = partido.getGolesvisita();
        System.out.println("goles local" + glocal + " goles visita " + gvisita);
        String idPartido = "" + partido.getIdpartidos();
        Partidos partidito = getPartidoActualizar(idPartido);
        if (glocal > gvisita) {
            partidito.setResultado("G");
        }
        if (glocal < gvisita) {
            partidito.setResultado("P");
        }
        if (glocal == gvisita) {
            partidito.setResultado("E");
        }
        partidito.setGoleslocal(glocal);
        partidito.setGolesvisita(gvisita);
        System.out.println("partidito " + partidito);
        System.out.println("goles local" + partidito.getGoleslocal() + " goles visita " + partidito.getVisitante());
        Session session = this.sessionFactory.getCurrentSession();
        session.update(partidito);
        calcularGanadores(idQuiniela);
    }

    public void calcularGanadores(int idQuiniela) {
        int aciertos = 0;
        int actual = idQuiniela;
        Quiniela q = getQuiniela(actual);
        System.out.println("Quiniela calcular Ganadores XXXXXXXXXXXXXXXXXXXXXXXXXXXX: " + q.getNombre());
        for (Jugador j : q.getJugadors()) {
            System.out.println("Nombre jugador" + j.getJugador());
            for (Jugadorresultados r : j.getJugadorresultadoses()) {
                //  System.out.println("Mis resultado " + r.getResultado() + " id partido: " + r.getPartidos().getIdpartidos());
                for (Partidos p : q.getPartidoses()) {
                    if (r.getPartidos().getIdpartidos() == p.getIdpartidos()) {
                        String oficial = p.getResultado();
                        String miResultado = r.getResultado();
                        int punto = miResultado.indexOf(oficial);
                        System.out.println("Mi resultado: " + miResultado + " Resultado OFICIAL: " + oficial + " punto: " + punto);

                        System.out.println("Los  resultado " + p.getIdpartidos() + " resultado oficial: " + p.getResultado());

                        // if (r.getResultado().equalsIgnoreCase(p.getResultado())) {
                        if (punto >= 0) {
                            aciertos = aciertos + 1;
                            System.out.println("Aciertos de " + j.getJugador() + "Total  " + aciertos);
                        }
                    }

                }

            }
            j.setAciertos(aciertos);
            System.out.println("Aciertos de " + j.getJugador() + "Total  " + j.getAciertos());
            Session session = this.sessionFactory.getCurrentSession();
            session.update(j);
            //  hibernateTemplate.update(j);
            aciertos = 0;

        }
    }

    public void updatequiniela(Quiniela quiniela) {

        // quiniela.setPagina(pagina);
//       
        Session session = this.sessionFactory.getCurrentSession();
        session.update(quiniela);

    }

    public List<Quiniela> getQuinielas() {

        Session session = this.sessionFactory.getCurrentSession();
        Query query = session.createQuery("FROM Quiniela ");

        List<Quiniela> quinielas = query.list();
        return quinielas;
    }

    public List<Pagina> getPaginas() {
        Session session = this.sessionFactory.getCurrentSession();
        Query query = session.createQuery("FROM Pagina");

        List<Pagina> list = query.list();

        for (Pagina p : list) {
            System.out.println("Corona: " + p.getNombre());
        }

        return list;
    }

    public Boolean findOneEmail(String email) {
        Session session = this.sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Users where email= :email ");
        query.setParameter("email", email);
        List<?> list = query.list();

        if (list.size() > 0) {
            System.out.println("true");
            return false;
        } else {
            System.out.println("false");
            return true;
        }
    }

    /**
     *
     * @param user
     * Crea usuarios nuevo, el primer usuario creado se crea con privilegios de administrador, los siguientes como usuarios.
     */
    @Override
    public void addUser(Users user) {
        //Encripta la contraseña
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        String hashedPassword = passwordEncoder.encode(user.getPassword());
        user.setPassword(hashedPassword);

        //setea la propiedad enable en true
        user.setEnabled(true);

        Session session = this.sessionFactory.openSession();
        session.beginTransaction();
        session.save(user);
        if (userList() == null) {
            //El primer usuario se crea con privilegios de administrador
             session.save(new UserRoles(user, "ROLE_ADMIN"));
        } else {
             session.save(new UserRoles(user, "ROLE_ADMIN_GRUPO"));
        }
      
        // session.save(new Pagina(user, user.getPagina(), 0, "quiniela", null, null));

        session.getTransaction().commit();
        System.out.println("user name " + user.getUsername() + "mas password " + user.getPassword());
    }

    /**
     *
     * @return regresa la lista de usuarios
     */
    public List<Users> userList() {

        Session session = this.sessionFactory.getCurrentSession();
        Query query = session.createQuery("FROM Users");

        List<Users> list = query.list();

        if (list.size() > 0) {
            return list;
        } else {

            return null;
        }
    }

    public Users findByUserEmail(String email) {
        Session session = this.sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Users where email= :email ");
        query.setParameter("email", email);
        List<?> list = query.list();
        Users u = (Users) list.get(0);

        System.out.println(u);

        return u;
    }

    public List<EstadisticaPartido> calcularTablaGeneral(int idLiga) {
        Session session = this.sessionFactory.getCurrentSession();
        Query query = session.createQuery("FROM EstadisticaPartido as e WHERE e.estadisticaTorneo.id = :id");
        query.setParameter("id", idLiga);
        List<EstadisticaPartido> list = query.list();

        return list;
    }

    public void saveClubTablaGeneral(int idLiga) {
        Session session = this.sessionFactory.getCurrentSession();
        List<Tablageneral> listablaGeneral = new ArrayList<Tablageneral>();
        List<String> nombres = new ArrayList<String>();
        Query query = session.createQuery(" delete from Tablageneral ");
        query.executeUpdate();
        List<EstadisticaPartido> partidos = calcularTablaGeneral(idLiga);
        for (EstadisticaPartido p : partidos) {
            if (!nombres.contains(p.getLocal())) {
                System.out.println("NO existe" + p.getLocal());
                listablaGeneral.add(new Tablageneral(idLiga, p.getLocal(), 0, 0, 0, 0, 0, 0, 0, 0));
                nombres.add(p.getLocal());
            }
            if (!nombres.contains(p.getVisita())) {
                System.out.println("NO existe" + p.getVisita());
                nombres.add(p.getVisita());
                listablaGeneral.add(new Tablageneral(idLiga, p.getVisita(), 0, 0, 0, 0, 0, 0, 0, 0));
            }
            for (Tablageneral t : listablaGeneral) {
                session.persist(t);
            }
        }
        for (EstadisticaPartido p : partidos) {
            String local = p.getLocal();
            String visita = p.getVisita();
            Tablageneral tablalocal = getEquipoTablaGeneral(local);
            Tablageneral tablavisita = getEquipoTablaGeneral(visita);

            try {
                int Jornada = Integer.parseInt(p.getJornada());
                System.out.println("Joranada399: " + p.getJornada());
                if (p.getGoleslocal() == p.getGolesvisita()) {
                    tablalocal.setPuntos(tablalocal.getPuntos() + 1);
                    tablavisita.setPuntos(tablavisita.getPuntos() + 1);
                    tablalocal.setJe(tablalocal.getJe() + 1);
                    tablavisita.setJe(tablavisita.getJe() + 1);

                }
                if (p.getGoleslocal() > p.getGolesvisita()) {
                    tablalocal.setPuntos(tablalocal.getPuntos() + 3);
                    tablalocal.setJg(tablalocal.getJg() + 1);
                    tablavisita.setJp(tablavisita.getJp() + 1);

                }
                if (p.getGoleslocal() < p.getGolesvisita()) {

                    tablavisita.setPuntos(tablavisita.getPuntos() + 3);
                    tablavisita.setJg(tablavisita.getJg() + 1);
                    tablalocal.setJp(tablalocal.getJp() + 1);
                }
                //LOCAL
                tablalocal.setJj(tablalocal.getJj() + 1);
                //VISITA
                tablavisita.setJj(tablavisita.getJj() + 1);

                tablalocal.setGf(tablalocal.getGf() + p.getGoleslocal());
                tablavisita.setGc(tablavisita.getGc() + p.getGoleslocal());
                tablavisita.setGf(tablavisita.getGf() + p.getGolesvisita());
                tablalocal.setGc(tablalocal.getGc() + p.getGolesvisita());
                tablalocal.setDif(tablalocal.getGf() - tablalocal.getGc());
                tablavisita.setDif(tablavisita.getGf() - tablavisita.getGc());
                session.update(tablalocal);
                session.update(tablavisita);
            } catch (Exception e) {
            }

        }

    }

    public Tablageneral getEquipoTablaGeneral(String club) {
        Session session = this.sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Tablageneral where club= :club ");
        query.setParameter("club", club);
        List<?> list = query.list();
        Tablageneral u = (Tablageneral) list.get(0);

        System.out.println(u);

        return u;
    }

    boolean isClubTablaGeneral(String club) {
        Session session = this.sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Tablageneral where club= :club ");
        query.setParameter("club", club);
        List<?> list = query.list();

        return list == null ? true : false;

    }

    public List<Tablageneral> getTablaGeneral() {
        Session session = this.sessionFactory.getCurrentSession();
        Query query = session.createQuery("FROM Tablageneral order by puntos desc ,dif desc");

        List<Tablageneral> list = query.list();

        return list;
    }

    public List<List<String>> getParticipantesSinLoginImprimir(Integer actual, String userId) {
        List<List<String>> totalParticipantes = new ArrayList<List<String>>();
        List<String> participante = null;
        Quiniela q = getQuiniela(actual);

        Session session = this.sessionFactory.getCurrentSession();
        Query query = session.createQuery("FROM Jugador as j WHERE j.quiniela.idquiniela = :id and j.users.username = :username order by j.aciertos desc ");
        query.setParameter("id", q.getIdquiniela());

        query.setParameter("username", userId);
        List<Jugador> jugadores = query.list();
        participante = new ArrayList<String>();
        participante.add("Jugador");
        //participante.add("Codigo");

        for (Partidos p : q.getPartidoses()) {
            participante.add("" + p.getLocal() + " vs " + p.getVisitante());

        }
        //participante.add("Aciertos");
        totalParticipantes.add(participante);

        for (Jugador j : jugadores) {
            participante = new ArrayList<String>();
            participante.add("" + j.getJugador());
            //  participante.add("" + j.getCodigo());
            for (Partidos p : q.getPartidoses()) {
                System.out.println("id partido " + p.getIdpartidos());
                for (Jugadorresultados r : j.getJugadorresultadoses()) {
                    int idp = p.getIdpartidos();
                    int idj = r.getPartidos().getIdpartidos();
                    if (idp == idj) {
                        System.out.println("Local: " + p.getLocal() + " visita: " + p.getVisitante() + " id_partido: " + p.getIdpartidos() + " mi_resultado: " + r.getResultado() + "mi_resultado_id" + r.getPartidos().getIdpartidos());
                        participante.add("" + r.getResultado());
                    }
                }

            }
            //participante.add("" + j.getAciertos());
            totalParticipantes.add(participante);
        }

        return totalParticipantes;
    }

    public List<EstadisticaTorneo> getLigas() {
        Session session = this.sessionFactory.getCurrentSession();
        Query query = session.createQuery("FROM EstadisticaTorneo ");

        List<EstadisticaTorneo> list = query.list();

        return list;
    }

    public String getnombreliga() {
        Session session = this.sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Tablageneral");
        List<?> list = query.list();
        Tablageneral u = (Tablageneral) list.get(0);
        int id = u.getIdLiga();
        System.out.println("idw" + id);
        query = session.createQuery("from EstadisticaTorneo where id= :id ");
        query.setParameter("id", id);
        List<?> listq = query.list();
        EstadisticaTorneo q = (EstadisticaTorneo) listq.get(0);
        return q.getNombre();
    }

    public Pagina getPagina(int idPagina) {
        Session session = this.sessionFactory.getCurrentSession();
        Query query = session.createQuery("FROM Pagina as p WHERE p.id= :id ");
        query.setParameter("id", idPagina);
        List<?> list = query.list();
        Pagina u = (Pagina) list.get(0);

        return u;
    }

    public void updatePagina(Pagina pagina) {
        String dobles = pagina.getDobles();
        String triples = pagina.getTriples();
        int id = pagina.getId();

        pagina = getPagina(id);
        pagina.setDobles(dobles);
        pagina.setTriples(triples);

        Session session = this.sessionFactory.getCurrentSession();
        session.update(pagina);

    }

    public List<Partidos> getPartidosIdGrupo(String idGrupo) {
        int idPagina = Integer.parseInt(idGrupo);
        Pagina pagina = getPaginaID(idPagina);
        int actual = pagina.getActual();
        System.out.println("Pagina selecccionasda   ID ::::::::::::::::::::::::::::::::::: " + actual);
        Session session = this.sessionFactory.getCurrentSession();
        Query query = session.createQuery("FROM Partidos as p  WHERE p.quiniela.idquiniela = :id");
        // query.setParameter("nombre", userId);
        query.setParameter("id", actual);
        List<Partidos> list = query.list();
        return list;
    }

    public void actualizarResultadoIdGrupo(Partidos partido, String idGrupo) {

        int glocal = partido.getGoleslocal();
        int gvisita = partido.getGolesvisita();
        System.out.println("goles local" + glocal + " goles visita " + gvisita);
        String idPartido = "" + partido.getIdpartidos();
        Partidos partidito = getPartidoActualizar(idPartido);
        if (glocal > gvisita) {
            partidito.setResultado("G");
        }
        if (glocal < gvisita) {
            partidito.setResultado("P");
        }
        if (glocal == gvisita) {
            partidito.setResultado("E");
        }
        partidito.setGoleslocal(glocal);
        partidito.setGolesvisita(gvisita);
        System.out.println("partidito " + partidito);
        System.out.println("goles local" + partidito.getGoleslocal() + " goles visita " + partidito.getVisitante());
        Session session = this.sessionFactory.getCurrentSession();
        session.update(partidito);
        calcularGanadoresIDGrupo(idGrupo);
    }

    public void calcularGanadoresIDGrupo(String idGrupo) {
        int aciertos = 0;
        int idGrupoInt = Integer.parseInt(idGrupo);
        Pagina pagina = getPaginaID(idGrupoInt);
        int actual = pagina.getActual();

        Quiniela q = getQuiniela(actual);
        System.out.println("Quiniela calcular Ganadores XXXXXXXXXXXXXXXXXXXXXXXXXXXX: " + q.getNombre());
        for (Jugador j : q.getJugadors()) {
            System.out.println("Nombre jugador" + j.getJugador());
            for (Jugadorresultados r : j.getJugadorresultadoses()) {
                System.out.println("Mis resultado " + r.getResultado() + " id partido: " + r.getPartidos().getIdpartidos());
                for (Partidos p : q.getPartidoses()) {
                    if (r.getPartidos().getIdpartidos() == p.getIdpartidos()) {
                        String oficial = p.getResultado();
                        String miResultado = r.getResultado();
                        int punto = miResultado.indexOf(oficial);
                        System.out.println("Los  resultado " + p.getIdpartidos() + " resultado oficial: " + p.getResultado());
                        // if(r.getResultado() == p.getResultado()){
                        // if (r.getResultado().equalsIgnoreCase(p.getResultado())) {
                        if (punto >= 0) {
                            aciertos = aciertos + 1;
                            System.out.println("Aciertos de " + j.getJugador() + "Total  " + aciertos);
                        }
                    }

                }

            }
            j.setAciertos(aciertos);
            System.out.println("Aciertos de " + j.getJugador() + "Total  " + j.getAciertos());
            Session session = this.sessionFactory.getCurrentSession();
            session.update(j);
            //  hibernateTemplate.update(j);
            aciertos = 0;

        }
    }

    @Override
    public void eliminarGrupo(String nombre) {
        Pagina grupo = getPagina(nombre);
        Users user = findByUserName(nombre);
        Session session = this.sessionFactory.getCurrentSession();
        session.delete(grupo);
        session.delete(user);
    }

    @Override
    public boolean getEmail(String email) {
        Session session = this.sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Users where email= :email ");
        query.setParameter("email", email);
        List<?> list = query.list();

        if (list.size() > 0) {
            System.out.println("true");
            return false;
        } else {
            System.out.println("false");
            return true;
        }
    }

    @Override
    public boolean getUusername(String username) {
        Session session = this.sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Users where username= :username ");
        query.setParameter("username", username);
        List<?> list = query.list();

        if (list.size() > 0) {
            System.out.println("true");
            return false;
        } else {
            System.out.println("false");
            return true;
        }
    }
}
