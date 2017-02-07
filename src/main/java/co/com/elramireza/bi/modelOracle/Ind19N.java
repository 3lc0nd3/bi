package co.com.elramireza.bi.modelOracle;

import javax.persistence.*;

/**
 * Created by usuariox on 6/02/17.
 * elramireza@gmail.com
 */
@Entity
@Table(name = "IND_19_N")
public class Ind19N {
    private int n19Aaaamm;
    private Integer n19Valor;

    @Id
    @Column(name = "n19_aaaamm")
    public int getN19Aaaamm() {
        return n19Aaaamm;
    }

    public void setN19Aaaamm(int n19Aaaamm) {
        this.n19Aaaamm = n19Aaaamm;
    }

    @Basic
    @Column(name = "n19_valor")
    public Integer getN19Valor() {
        return n19Valor;
    }

    public void setN19Valor(Integer n19Valor) {
        this.n19Valor = n19Valor;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Ind19N ind19N = (Ind19N) o;

        if (n19Aaaamm != ind19N.n19Aaaamm) return false;
        if (n19Valor != null ? !n19Valor.equals(ind19N.n19Valor) : ind19N.n19Valor != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = n19Aaaamm;
        result = 31 * result + (n19Valor != null ? n19Valor.hashCode() : 0);
        return result;
    }
}
