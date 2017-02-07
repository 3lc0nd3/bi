package co.com.elramireza.bi.modelOracle;

import javax.persistence.*;

/**
 * Created by usuariox on 6/02/17.
 * elramireza@gmail.com
 */
@Entity
@Table(name = "IND_08_N")
public class Ind08N {
    private int n08Aaaamm;
    private Integer n08Valor;

    @Id
    @Column(name = "n08_aaaamm")
    public int getN08Aaaamm() {
        return n08Aaaamm;
    }

    public void setN08Aaaamm(int n08Aaaamm) {
        this.n08Aaaamm = n08Aaaamm;
    }

    @Basic
    @Column(name = "n08_valor")
    public Integer getN08Valor() {
        return n08Valor;
    }

    public void setN08Valor(Integer n08Valor) {
        this.n08Valor = n08Valor;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Ind08N ind08N = (Ind08N) o;

        if (n08Aaaamm != ind08N.n08Aaaamm) return false;
        if (n08Valor != null ? !n08Valor.equals(ind08N.n08Valor) : ind08N.n08Valor != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = n08Aaaamm;
        result = 31 * result + (n08Valor != null ? n08Valor.hashCode() : 0);
        return result;
    }
}
