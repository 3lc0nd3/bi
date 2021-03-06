package co.com.elramireza.bi.model;

import org.hibernate.annotations.Type;

import javax.persistence.*;
import java.sql.Date;

/**
 * Created by usuariox on 25/08/16.
 */
@Entity
@Table(name = "maestro_indicador")
public class MaestroIndicadorEntity {
    private int id;
    private String nombre;
    private String var1;
    private String var2;
    private int aceptacionArribaAbajo;
    private double aceptacion;
    private String criterio;

    private boolean estaOracleN;
    private boolean estaOracleD;

    private boolean editaN;
    private boolean editaD;


    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "nombre")
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    @Basic
    @Column(name = "var_1")
    public String getVar1() {
        return var1;
    }

    public void setVar1(String var1) {
        this.var1 = var1;
    }

    @Basic
    @Column(name = "var_2")
    public String getVar2() {
        return var2;
    }

    public void setVar2(String var2) {
        this.var2 = var2;
    }

    @Basic
    @Column(name = "aceptacion_arriba_abajo")
    public int getAceptacionArribaAbajo() {
        return aceptacionArribaAbajo;
    }

    public void setAceptacionArribaAbajo(int aceptacionArribaAbajo) {
        this.aceptacionArribaAbajo = aceptacionArribaAbajo;
    }

    @Basic
    @Column(name = "aceptacion")
    public double getAceptacion() {
        return aceptacion;
    }

    public void setAceptacion(double aceptacion) {
        this.aceptacion = aceptacion;
    }


    @Basic
    @Column(name = "criterio")
    public String getCriterio() {
        return criterio;
    }

    public void setCriterio(String criterio) {
        this.criterio = criterio;
    }

    @Basic
    @Column(name = "esta_oracle_n")
    @Type(type = "org.hibernate.type.NumericBooleanType")
    public boolean isEstaOracleN() {
        return estaOracleN;
    }

    public void setEstaOracleN(boolean estaOracleN) {
        this.estaOracleN = estaOracleN;
    }

    @Basic
    @Column(name = "esta_oracle_d")
    @Type(type = "org.hibernate.type.NumericBooleanType")
    public boolean isEstaOracleD() {
        return estaOracleD;
    }

    public void setEstaOracleD(boolean estaOracleD) {
        this.estaOracleD = estaOracleD;
    }

    @Basic
    @Column(name = "edita_n")
    @Type(type = "org.hibernate.type.NumericBooleanType")
    public boolean isEditaN() {
        return editaN;
    }

    public void setEditaN(boolean editaN) {
        this.editaN = editaN;
    }

    @Basic
    @Column(name = "edita_d")
    @Type(type = "org.hibernate.type.NumericBooleanType")
    public boolean isEditaD() {
        return editaD;
    }

    public void setEditaD(boolean editaD) {
        this.editaD = editaD;
    }
}

