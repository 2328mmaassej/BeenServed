Dish.destroy_all
User.destroy_all
Restaurant.destroy_all
Meal.destroy_all

dishes = Dish.create([{category: 'Burger'},{category: 'Taco'},{category: 'Eggs Benedict'},{category: 'Pancakes'},{category: 'French Fries'},{category: 'Mac & Cheese'},{category: 'Pizza'},{category: 'Ice Cream'},{category: 'Bagel'},{category: 'Cupcake'},])

users = User.create([{username: "amanda", password: "amanda",email: "amanda@example.com"},{username: "roz",password: "roz",email: "roz@example.com"},{username:"joey",password:"joey",email:"joey@example.com"}])
restaurant_list = ["The Berghoff", "McCormick & Schmick's", "Park Grill", "The Silversmith Hotel & Suites", "Union Station Chicago", "Giordano's", "Buddy Guy's Legends", "Italian Village Restaurants", "Miller's Pub", "Rivers", "ROOF on theWit", "Lou Malnati's Pizzeria - South Loop", "Giordano's", "Walnut Room", "The Gage", "The Buckingham", "Atwood Cafe", "Plymouth Restaurant", "Mercat a la Planxa - Chicago", "Chicago French Market"]
restaurant_address = ["17 West Adams Street, Chicago", "1 East Wacker Drive, Chicago", "11 North Michigan Avenue, Chicago", "10 South Wabash Avenue, Chicago", "210 South Canal Street, Chicago", "223 West Jackson Boulevard, Chicago", "700 South Wabash Avenue, Chicago", "71 West Monroe Street, Chicago", "134 South Wabash Avenue, Chicago", "30 South Wacker Drive, Chicago", "201 North State Street, Chicago", "805 South State Street, Chicago", "135 East Lake Street, Chicago", "111 North State Street, Chicago", "24 South Michigan Avenue, Chicago", "59 East Van Buren Street, Chicago", "1 West Washington Street, Chicago", "327 South Plymouth Court, Chicago", "638 South Michigan Avenue, Chicago", "131 North Clinton Street, Chicago"]

restaurant_list.count.times do |i|
restaurant = Restaurant.create({name: restaurant_list[i], address: restaurant_address[i]})
end



dishes = Dish.limit(10)
restaurants = Restaurant.limit(20)
users = User.limit(3)
ratings = [1,2,3,4,5]
reviews = ["Amazing", "The worst", "Eh. Not worth it.", "The best in town"]
30.times do |visit|
meal = Meal.create({user_id: users.shuffle.first.id, restaurant_id: restaurants.shuffle.first.id, dish_id: dishes.shuffle.first.id, rating: ratings.shuffle.first, review: reviews.shuffle.first})
end


