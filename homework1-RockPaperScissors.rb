$times = 1
$win = 0
$lose = 0
$draw = 0
def get_computer_input
  ["R","P","S"].shuffle!.last
end

def check_win(user_input, computer_input)
  combination = user_input + computer_input
  case combination
    when "RR"
      $draw += 1
      "平手！"
    when "RP"
      $lose += 1
      "輸了！"
    when "RS"
      $win += 1
      "贏了！"
    when "PR"
      $win += 1
      "贏了！"
    when "PP"
      $draw += 1
      "平手！"
    when "PS"
      $lose += 1
      "輸了！"
    when "SR"
      $lose += 1
      "輸了！"
    when "SP"
      $win += 1
      "贏了！"
    when "SS"
      $draw += 1
      "平手！"
  end
end
def get_input_string(input)
  gestures = {
    "R" => "石頭",
    "P" => "布",
    "S" => "剪刀"
  }

  gestures[input]
end

def print_result(user_input, computer_input, message)
  puts "✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭"
  puts message
  puts "你出「#{get_input_string(user_input)}」, 電腦出「#{get_input_string(computer_input)}」"
  puts "玩了#{$times}場，共贏了#{$win}次，輸了#{$lose}次，平手#{$draw}次"
  puts "勝率#{rate($times+1, $win)}%"
  puts "✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭"
  if ($times >=10) && (rate($times+1, $win) >= 60)
    puts "░░░░░░░░░░░░░░░░░░░░░░░░"
    puts "░░░░░░░░░░░░▄▄░░░░░░░░░░"
    puts "░░░░░░░░░░░█░░█░░░░░░░░░"
    puts "░░░░░░░░░░░█░░█░░░░░░░░░"
    puts "░░░░░░░░░░█░░░█░░░░░░░░░"
    puts "░░░░░░░░░█░░░░█░░░░░░░░░"
    puts "██████▄▄█░░░░░██████▄░░░"
    puts "▓▓▓▓▓▓█░░░░░░░░░░░░░░█░░"
    puts "▓▓▓▓▓▓█░░░░░░░░░░░░░░█░░"
    puts "▓▓▓▓▓▓█░░░░░░░░░░░░░░█░░"
    puts "▓▓▓▓▓▓█░░░░░░░░░░░░░░█░░"
    puts "▓▓▓▓▓▓█░░░░░░░░░░░░░░█░░"
    puts "▓▓▓▓▓▓█████░░░░░░░░░█░░░"
    puts "██████▀░░░░▀▀██████░░░░░"
  end
  $times += 1
end

def intro
  puts "✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭"
  puts "歡迎來到WelkinGO剪刀石頭布對戰機"
  puts "   累積勝場10次且勝率大於60%"
  puts "      即可獲得獎勵，加油！"
  puts "                      By 羅以翔"
  puts "✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭"
end

def rate(times, win)
  win = win * 1.0
  times = times * 1.0
  if times >= 2
    times = times-1
  end
  theRate = win / times * 1.0
  return theRate * 100
end

def get_user_input(computer_input)
  begin
    puts "✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭"
    puts "這是第#{$times}場，已經贏了#{$win}次，輸了#{$lose}次，平手#{$draw}次"
    puts "勝率#{rate($times, $win)}%"
    puts "請輸入R(代表石頭)、P(代表布)、S(代表剪刀)"
    puts "輸入Q(代表退出遊戲)"
    puts "✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭"
    user_input = gets.chomp.upcase
    if user_input == "Q"
      goodbye()
    end
    if user_input == "C"
      puts "✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭"
      puts "啟動偷看模式："
      puts "電腦出的是：" + computer_input +"(也就是#{get_input_string(computer_input)})"
      puts "✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭"
    end
  end while !["R", "P", "S"].include?(user_input)

  user_input
end

def continue?
  begin
    puts "繼續玩?: Y / N"
    continue = gets.chomp.upcase
  end while !["Y", "N"].include?(continue)

  continue
end

def goodbye
  puts "✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭"
  puts "     再見! 感謝您的遊玩!"
  puts "         金手指：輸入C可偷看電腦出拳"
  puts "                感謝 Eugene Chang教授 指導"
  puts "✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭"
  exit
end

begin
intro()
  puts "請輸入S(啟動遊戲)、Q(退出遊戲)"
  puts "✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭✭"
  cin = gets.chomp.upcase
  if cin == "Q"
    goodbye()
  end
end while cin != "S"

begin
  computer_input = get_computer_input()
  user_input = get_user_input(computer_input)
  message = check_win(user_input, computer_input)
  print_result(user_input, computer_input, message)
  continue = continue?

end while continue == "Y"
goodbye()
