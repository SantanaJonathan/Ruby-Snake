#--------clase5/6--------#
saludo = "Hola carlos"
saludo.upcase #(Devuelve una copia de la cadena en mayúsculas)
#“hola”.downcase #( Devuelve una copia de la cadena en minusculas)
#“hola”.length #(Devuelve la cantidad de caracteres de la cadena)
#“HoLa”.swapcase #(Devuelve una copia de la cadena con caracteres alfabéticos en mayúsculas convertidos a minúsculas y viceversa)
#“hola”.include? “h” #(Devuelve true si el carácter asignado entre está incluido en nuestra cadena o variable)
#" hola  ".strip #(Devuelve una copia de la cadena con caracteres alfabéticos en mayúsculas convertidos a minúsculas y minúsculas convertidos a mayúsculas)
#“”.empty #(Devuelve true si la cadena está vacia)
puts(saludo)
saludo.gsub('carlos', 'mundo') #( Devuelve una copia de la cadena con todas las apariciones de patrón sustituidas por el segundo argumento )
puts(saludo)
saludo.gsub!('carlos', 'mundo') #(Para modificar la variable en ves de devolver una copia)
puts(saludo)

# nombre= "Simon" #tienen .object_id diferente a nombre2
# nombre2= "Simon"
# #Symbols
# color = :rojo #tienen el mismo .object_id por contener lo mimso
#color2 = :rojo

#CLASE_7-arreglos
letras = ["j","o","n","a","t","h","a","n"]
#puts(letras.methods)
puts(letras.class)
puts(letras.size)
puts(letras[2])
puts(letras[-1])
puts(letras.include? "o")
puts(letras.first)#retorna el primer elemento
puts(letras.last)#retorna el segundo elemento
puts(letras.count{|x| x=="n"})#|x| x=="j" (siendo la variable |x| que cumple con x=="j")#retonra el numero de coincidencia
puts(letras.sort)#se obtiene un copia del arreglo ordenada
puts(letras.sort!)#se modifica la variable original


numeros= [1,2,3,4,5,6]
puts(numeros.count{|x| x.even?})#ver si x es par
puts(numeros.map{|x| x*2})#mapear todos los alemetos y *2
puts(numeros.select {|x| x.odd?})#un filtra un arreglo con numeros impares
puts(numeros.min)
puts(numeros.max)
puts(numeros.sum)

#los array pueden ser multi-tipo de datos
array = [4,4.5,"ola",:symbol, [1,2,3]]
puts(array.map{|x| x.class})

otrosaludo= "Hola Mundo"
arreglo= otrosaludo.split(" ")#convertirlo a array
puts(arreglo.class)
puts(arreglo.size)
puts(arreglo.map{|x| x.upcase}.join("\n"))

