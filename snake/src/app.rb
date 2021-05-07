require_relative "view/ruby2d" #metodo que nos permite incluir otro archivos de ruby
require_relative "model/state"
require_relative "actions/action"

# view = View::Ruby2dView.new
# initial_state = Model::initial_state
# view.render(initial_state)

#Hay que tener un timer para que la serpiente se mueva
class App
    def initialize
        @state = Model::initial_state #variable de instancia para que todos lo metodos accedan a ella
    end
    
    #el hilo principal abre la ventana
    def start
        @view = View::Ruby2dView.new(self)
        timer_thread= Thread.new { init_timer }#otro hilo para manejar la actualizacion del estado con el timer
        @view.start(@state)
        timer_thread.join
    end

    # def start#aqui se inicia
    #   view = View::Ruby2dView.new
    #   initial_state = Model::initial_state
    #   view.start(initial_state)
    #   view.render(initial_state)
    # end
  
    def init_timer
        loop do
          if @state.game_finished
            puts "Juego finalizado"
            puts "Puntaje: #{@state.snake.positions.length}"
            break
          end
          @state = Actions::move_snake(@state)
          @view.render(@state)
          sleep 0.5
        end
    end

    def send_action(action, params)
        #:change_direction, Model::Direction::UP
        new_state= Actions.send(action,@state,params)
        #por cada accion que recibimos estariamos enviando actualizando es decir un render(para evitar eso se le envia un hash)
        if new_state.hash != @state
            @state = new_state
            @view.render(@state)
        end
    end
end

  
app = App.new
app.start