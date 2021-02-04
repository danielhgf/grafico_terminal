require 'tty-pie'
require 'tty-prompt'
require 'tty-logger'

prompt = TTY::Prompt.new
logger = TTY::Logger.new
data = []

class Grafico
  def initialize data 
    @data = data
  end

  def criarGrafico
    grafico_pizza = TTY::Pie.new(data: @data, radius: 4)
    puts grafico_pizza
  end

end


loop do
  print 'Digite o nome do produto que deseja colocar no gráfico: '
  item = gets.chomp
  
  print 'Digite o valor: '
  valor = gets.chomp

  cor = prompt.select('Selecione a cor para o produto: ', %w(black red green yellow blue magenta cyan white on_black on_red on_green 
                      on_yellow on_blue on_magenta on_cyan on_white bright_black bright_red bright_green bright_yellow bright_blue 
                      bright_magenta bright_cyan bright_white on_bright_black on_bright_red on_bright_green on_bright_yellow on_bright_blue 
                      on_bright_magenta on_bright_cyan on_bright_white)
                     )
  color = cor.to_sym

  print 'Selecione o caracter que representa esse item no seu gráfico (podem ser numeros, caracteres especiais e até letras): '
  caracter = gets.chomp

  hash = {name: item, value: valor.to_i, color: color, fill: caracter}
  data.push(hash)

  fim = prompt.yes?('Deseja parar de adicionar dados ? e mostrar o grafico:')

  if fim
    system 'clear'
    logger.success 'Grafico Criado'

    grafico = Grafico.new(data)
    grafico.criarGrafico
    
    break
  
  else
    logger.erro
    system "clear"
  end

end


