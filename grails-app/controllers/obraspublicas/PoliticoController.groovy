package obraspublicas



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class PoliticoController {

    static allowedMethods = [update: "PUT"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Politico.list(params), model:[politicoInstanceCount: Politico.count()]
    }

    def show(Politico politicoInstance) {
        respond politicoInstance
    }

    def create() {
        respond new Politico(params)
    }

    def taxasAtrasadasPolitico(Politico politico) {
        float taxaAtrasada=0
        int qtdObras = 0;
        if(Obra.list().size()>0) {
            for (int i = 0; i < Obra.list().size(); i++) {
                if (Obra.list().get(i).getCpfPoliticoResponsavel().equals(politico.cpf)) {
                    qtdObras++;
                    if(Obra.list().get(i).isAtrasada()){
                        taxaAtrasada++;
                    }
                }
            }

            taxaAtrasada = (taxaAtrasada / qtdObras) * 100
        }
        respond Politico.list(params), model:[taxaAtrasadaPolitico: taxaAtrasada]
    }

    def taxasEstouradasPolítico(Politico politico) {
        float taxaEstourada=0
        int qtdObras = 0;
        if(Obra.list().size()>0) {
            for (int i = 0; i < Obra.list().size(); i++) {
                if (Obra.list().get(i).getCpfPoliticoResponsavel().equals(politico.cpf)) {
                    qtdObras++;
                    if(Obra.list().get(i).isEstourada()){
                        taxaEstourada++;
                    }
                }
            }

            taxaEstourada = (taxaEstourada / qtdObras) * 100
        }
        respond Politico.list(params), model:[taxasEstouradasPolitico: taxaEstourada]
    }
    @Transactional
    def save() {
        Politico politicoInstance = new Politico(params)

        if (politicoInstance == null) {
            notFound()
            return
        }

        if (politicoInstance.hasErrors()) {
            respond politicoInstance.errors, view:'create'
            return
        }

        politicoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'politico.label', default: 'Politico'), politicoInstance.id])
                redirect politicoInstance
            }
            '*' { respond politicoInstance, [status: CREATED] }
        }
    }

    def edit(Politico politicoInstance) {
        respond politicoInstance
    }

    @Transactional
    def update(Politico politicoInstance) {
        if (politicoInstance == null) {
            notFound()
            return
        }

        if (politicoInstance.hasErrors()) {
            respond politicoInstance.errors, view:'edit'
            return
        }

        politicoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Politico.label', default: 'Politico'), politicoInstance.id])
                redirect politicoInstance
            }
            '*'{ respond politicoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Politico politicoInstance) {

        if (politicoInstance == null) {
            notFound()
            return
        }

        politicoInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Politico.label', default: 'Politico'), politicoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'politico.label', default: 'Politico'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
