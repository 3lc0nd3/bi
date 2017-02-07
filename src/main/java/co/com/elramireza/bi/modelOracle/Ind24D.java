package co.com.elramireza.bi.modelOracle;

import javax.persistence.*;

/**
 * Created by usuariox on 6/02/17.
 * elramireza@gmail.com
 */
@Entity
@Table(name = "IND_24_D")
public class Ind24D {
    private int d24Aaaamm;
    private Integer d24Valor;

    @Id
    @Column(name = "d24_aaaamm")
    public int getD24Aaaamm() {
        return d24Aaaamm;
    }

    public void setD24Aaaamm(int d24Aaaamm) {
        this.d24Aaaamm = d24Aaaamm;
    }

    @Basic
    @Column(name = "d24_valor")
    public Integer getD24Valor() {
        return d24Valor;
    }

    public void setD24Valor(Integer d24Valor) {
        this.d24Valor = d24Valor;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Ind24D ind24D = (Ind24D) o;

        if (d24Aaaamm != ind24D.d24Aaaamm) return false;
        if (d24Valor != null ? !d24Valor.equals(ind24D.d24Valor) : ind24D.d24Valor != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = d24Aaaamm;
        result = 31 * result + (d24Valor != null ? d24Valor.hashCode() : 0);
        return result;
    }
}
