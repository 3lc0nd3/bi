package co.com.elramireza.bi.modelOracle;

import javax.persistence.*;

/**
 * Created by usuariox on 6/02/17.
 * elramireza@gmail.com
 */
@Entity
@Table(name = "IND_11_D", schema = "orabi", catalog = "")
public class Ind11D {
    private int d11Aaaamm;
    private Integer n11Valor;

    @Id
    @Column(name = "d11_aaaamm")
    public int getD11Aaaamm() {
        return d11Aaaamm;
    }

    public void setD11Aaaamm(int d11Aaaamm) {
        this.d11Aaaamm = d11Aaaamm;
    }

    @Basic
    @Column(name = "n11_valor")
    public Integer getN11Valor() {
        return n11Valor;
    }

    public void setN11Valor(Integer n11Valor) {
        this.n11Valor = n11Valor;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Ind11D ind11D = (Ind11D) o;

        if (d11Aaaamm != ind11D.d11Aaaamm) return false;
        if (n11Valor != null ? !n11Valor.equals(ind11D.n11Valor) : ind11D.n11Valor != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = d11Aaaamm;
        result = 31 * result + (n11Valor != null ? n11Valor.hashCode() : 0);
        return result;
    }
}
