package co.com.elramireza.bi.modelOracle;

import javax.persistence.*;

/**
 * Created by usuariox on 6/02/17.
 * elramireza@gmail.com
 */
@Entity
@Table(name = "IND_21_N", schema = "orabi", catalog = "")
public class Ind21N {
    private int n21Aaaamm;
    private Integer n21Valor;

    @Id
    @Column(name = "n21_aaaamm")
    public int getN21Aaaamm() {
        return n21Aaaamm;
    }

    public void setN21Aaaamm(int n21Aaaamm) {
        this.n21Aaaamm = n21Aaaamm;
    }

    @Basic
    @Column(name = "n21_valor")
    public Integer getN21Valor() {
        return n21Valor;
    }

    public void setN21Valor(Integer n21Valor) {
        this.n21Valor = n21Valor;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Ind21N ind21N = (Ind21N) o;

        if (n21Aaaamm != ind21N.n21Aaaamm) return false;
        if (n21Valor != null ? !n21Valor.equals(ind21N.n21Valor) : ind21N.n21Valor != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = n21Aaaamm;
        result = 31 * result + (n21Valor != null ? n21Valor.hashCode() : 0);
        return result;
    }
}
