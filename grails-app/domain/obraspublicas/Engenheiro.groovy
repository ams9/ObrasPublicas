package obraspublicas

class Engenheiro extends Pessoa {
    String foto
    String descricao


    static constraints = {
        obras blank: true
        foto blank: true
        obras null: true
    }
}
