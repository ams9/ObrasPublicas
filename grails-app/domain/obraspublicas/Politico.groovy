package obraspublicas


class Politico extends Pessoa {
    String partido
    String foto
    String descricao
    double qualidade

    static hasMany = [obras : Obra]

    static constraints = {
        obras blank: true
        foto blank: true
        obras null: true
    }
}
