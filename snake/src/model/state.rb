#Reoresentacion del estado del juego

module Model

    #tener la logica que soporte el mov de la serpiente
    module Direction
        UP = :up
        RIGHT = :right
        DOWN = :down
        LEFT = :left
    end 
    
    class Coord < Struct.new(:row,:col)
    end

    class Food < Coord
    end
    
    class Snake < Struct.new(:positions)
    end

    class Grid < Struct.new(:rows,:cols)
    end

    class State < Struct.new(:snake,:food,:grid, :curr_direction, :game_finished)
    end

    def self.initial_state#metodo de clase
        Model::State.new(
            Model::Snake.new([
                Model::Coord.new(1,1),#cabeza
                Model::Coord.new(0,1)#cola
            ]),
            Model::Food.new(4, 4),
            Model::Grid.new(8, 12),
            Direction::DOWN,#directamente "Direction" por se modulo
            false
        )
    end

end
