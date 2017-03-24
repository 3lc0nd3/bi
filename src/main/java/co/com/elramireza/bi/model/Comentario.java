package co.com.elramireza.bi.model;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * Created by usuariox on 23/03/17.
 * elramireza@gmail.com
 */
@Entity
@Table(name = "comentario")
public class Comentario {
    private int idComentario;
    private MaestroIndicadorEntity maestroIndicador;
    private int periodo;
    private String texto;
    private Timestamp fechaRegistro;
    private int idUsuario;

    @Id
    @Column(name = "id_comentario")
    public int getIdComentario() {
        return idComentario;
    }

    public void setIdComentario(int idComentario) {
        this.idComentario = idComentario;
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
    @Column(name = "periodo")
    public int getPeriodo() {
        return periodo;
    }

    public void setPeriodo(int periodo) {
        this.periodo = periodo;
    }

    @Basic
    @Column(name = "texto")
    public String getTexto() {
        return texto;
    }

    public void setTexto(String texto) {
        this.texto = texto;
    }

    @Basic
    @Column(name = "fecha_registro")
    public Timestamp getFechaRegistro() {
        return fechaRegistro;
    }

    public void setFechaRegistro(Timestamp fechaRegistro) {
        this.fechaRegistro = fechaRegistro;
    }

    @Basic
    @Column(name = "id_usuario")
    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }


}
