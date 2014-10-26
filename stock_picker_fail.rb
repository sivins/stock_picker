def stock_picker(prices)
	#takes an array of stock prices by day and returns the best day to buy and sell

	#this solution starts at the last day and finds the greatest difference, then drops the last day and does it again until
	#there is just one day left.
	def tryer(all_prices, tryer_prices, tryer_pick)
		#subtracts the last day from each day.

		if tryer_prices.size == 1
			return tryer_pick
		else
			#the new pick reflects the first and last of the tryer_prices.
			new_pick = [tryer_pick.first + 1, tryer_pick.last]
			puts "all_prices"
			puts all_prices
			puts "tryer_pick"
			puts tryer_pick
			puts "tryer_pick.last"
			puts tryer_pick.last
			puts "tryer_prices.last"
			puts tryer_prices.last
			puts "tryer_prices.first"
			puts tryer_prices.first
			puts "all_prices[tryer_pick.last]"
			puts all_prices[tryer_pick.last]
			puts "all_prices[tryer_pick.first]"
			puts all_prices[tryer_pick.first]
			if (tryer_prices.last - tryer_prices.first) > (all_prices[tryer_pick.last] - all_prices[tryer_pick.first])
			 
			 return tryer(all_prices, tryer_prices.drop(1), new_pick)
			else
			  return tryer(all_prices, tryer_prices.drop(1), tryer_pick)
			end

		end

	end

	def pick(all_prices, current_prices, current_pick)
		if current_prices == 1
			return current_pick
		else
			
			new_pick = tryer(all_prices, current_prices, [0, current_prices.size-1])

			puts "current_pick.last"  
			puts current_pick.last
			puts "all_prices[current_pick.last]"
			puts all_prices[current_pick.last]
			puts "all_prices[new_pick.last]"
			puts all_prices[new_pick.last]
			puts "new_pick"
			puts new_pick
			puts "all_prices"
			puts all_prices
			if (all_prices[new_pick.last] - all_prices[new_pick.first]) > (all_prices[current_pick.last] - all_prices[current_pick.first])
				current_pick = new_pick
			end

			current_prices.delete_at(-1)
			puts "After current_prices.delete_at(-1)"
			puts "all_prices"
			puts all_prices
			puts "current_prices"
			puts current_prices
			return pick(all_prices, current_prices, current_pick)
		end
	end
	all_prices = prices
	current_prices = prices
	pick(all_prices, current_prices, [0, prices.size-1])

end

result = stock_picker([17,3,6,9,15,8,6,1,10])
puts result