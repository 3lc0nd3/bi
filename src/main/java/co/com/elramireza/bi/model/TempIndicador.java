package co.com.elramireza.bi.model;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

/**
 * Created by usuariox on 7/02/17.
 * elramireza@gmail.com
 */
@Entity
@Table(name = "temp_indicador")
public class TempIndicador {

    private int idTemp;
    private int idIndicador;
    private int fecha;
    private int valor;

    @Id
    @GenericGenerator(name = "generator", strategy = "increment")
    @GeneratedValue(generator = "generator")
    @Column(name = "id")
    public int getIdTemp() {
        return idTemp;
    }

    public void setIdTemp(int idTemp) {
        this.idTemp = idTemp;
    }

    @Basic
    @Column(name = "id_indicador")
    public int getIdIndicador() {
        return idIndicador;
    }

    public void setIdIndicador(int idIndicador) {
        this.idIndicador = idIndicador;
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
    @Column(name = "valor")
    public int getValor() {
        return valor;
    }

    public void setValor(int valor) {
        this.valor = valor;
    }
}
