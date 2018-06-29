class Agent
	def initialize(max_stone = 2)
		@max_stone = max_stone
	end
	
	def put_stone(stone_num)
		if (stone_num - 1) % (@max_stone + 1) == 0   then
			@max_stone
		
		else
			(stone_num - 1) % (@max_stone + 1)
		end
	end
end


puts "石とりゲームを始めます。"

max = rand(2..6)

puts "今回、１度に取れる石の数の限度は#{max}個です。"

order = rand(2)

stone_num = rand(11..30)

opponent = Agent.new(max)


loop do 
	puts "現在の石の数は#{stone_num}個です。"
	if order == 0 then
		puts "あなたの番です。"
		print "１から#{max}で取り除く石の数を入力してください。--->"
		input = 0 && gets.to_i
		if (input > 0)&&(input <= max)  then
			stone_num -= input
			if stone_num <= 0 then
				puts "不正な入力です。やり直してください。"
				stone_num += input
				redo
			end
		
		else
			puts "不正な入力です。やり直してください。"
			redo
		end
	
		order += 1

	else
		puts "あいての番です。"
		stone_num -= opponent.put_stone(stone_num)
		order -= 1
	end
	
	break if stone_num == 1

end


if order == 1  then
	puts "あなたの勝利です。"
end

if order == 0  then
	puts "相手の勝利です。"
end




