package util

class Endereco {
        int numero
        String rua
        String bairro
        String cidade
        String estado
        String CEP

    static constraints = {
    }

    String getEnderecoFormatado(){
        return this.rua + " - " + this.numero + " - " + this.bairro + " - " + this.cidade + " - " + this.estado
    }

}
