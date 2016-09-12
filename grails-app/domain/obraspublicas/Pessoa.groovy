package obraspublicas

import util.Telefone

class Pessoa {
    String nome
    String cpf
    String email

    static hasMany = [telefones : Telefone]

    static constraints = {
        cpf blank: false
        cpf unique: true
        nome blank: false
        telefones null: true
    }

    String toString(){
        return this.nome
    }
}
