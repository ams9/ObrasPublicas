package obraspublicas

class Engenheiro extends Pessoa {
    String titulacao
    String foto
    String descricao

    static hasMany = [obras : Obra]

    static constraints = {
        obras blank: true
        foto blank: true
        obras null: true
        titulacao null:false
    }
}
