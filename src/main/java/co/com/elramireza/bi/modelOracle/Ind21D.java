package co.com.elramireza.bi.modelOracle;

import javax.persistence.*;

/**
 * Created by usuariox on 6/02/17.
 * elramireza@gmail.com
 */
@Entity
@Table(name = "IND_21_D")
public class Ind21D {
    private int d21Aaaamm;
    private Integer d21Valor;

    @Id
    @Column(name = "d21_aaaamm")
    public int getD21Aaaamm() {
        return d21Aaaamm;
    }

    public void setD21Aaaamm(int d21Aaaamm) {
        this.d21Aaaamm = d21Aaaamm;
    }

    @Basic
    @Column(name = "d21_valor")
    public Integer getD21Valor() {
        return d21Valor;
    }

    public void setD21Valor(Integer d21Valor) {
        this.d21Valor = d21Valor;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Ind21D ind21D = (Ind21D) o;

        if (d21Aaaamm != ind21D.d21Aaaamm) return false;
        if (d21Valor != null ? !d21Valor.equals(ind21D.d21Valor) : ind21D.d21Valor != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = d21Aaaamm;
        result = 31 * result + (d21Valor != null ? d21Valor.hashCode() : 0);
        return result;
    }
}
