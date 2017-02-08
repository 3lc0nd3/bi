package co.com.elramireza.bi.model;

import javax.persistence.*;

/**
 * Created by usuariox on 7/02/17.
 * elramireza@gmail.com
 */
@Entity
@Table(name = "indicador_agrupado_mes")
public class IndicadorAgrupadoMes {

    private int idIndicador;
    private String version;
    private int fecha;
    private int n;
    private int d;


    private double indicador;
    private double aceptacion;

    @Basic
    @Column(name = "id_indicador")
    public int getIdIndicador() {
        return idIndicador;
    }

    public void setIdIndicador(int idIndicador) {
        this.idIndicador = idIndicador;
    }

    @Basic
    @Column(name = "version")
    public String getVersion() {
        return version;
    }

    public void setVersion(String version) {
        this.version = version;
    }

    @Id
    @Column(name = "fecha")
    public int getFecha() {
        return fecha;
    }

    public void setFecha(int fecha) {
        this.fecha = fecha;
    }

    @Basic
    @Column(name = "n")
    public int getN() {
        return n;
    }

    public void setN(int n) {
        this.n = n;
    }

    @Basic
    @Column(name = "d")
    public int getD() {
        return d;
    }

    public void setD(int d) {
        this.d = d;
    }

    @Transient
    public double getIndicador() {
        return indicador;
    }

    public void setIndicador(double indicador) {
        this.indicador = indicador;
    }

    @Transient
    public double getAceptacion() {
        return aceptacion;
    }

    public void setAceptacion(double aceptacion) {
        this.aceptacion = aceptacion;
    }
}
