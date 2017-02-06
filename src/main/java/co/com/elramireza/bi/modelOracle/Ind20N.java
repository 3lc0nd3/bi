package co.com.elramireza.bi.modelOracle;

import javax.persistence.*;

/**
 * Created by usuariox on 6/02/17.
 * elramireza@gmail.com
 */
@Entity
@Table(name = "IND_20_N", schema = "orabi", catalog = "")
public class Ind20N {
    private int n20Aaaamm;
    private Integer n20Valor;

    @Id
    @Column(name = "n20_aaaamm")
    public int getN20Aaaamm() {
        return n20Aaaamm;
    }

    public void setN20Aaaamm(int n20Aaaamm) {
        this.n20Aaaamm = n20Aaaamm;
    }

    @Basic
    @Column(name = "n20_valor")
    public Integer getN20Valor() {
        return n20Valor;
    }

    public void setN20Valor(Integer n20Valor) {
        this.n20Valor = n20Valor;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Ind20N ind20N = (Ind20N) o;

        if (n20Aaaamm != ind20N.n20Aaaamm) return false;
        if (n20Valor != null ? !n20Valor.equals(ind20N.n20Valor) : ind20N.n20Valor != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = n20Aaaamm;
        result = 31 * result + (n20Valor != null ? n20Valor.hashCode() : 0);
        return result;
    }
}
