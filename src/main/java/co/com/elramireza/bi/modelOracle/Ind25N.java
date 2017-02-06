package co.com.elramireza.bi.modelOracle;

import javax.persistence.*;

/**
 * Created by usuariox on 6/02/17.
 * elramireza@gmail.com
 */
@Entity
@Table(name = "IND_25_N", schema = "orabi", catalog = "")
public class Ind25N {
    private int n25Aaaamm;
    private Integer n25Valor;

    @Id
    @Column(name = "n25_aaaamm")
    public int getN25Aaaamm() {
        return n25Aaaamm;
    }

    public void setN25Aaaamm(int n25Aaaamm) {
        this.n25Aaaamm = n25Aaaamm;
    }

    @Basic
    @Column(name = "n25_valor")
    public Integer getN25Valor() {
        return n25Valor;
    }

    public void setN25Valor(Integer n25Valor) {
        this.n25Valor = n25Valor;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Ind25N ind25N = (Ind25N) o;

        if (n25Aaaamm != ind25N.n25Aaaamm) return false;
        if (n25Valor != null ? !n25Valor.equals(ind25N.n25Valor) : ind25N.n25Valor != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = n25Aaaamm;
        result = 31 * result + (n25Valor != null ? n25Valor.hashCode() : 0);
        return result;
    }
}
