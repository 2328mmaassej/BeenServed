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

pictures = [{ :dish_id => Dish.find_by_category("Burger").id, :picture => "http://www.sandwichpro.com/getattachment/150cd04d-46e0-47fe-b5b1-e3983ec1c7bc/NewsTrends/IndustryNews/October2012/Montreal-Throws-a-Burger-Party" },
          { :dish_id => Dish.find_by_category("Taco").id, :picture => "http://deli-cioso.net/wp-content/uploads/2012/01/Tacos2.jpg" },
          { :dish_id => Dish.find_by_category("Eggs Benedict").id, :picture => "http://wikka.moreawesomethanyou.com/images/f/fc/EggsBenedict.jpg" },
          { :dish_id => Dish.find_by_category("Pancakes").id, :picture => "http://pixelatedcrumb.com/wp-content/uploads/2011/10/Pumpkin_Cinnamon_Roll_Pancakes-5.jpg" },
          { :dish_id => Dish.find_by_category("French Fries").id, :picture => "http://3.bp.blogspot.com/_e6DyH-BVX80/SqKLUoRMjkI/AAAAAAAABg0/WpdEqsntTGw/s400/Truffle+Fries.jpg" },
          { :dish_id => Dish.find_by_category("Mac & Cheese").id, :picture => "http://www.cntraveler.com/daily-traveler/2012/10/macaroni-and-cheese-restaurants-food-los-angeles-new-york-san-francisco/_jcr_content/par/cn_contentwell/par-main/cn_colctrl/par-col2/cn_slideshow/item0.rendition.slideshowWideHorizontal.mission-cheese-san-francisco-mac-and-cheese.jpg" },
          { :dish_id => Dish.find_by_category("Pizza").id, :picture => "http://www.topnews.in/usa/files/deep-dish.jpg" },
          { :dish_id => Dish.find_by_category("Ice Cream").id, :picture => "http://i13.photobucket.com/albums/a272/LetsReminisce/Blog/MargiesCandies.jpg" },
          { :dish_id => Dish.find_by_category("Bagel").id, :picture => "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTRLeeoBye533DVCGT5E7hh75vntm65ZYu2T-1TUHrjtwJza4w8" },
          { :dish_id => Dish.find_by_category("Cupcake").id, :picture => "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcSqOUDtcg5bBvA6SAn3TgHPeTafbGbKY5g9VTAy-MITczwj1oa2" }]

pictures do |picture|
picture = Meal.create()
end

dishes = Dish.limit(10)
restaurants = Restaurant.limit(20)
users = User.limit(3)
ratings = [1,2,3,4,5]
reviews = ["Amazing", "The worst", "Eh. Not worth it.", "The best in town"]
30.times do |visit|
meal = Meal.create({user_id: users.shuffle.first.id, restaurant_id: restaurants.shuffle.first.id, dish_id: dishes.shuffle.first.id, rating: ratings.shuffle.first, review: reviews.shuffle.first}, picture: pictures)
end

