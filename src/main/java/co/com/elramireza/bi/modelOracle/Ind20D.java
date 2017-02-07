package co.com.elramireza.bi.modelOracle;

import javax.persistence.*;

/**
 * Created by usuariox on 6/02/17.
 * elramireza@gmail.com
 */
@Entity
@Table(name = "IND_20_D")
public class Ind20D {
    private int d20Aaaamm;
    private Integer d20Valor;

    @Id
    @Column(name = "d20_aaaamm")
    public int getD20Aaaamm() {
        return d20Aaaamm;
    }

    public void setD20Aaaamm(int d20Aaaamm) {
        this.d20Aaaamm = d20Aaaamm;
    }

    @Basic
    @Column(name = "d20_valor")
    public Integer getD20Valor() {
        return d20Valor;
    }

    public void setD20Valor(Integer d20Valor) {
        this.d20Valor = d20Valor;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Ind20D ind20D = (Ind20D) o;

        if (d20Aaaamm != ind20D.d20Aaaamm) return false;
        if (d20Valor != null ? !d20Valor.equals(ind20D.d20Valor) : ind20D.d20Valor != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = d20Aaaamm;
        result = 31 * result + (d20Valor != null ? d20Valor.hashCode() : 0);
        return result;
    }
}
