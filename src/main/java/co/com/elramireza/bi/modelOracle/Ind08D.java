package co.com.elramireza.bi.modelOracle;

import javax.persistence.*;

/**
 * Created by usuariox on 6/02/17.
 * elramireza@gmail.com
 */
@Entity
@Table(name = "IND_08_D")
public class Ind08D {
    private int d08Aaaamm;
    private Integer d08Valor;

    @Id
    @Column(name = "d08_aaaamm")
    public int getD08Aaaamm() {
        return d08Aaaamm;
    }

    public void setD08Aaaamm(int d08Aaaamm) {
        this.d08Aaaamm = d08Aaaamm;
    }

    @Basic
    @Column(name = "d08_valor")
    public Integer getD08Valor() {
        return d08Valor;
    }

    public void setD08Valor(Integer d08Valor) {
        this.d08Valor = d08Valor;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Ind08D ind08D = (Ind08D) o;

        if (d08Aaaamm != ind08D.d08Aaaamm) return false;
        if (d08Valor != null ? !d08Valor.equals(ind08D.d08Valor) : ind08D.d08Valor != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = d08Aaaamm;
        result = 31 * result + (d08Valor != null ? d08Valor.hashCode() : 0);
        return result;
    }
}