#CLASE-8- hashes
capitales = {"colombia"=>"bogota","Peru" => "Lima", "Chile" => "Santiago de Chile", "España" => "Madrid", "Argentina"=> "Buenos aires", "Paises Bajos" => "Amsterdan", "Estados Unidos" => "Washington"}
puts capitales.class
capitales["mexico"]="Guadalajara"
puts(capitales["Peru"])
puts(capitales.empty?)#preguntar si esta cvacio
puts(capitales.has_value? "bogota")#preguntar si hay valor bogota en capitales
puts(capitales.has_key? "bogota")#preguntar si hay llave bogota en capitales
puts(capitales.invert)#invierte-> las llaves pasan a ser valores y los valores a llaves
puts(capitales.invert["bogota"]) #retorna el valor que en este caso es colombia
puts(capitales.merge({"Marte"=>"marciano"}))#merge es para mezclar dos hashes
puts(capitales.transform_values {|x| x.downcase}#transforma los valores en minuscula
puts(capitales.map {|k,v| "La capital de #{k} es #{v}"})#retorna un arreglo lo enviado en las llaves del map
#convertir arreglo de parejas a hash
edades = [["pepito",13],["sutanito",12]]
puts edades.to_h

#clase-9-condicionales
is_autenticar= false
role = :admin
if role == :admin
    puts "Pantalla de admin"
elsif role == :superadmin
    puts "Pantalla de Super_admin"
else
    puts "Pantalla de login"
end

#clases-10-ciclos
x=1
while x<5 do
    puts "Hola #{x}"
    x +=1
end

#loop es un ciclo infinito por eso necesita break
loop do
    puts "Hola #{x}" 
    break if x>=5#preguntar antes de aumentar
    x+=1
end 

for i in 1..10 do
   puts "Hola #{i}" 
end

[1,2,3,4,6].each{ |x| puts "Hola #{x}"}#iterar arreglos

4.times {|x| puts "Hola #{x}"} #el times itera hasta antes de numero que se le envia 

#CLASE_11-rangos
puts (1..6).to_a#con dos puntos es un rango inclusivo con el limite derecho
puts (1...6).to_a#con 3 puntos es un rango exclusivo con limite derecho
puts (1..6.include? 3) #true
puts ("a".."d").to_a.include? 300 #false

#CLASE_12-Regex(expresiones regulares)
is_gmail_regex= /\w+@gmail.com/
puts "jonfesan@gmail.com".match is_gmail_regex #match garantiza que cumpla la expresion regular caso contraio devuelve nil

#CLASE_13-Procs(Procedimientos) y lambdas -> referencia a metodos
saludar = Proc.new{|nombre| puts "Hola #{nombre}"}
puts saludar.class
puts saludar.call("Simon")
#creando una clase
class Transaction
    def exec
        puts "ejecutando transaccion" #por defecto imprime si no envia nada como parametro
        if block_given? #si hay parametro que se envia al def
            yield #lo ejecuta el parametro
        end
    end
end

tx=Transaction.new
puts tx.class
puts tx.exec #ejecutando transaccion
puts tx.exec {puts "Despues de la transaccion"}

#CLASE_14 - POO
class Persona
    #metodo de clase
    def self.nombres_sugeridos
        ["Pepe","Jonathan","Fernando","Sutano"]
    end
    #constructor
    def initialize(nombre, edad)
      @nombre = nombre
      @edad= edad
    end
    #getters
    def nombre
        @nombre
    end

    def edad
        @edad
    end

    #setters
    #persona.nombre ="pepe"
    def nombre=(nombre)
        @nombre = nombre
        self#hace referencia a la misma instancia
    end

    def edad=(edad)
        @edad = edad
        self
    end

end

#otra forma de declarar una clase y acceder a las propiedades de la clase
class Persona
    attr_accessor :nombre, :edad #esto genera getteres y setters
    #metodo de clase
    def self.nombres_sugeridos
        ["Pepe","Jonathan","Fernando","Sutano"]
    end
    #constructor
    def initialize(nombre, edad)
      @nombre = nombre
      @edad= edad
    end
end

#otra forma de declarar clase con metodos (con struct no se necesita el contructor)
class Persona < Struct.new( :nombre, :edad)
    def self.nombres_sugeridos
        ["Pepe","Jonathan","Fernando","Sutano"]
    end
end

persona = Persona.new("Fernando",24)
puts persona.nombre
puts persona.edad
persona.edad = 50
puts persona.edad
#puts persona.methods

#CLASE_15-POO(Modulos)
module Model
    class Company
    end

    class Employee
    end
end
  
module Reports
    class ExcelReporter
      def build
        puts "Generating excel report"
      end
    end

    class EmailReporter
    end
end

#excel_report = (Modulo al cual acceder)::(clase del modulo)
  
excel_report = Reports::ExcelReporter.new#inicializa la clase
excel_report.build

#CLASE_16-POO(clases objetos)
#CLASE_17-POO(Concurrencia (se utiliza threads) y Paralelismo)
#concurrencia en la misma unidad de procesamiento intercalando las subtareas
#paralelismo en dos diferentes unidad de procesamiento ejecutando sus tareas independientemente

#CLASE_18-bundler y gemas
#en la carpeta de snake
# Aqui se encuentra gemas "https://rubygems.org" y https://www.ruby-toolbox.com/
require 'faker'
puts Faker::Name.name
puts Faker::Movies::HarryPotter.spell
#bundle install -> puede instlar versiones anteriormente instaladas y no las especificadas
#bundle exec irb -> para ejecutar las gemas especificas que se le paso al gemfile
#Para ejecutar un archivo => bundle exec ruby main.rb (main es el archivo to run)

#CLASE_19-Testing en ruby
require "byebug"

class Calculadora
    def sum(a,b)
        a+b
    end

    def restar(a,b)
        a-b
    end
end

calc = Calculadora.new
tests_sum= {
    [1,2] => 3,
    [5,6] => 11,
    [100,1] => 101
}

tests_sum.each do |input,expect_result|#otra forma de recorrer el each
    #byebug
    if !(calc.sum(input[0],input[1]) == expect_result)
        raise "Test failed for input #{input}. Expected result #{expect_result}"#raise lanza una excepcion 
    end 
end

#CLASE_20-Testing con MiniTest
require "minitest/autorun"

class Calculator
    def sum(a,b)
        a+b
    end

    def restar(a,b)
        a-b
    end
end

class TestCalculator < MiniTest::Test

    def setup
        #variable de instancia para la prueba
        @calc = Calculator.new
    end

    #siempre empieza con test para los tests
    def test_sum_positives
        result = @calc.sum(1,3)
        #los metodos para las pruebas comienzan con assert
        assert_equal result,4
    end
    
    def test_sum_negatives
        result = @calc.sum(-1,-3)
        #los metodos para las pruebas comienzan con assert
        assert_equal result,-4
    end

    def test_sum_negatives
        result = @calc.sum(1,-3)
        #los metodos para las pruebas comienzan con assert
        assert_equal result,-2
    end

end

#CLASE_26-comenzando el juego
#CLASE_26-vista basica

