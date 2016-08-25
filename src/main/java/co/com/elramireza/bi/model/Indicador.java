package co.com.elramireza.bi.model;

import javax.persistence.*;

/**
 * Created by usuariox on 19/08/16.
 */
@Entity
@Table(name = "indicador")
public class Indicador {
    private int id;
//    private int idIndicador;
    private MaestroIndicadorEntity maestroIndicador;
    private String version;
    private int fecha;
    private double variable1;
    private double variable2;
    private double indicador;
    private double aceptacion;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @ManyToOne
    @JoinColumn(name = "id_indicador", referencedColumnName = "id")
    public MaestroIndicadorEntity getMaestroIndicador() {
        return maestroIndicador;
    }

    public void setMaestroIndicador(MaestroIndicadorEntity maestroIndicador) {
        this.maestroIndicador = maestroIndicador;
    }

    @Basic
    @Column(name = "version")
    public String getVersion() {
        return version;
    }

    public void setVersion(String version) {
        this.version = version;
    }

    @Basic
    @Column(name = "fecha")
    public int getFecha() {
        return fecha;
    }

    public void setFecha(int fecha) {
        this.fecha = fecha;
    }

    @Basic
    @Column(name = "variable_1")
    public double getVariable1() {
        return variable1;
    }

    public void setVariable1(double variable1) {
        this.variable1 = variable1;
    }

    @Basic
    @Column(name = "variable_2")
    public double getVariable2() {
        return variable2;
    }

    public void setVariable2(double variable2) {
        this.variable2 = variable2;
    }

    @Basic
    @Column(name = "indicador")
    public double getIndicador() {
        return indicador;
    }

    public void setIndicador(double indicador) {
        this.indicador = indicador;
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
