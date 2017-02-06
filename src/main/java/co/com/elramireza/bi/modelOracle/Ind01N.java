package co.com.elramireza.bi.modelOracle;

import javax.persistence.*;

/**
 * Created by usuariox on 5/02/17.
 * elramireza@gmail.com
 */
@Entity
@Table(name = "IND_01_N")
public class Ind01N {
    private int n01Aaaamm;
    private int n01Valor;

    @Id
    @Column(name = "n01_aaaamm")
    public int getN01Aaaamm() {
        return n01Aaaamm;
    }

    public void setN01Aaaamm(int n01Aaaamm) {
        this.n01Aaaamm = n01Aaaamm;
    }

    @Basic
    @Column(name = "n01_valor")
    public int getN01Valor() {
        return n01Valor;
    }

    public void setN01Valor(int n01Valor) {
        this.n01Valor = n01Valor;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Ind01N ind01N = (Ind01N) o;

        if (n01Aaaamm != ind01N.n01Aaaamm) return false;
        if (n01Valor != ind01N.n01Valor) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = n01Aaaamm;
        result = 31 * result + n01Valor;
        return result;
    }
}
