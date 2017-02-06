package co.com.elramireza.bi.modelOracle;

import javax.persistence.*;

/**
 * Created by usuariox on 5/02/17.
 * elramireza@gmail.com
 */
@Entity
@Table(name = "IND_01_D")
public class Ind01D {
    private int d01Aaaamm;
    private int d01Valor;

    @Id
    @Column(name = "d01_aaaamm")
    public int getD01Aaaamm() {
        return d01Aaaamm;
    }

    public void setD01Aaaamm(int d01Aaaamm) {
        this.d01Aaaamm = d01Aaaamm;
    }

    @Basic
    @Column(name = "d01_valor")
    public int getD01Valor() {
        return d01Valor;
    }

    public void setD01Valor(int d01Valor) {
        this.d01Valor = d01Valor;
    }

}
