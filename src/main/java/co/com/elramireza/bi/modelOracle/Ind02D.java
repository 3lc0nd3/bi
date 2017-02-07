package co.com.elramireza.bi.modelOracle;

import javax.persistence.*;

/**
 * Created by usuariox on 6/02/17.
 * elramireza@gmail.com
 */
@Entity
@Table(name = "IND_02_D")
public class Ind02D {
    private int d02Aaaamm;
    private Integer d02Valor;

    @Id
    @Column(name = "d02_aaaamm")
    public int getD02Aaaamm() {
        return d02Aaaamm;
    }

    public void setD02Aaaamm(int d02Aaaamm) {
        this.d02Aaaamm = d02Aaaamm;
    }

    @Basic
    @Column(name = "d02_valor")
    public Integer getD02Valor() {
        return d02Valor;
    }

    public void setD02Valor(Integer d02Valor) {
        this.d02Valor = d02Valor;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Ind02D ind02D = (Ind02D) o;

        if (d02Aaaamm != ind02D.d02Aaaamm) return false;
        if (d02Valor != null ? !d02Valor.equals(ind02D.d02Valor) : ind02D.d02Valor != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = d02Aaaamm;
        result = 31 * result + (d02Valor != null ? d02Valor.hashCode() : 0);
        return result;
    }
}
