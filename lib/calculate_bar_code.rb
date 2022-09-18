require 'pry-byebug'
def calculate_bar_code(digitable_line)
  # binding.pry
  bar_code = digitable_line.gsub(/[^0-9]/,'')

  return 'Erro ao calcular dígito verificador.' if   digit_module11('34191000000000000001753980229122525005423000') != 1
  puts bar_code
  bar_code = bar_code + '00000000000'.slice(0,47-bar_code.length) if (bar_code.length < 47 )

  return 'Linha do código de barras incompleta!'+bar_code.length if (bar_code.length != 47)
  bar_code  = bar_code.slice(0,4)+bar_code.slice(32,15)+bar_code.slice(4,5)+bar_code.slice(10,10)+bar_code.slice(21,10)
  # puts bar_code
  return 'Digito verificador '+bar_code.slice(4,1).to_s+', o correto é  '+digit_module11(bar_code.slice(0,4)+bar_code.slice(5,39)).to_s+'\nO sistema não altera automaticamente o dígito correto na quinta casa!' if (digit_module11(bar_code.slice(0,4)+bar_code.slice(5,39)).to_s != bar_code.slice(4,1))
  puts bar_code
  bar_code
end

def digit_module11(number)
  number = number.gsub(/[^0-9]/,'');
  sum  = 0;
  weight  = 2;
  base  = 9;
  remainder = 0;
  counter = number.length - 1;
  i = counter
  while i >= 0
    sum = sum + ( number.slice(i).to_i * weight);
    weight < base ? (weight += 1) : (weight = 2)
    i -= 1
  end
  digit = 11 - (sum % 11);

  digit = 0 if digit > 9
  digit = 1 if digit == 0

  digit
end
