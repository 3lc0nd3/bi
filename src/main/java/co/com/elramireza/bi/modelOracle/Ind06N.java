package co.com.elramireza.bi.modelOracle;

import javax.persistence.*;

/**
 * Created by usuariox on 6/02/17.
 * elramireza@gmail.com
 */
@Entity
@Table(name = "IND_06_N", schema = "orabi", catalog = "")
public class Ind06N {
    private int n06Aaaamm;
    private Integer n06Valor;

    @Id
    @Column(name = "n06_aaaamm")
    public int getN06Aaaamm() {
        return n06Aaaamm;
    }

    public void setN06Aaaamm(int n06Aaaamm) {
        this.n06Aaaamm = n06Aaaamm;
    }

    @Basic
    @Column(name = "n06_valor")
    public Integer getN06Valor() {
        return n06Valor;
    }

    public void setN06Valor(Integer n06Valor) {
        this.n06Valor = n06Valor;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Ind06N ind06N = (Ind06N) o;

        if (n06Aaaamm != ind06N.n06Aaaamm) return false;
        if (n06Valor != null ? !n06Valor.equals(ind06N.n06Valor) : ind06N.n06Valor != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = n06Aaaamm;
        result = 31 * result + (n06Valor != null ? n06Valor.hashCode() : 0);
        return result;
    }
}
