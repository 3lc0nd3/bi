package co.com.elramireza.bi.modelOracle;

import javax.persistence.*;

/**
 * Created by usuariox on 6/02/17.
 * elramireza@gmail.com
 */
@Entity
@Table(name = "IND_06_D", schema = "orabi", catalog = "")
public class Ind06D {
    private int d06Aaaamm;
    private Integer d06Valor;

    @Id
    @Column(name = "d06_aaaamm")
    public int getD06Aaaamm() {
        return d06Aaaamm;
    }

    public void setD06Aaaamm(int d06Aaaamm) {
        this.d06Aaaamm = d06Aaaamm;
    }

    @Basic
    @Column(name = "d06_valor")
    public Integer getD06Valor() {
        return d06Valor;
    }

    public void setD06Valor(Integer d06Valor) {
        this.d06Valor = d06Valor;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Ind06D ind06D = (Ind06D) o;

        if (d06Aaaamm != ind06D.d06Aaaamm) return false;
        if (d06Valor != null ? !d06Valor.equals(ind06D.d06Valor) : ind06D.d06Valor != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = d06Aaaamm;
        result = 31 * result + (d06Valor != null ? d06Valor.hashCode() : 0);
        return result;
    }
}
