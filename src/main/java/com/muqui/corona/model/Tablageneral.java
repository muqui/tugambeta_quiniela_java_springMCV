package com.muqui.corona.model;
// Generated 10/07/2017 03:21:59 PM by Hibernate Tools 4.3.1


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Tablageneral generated by hbm2java
 */
@Entity
@Table(name="tablageneral")
public class Tablageneral  implements java.io.Serializable {


     private Integer id;
     private Integer idLiga;
     private String club;
     private Integer jj;
     private Integer jg;
     private Integer je;
      private Integer jp;
     private Integer gf;
     private Integer gc;
     private Integer dif;
     private Integer puntos;

    public Tablageneral() {
    }

    public Tablageneral(Integer idLiga, String club, Integer jj, Integer jg, Integer je,Integer jp, Integer gf, Integer gc, Integer dif, Integer puntos) {
       this.idLiga = idLiga;
       this.club = club;
       this.jj = jj;
       this.jg = jg;
       this.je = je;
       this.jp = jp;
       this.gf = gf;
       this.gc = gc;
       this.dif = dif;
       this.puntos = puntos;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="id", unique=true, nullable=false)
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }

    
    @Column(name="id_liga")
    public Integer getIdLiga() {
        return this.idLiga;
    }
    
    public void setIdLiga(Integer idLiga) {
        this.idLiga = idLiga;
    }

    
    @Column(name="club", length=50)
    public String getClub() {
        return this.club;
    }
    
    public void setClub(String club) {
        this.club = club;
    }

    
    @Column(name="jj")
    public Integer getJj() {
        return this.jj;
    }
    
    public void setJj(Integer jj) {
        this.jj = jj;
    }

    
    @Column(name="jg")
    public Integer getJg() {
        return this.jg;
    }
    
    public void setJg(Integer jg) {
        this.jg = jg;
    }

    
    @Column(name="je")
    public Integer getJe() {
        return this.je;
    }
    
    public void setJe(Integer je) {
        this.je = je;
    }

    
    @Column(name="gf")
    public Integer getGf() {
        return this.gf;
    }
    
    public void setGf(Integer gf) {
        this.gf = gf;
    }

    
    @Column(name="gc")
    public Integer getGc() {
        return this.gc;
    }
    
    public void setGc(Integer gc) {
        this.gc = gc;
    }

    
    @Column(name="dif")
    public Integer getDif() {
        return this.dif;
    }
    
    public void setDif(Integer dif) {
        this.dif = dif;
    }

    
    @Column(name="puntos")
    public Integer getPuntos() {
        return this.puntos;
    }
    
    public void setPuntos(Integer puntos) {
        this.puntos = puntos;
    }

    /**
     * @return the jp
     */
      @Column(name="jp")
    public Integer getJp() {
        return jp;
    }

    /**
     * @param jp the jp to set
     */
    public void setJp(Integer jp) {
        this.jp = jp;
    }




}


