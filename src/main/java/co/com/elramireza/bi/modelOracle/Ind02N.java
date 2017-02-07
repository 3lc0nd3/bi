package co.com.elramireza.bi.modelOracle;

import javax.persistence.*;

/**
 * Created by usuariox on 6/02/17.
 * elramireza@gmail.com
 */
@Entity
@Table(name = "IND_02_N")
public class Ind02N {
    private int n02Aaaamm;
    private Integer n02Valor;

    @Id
    @Column(name = "n02_aaaamm")
    public int getN02Aaaamm() {
        return n02Aaaamm;
    }

    public void setN02Aaaamm(int n02Aaaamm) {
        this.n02Aaaamm = n02Aaaamm;
    }

    @Basic
    @Column(name = "n02_valor")
    public Integer getN02Valor() {
        return n02Valor;
    }

    public void setN02Valor(Integer n02Valor) {
        this.n02Valor = n02Valor;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Ind02N ind02N = (Ind02N) o;

        if (n02Aaaamm != ind02N.n02Aaaamm) return false;
        if (n02Valor != null ? !n02Valor.equals(ind02N.n02Valor) : ind02N.n02Valor != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = n02Aaaamm;
        result = 31 * result + (n02Valor != null ? n02Valor.hashCode() : 0);
        return result;
    }
}
