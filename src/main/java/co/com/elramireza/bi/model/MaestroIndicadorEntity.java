package co.com.elramireza.bi.model;

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
}

