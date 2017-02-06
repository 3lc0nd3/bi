package co.com.elramireza.bi.modelOracle;

import javax.persistence.*;

/**
 * Created by usuariox on 6/02/17.
 * elramireza@gmail.com
 */
@Entity
@Table(name = "IND_24_N", schema = "orabi", catalog = "")
public class Ind24N {
    private int n24Aaaamm;
    private Integer n24Valor;

    @Id
    @Column(name = "n24_aaaamm")
    public int getN24Aaaamm() {
        return n24Aaaamm;
    }

    public void setN24Aaaamm(int n24Aaaamm) {
        this.n24Aaaamm = n24Aaaamm;
    }

    @Basic
    @Column(name = "n24_valor")
    public Integer getN24Valor() {
        return n24Valor;
    }

    public void setN24Valor(Integer n24Valor) {
        this.n24Valor = n24Valor;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Ind24N ind24N = (Ind24N) o;

        if (n24Aaaamm != ind24N.n24Aaaamm) return false;
        if (n24Valor != null ? !n24Valor.equals(ind24N.n24Valor) : ind24N.n24Valor != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = n24Aaaamm;
        result = 31 * result + (n24Valor != null ? n24Valor.hashCode() : 0);
        return result;
    }
}
