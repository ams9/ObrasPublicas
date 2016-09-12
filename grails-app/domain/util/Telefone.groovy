package util

import obraspublicas.Pessoa

class Telefone {
    int ddd
    int telefone

    static hasOne = [pessoa : Pessoa]

    static constraints = {
    }

    public String getFormatedFone() {
        String phone = ""
        String firstPart = ""
        String secPart = ""

        firstPart = this.telefone.toString()
        firstPart = firstPart.subSequence(0, firstPart.size()-4)

        secPart = this.telefone.toString()
        secPart = secPart.subSequence(secPart.size()-4, secPart.size())

        phone = "(" + this.ddd + ") " + firstPart + "-" + secPart
        return phone
    }
}
