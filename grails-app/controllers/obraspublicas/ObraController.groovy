package obraspublicas



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ObraController {

    static allowedMethods = [update: "PUT"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Obra.list(params), model:[obraInstanceCount: Obra.count()]
    }

    def relatorioAtrasada() {
        float taxaAtrasada=0
        if(Obra.list().size()>0) {
            for (int i = 0; i < Obra.list().size(); i++) {
                if (Obra.list().get(i).isAtrasada()) {
                    taxaAtrasada++
                }
            }

            taxaAtrasada = taxaAtrasada / Obra.list().size()

            taxaAtrasada = taxaAtrasada * 100
        }
        respond Obra.list(params), model:[taxaAtrasada: taxaAtrasada]
    }

    def relatorioEstourada() {
        float taxaEstouro=0
        if(Obra.list().size()>0) {

            for (int i = 0; i < Obra.list().size(); i++) {
                if (Obra.list().get(i).isEstourada()) {
                    taxaEstouro++
                }
            }

            taxaEstouro = taxaEstouro / Obra.list().size()

            taxaEstouro = taxaEstouro * 100
        }

        respond Obra.list(params), model:[taxaEstouro: taxaEstouro]
    }

    def relatorios(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Obra.list(params), model:[obraInstanceCount: Obra.count()]
    }

    def show(Obra obraInstance) {
        respond obraInstance
    }

    def create() {
        respond new Obra(params)
    }

    def verificarStatusAndamentoObra(){
        def obraInstance = Obra.get(params.id)

        obraInstance.verificarStatusAndamentoObra()

        obraInstance.save flush:true

        redirect (action: "index")
    }


    @Transactional
    def save() {
        Obra obraInstance = new Obra(params)
        if (obraInstance == null) {
            notFound()
            return
        }

        if (obraInstance.hasErrors()) {
            respond obraInstance.errors, view:'create'
            return
        }

        obraInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'obra.label', default: 'Obra'), obraInstance.id])
                redirect obraInstance
            }
            '*' { respond obraInstance, [status: CREATED] }
        }
    }

    def edit(Obra obraInstance) {
        respond obraInstance
    }

    @Transactional
    def update(Obra obraInstance) {
        if (obraInstance == null) {
            notFound()
            return
        }

        if (obraInstance.hasErrors()) {
            respond obraInstance.errors, view:'edit'
            return
        }

        obraInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Obra.label', default: 'Obra'), obraInstance.id])
                redirect obraInstance
            }
            '*'{ respond obraInstance, [status: OK] }
        }
    }

    @Transactional
    def delete() {
        def obraInstance = Obra.get(params.id)

        if (obraInstance == null) {
            notFound()
            return
        }

        obraInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Obra.label', default: 'Obra'), obraInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'obra.label', default: 'Obra'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
