package obraspublicas

import util.ObraStrings

class Obra {
    String nome
    String descricao
    String imagem
    double precoPlanejado
    double precoFinal
    Date dataPlanejada
    Date dataTermino
    double latitude
    double longitude
    String empresaResponsavel

    boolean statusAndamento
    boolean statusPreco

    static hasOne = [politicoResponsavel : Politico]

    static constraints = {
        precoPlanejado blank: false
        dataPlanejada blank: false
        dataTermino null: true
        nome unique: true
        statusAndamento default: true
        statusPreco default: true
    }

    public String toString(){
        String desc = ""
        desc += this.nome + ". "
        desc += this.descricao

        return desc
    }
    public String getCpfPoliticoResponsavel(){
        return this.politicoResponsavel.cpf;
    }
    public String getDataPlanejadaFormatada(){
        return this.dataPlanejada.getDay() + "/" + this.dataPlanejada.getMonth() + "/" + this.dataPlanejada.getYear()
    }

    public String getDataTerminoFormatada(){
        return this.dataTermino.getDay() + "/" + this.dataTermino.getMonth() + "/" + this.dataTermino.getYear()
    }

    public boolean isEstourada(){
        return precoFinal>precoPlanejado;
    }

    public boolean isAtrasada(){
        return dataTermino>dataPlanejada;
    }

    public void verificarStatusAndamentoObra(){
        if(dataTermino == null){
            if(System.currentTimeMillis() > this.dataPlanejada.getTime())
                statusAndamento =  false
            else
                statusAndamento = true

        }else{
            if(this.dataTermino > this.dataPlanejada)
                statusAndamento = false
            else
                statusAndamento = true
        }
    }

    public void verificarStatusPrecoObra(){
        if(this.precoPlanejado >= this.precoFinal)
            statusPreco = true
        else
            statusPreco = false
    }

    public String getStatusAndamentObra(){
        if(statusAndamento)
            return ObraStrings.emDia
        else
            return ObraStrings.atrasada
    }

    public String getStatusPrecoObra(){
        if(statusPreco)
            return ObraStrings.noOrcamento
        else
            return ObraStrings.estourouOrcamento
    }
}
