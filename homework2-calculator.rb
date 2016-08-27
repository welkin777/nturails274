def calculate(operation, num1, num2)
  case operation
  when 1
    puts "您的算式與答案為：#{num1}+#{num2}=#{num1 + num2}"
  when 2
    puts "您的算式與答案為：#{num1}+#{num2}=#{num1 - num2}"
  when 3
    puts "您的算式與答案為：#{num1}+#{num2}=#{num1 * num2}"
  else
    puts "您的算式與答案為：#{num1}+#{num2}=#{num1.to_f / num2.to_f}"
  end
end

puts "✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭"
puts "歡迎使用簡易計算機"
puts "        By  羅以翔"
puts "✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭"

  puts "請輸入第一個要運算的數字："
  num1 = gets.chomp.to_i

  puts "請選擇運算子："
  puts "(1) ＋ (2) － (3) × (4) ÷ "
  operation = gets.chomp.to_i

  puts "請輸入第二個要運算的數字："
  num2 = gets.chomp.to_i

calculate(operation, num1, num2)
