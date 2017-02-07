package co.com.elramireza.bi.modelOracle;

import javax.persistence.*;

/**
 * Created by usuariox on 6/02/17.
 * elramireza@gmail.com
 */
@Entity
@Table(name = "IND_19_D")
public class Ind19D {
    private int d19Aaaamm;
    private Integer d19Valor;

    @Id
    @Column(name = "d19_aaaamm")
    public int getD19Aaaamm() {
        return d19Aaaamm;
    }

    public void setD19Aaaamm(int d19Aaaamm) {
        this.d19Aaaamm = d19Aaaamm;
    }

    @Basic
    @Column(name = "d19_valor")
    public Integer getD19Valor() {
        return d19Valor;
    }

    public void setD19Valor(Integer d19Valor) {
        this.d19Valor = d19Valor;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Ind19D ind19D = (Ind19D) o;

        if (d19Aaaamm != ind19D.d19Aaaamm) return false;
        if (d19Valor != null ? !d19Valor.equals(ind19D.d19Valor) : ind19D.d19Valor != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = d19Aaaamm;
        result = 31 * result + (d19Valor != null ? d19Valor.hashCode() : 0);
        return result;
    }
}
