package co.com.elramireza.bi.modelOracle;

import javax.persistence.*;

/**
 * Created by usuariox on 6/02/17.
 * elramireza@gmail.com
 */
@Entity
@Table(name = "IND_25_D")
public class Ind25D {
    private int d25Aaaamm;
    private Integer d25Valor;

    @Id
    @Column(name = "d25_aaaamm")
    public int getD25Aaaamm() {
        return d25Aaaamm;
    }

    public void setD25Aaaamm(int d25Aaaamm) {
        this.d25Aaaamm = d25Aaaamm;
    }

    @Basic
    @Column(name = "d25_valor")
    public Integer getD25Valor() {
        return d25Valor;
    }

    public void setD25Valor(Integer d25Valor) {
        this.d25Valor = d25Valor;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Ind25D ind25D = (Ind25D) o;

        if (d25Aaaamm != ind25D.d25Aaaamm) return false;
        if (d25Valor != null ? !d25Valor.equals(ind25D.d25Valor) : ind25D.d25Valor != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = d25Aaaamm;
        result = 31 * result + (d25Valor != null ? d25Valor.hashCode() : 0);
        return result;
    }
}
