def create_product(list, product)
  Product.create(
    list_id: list.id,
    company: product[:company],
    price_in_cent: product[:price_in_cent],
    product_name: product[:title],
  )
end

def currency_sample
  ["$", "€"].sample
end

def seed_lists(user)
  # Helper to get a random date within the last 2 years
  def random_taken_at
    start_date = Time.new(2025, 1, 1)
    end_date = Time.new(2025, 7, 1)
    Time.at(rand(start_date.to_f..end_date.to_f))
  end

  lists_data = [
    {shop_name: "Interspar", currency: currency_sample, products: [
      {title: "Mlijeko 1l", price_in_cent: 70, company: "Dukat"},
      {title: "Voćni jogurt 150g", price_in_cent: 77, company: "Z bregov"},
      {title: "Maslac 250g", price_in_cent: 184, company: "Dukat"},
      {title: "Ćevapćići 300g", price_in_cent: 391, company: "K plus"},
      {title: "CocaCola 2l", price_in_cent: 195, company: "Coca Cola"},
      {title: "Banana", price_in_cent: 94, company: "Čikita"},
    ]},
    {shop_name: "Plodine", currency: currency_sample, products: [
      {title: "Kruh", price_in_cent: 50, company: "Kraš"},
      {title: "Jaja 10 kom", price_in_cent: 126, company: "Zagorska"},
      {title: "Maslac 250g", price_in_cent: 188, company: "Dukat"},
    ]},
    {shop_name: "Billa", currency: currency_sample, products: [
      {title: "Voćni jogurt 150g", price_in_cent: 76, company: "Z bregov"},
      {title: "Jaja 10 kom", price_in_cent: 143, company: "Zagorska"},
      {title: "Maslac 250g", price_in_cent: 181, company: "Dukat"},
      {title: "Kruh", price_in_cent: 60, company: "Kraš"},
      {title: "Sir 500g", price_in_cent: 204, company: "Vindija"},
    ]},
    {shop_name: "Lidl", currency: currency_sample, products: [
      {title: "Voćni jogurt 150g", price_in_cent: 80, company: "Z bregov"},
      {title: "Ćevapćići 300g", price_in_cent: 405, company: "K plus"},
      {title: "Jaja 10 kom", price_in_cent: 140, company: "Zagorska"},
      {title: "CocaCola 2l", price_in_cent: 191, company: "Coca Cola"},
    ]},
    {shop_name: "Tommy", currency: currency_sample, products: [
      {title: "Ćevapćići 300g", price_in_cent: 374, company: "K plus"},
      {title: "CocaCola 2l", price_in_cent: 200, company: "Coca Cola"},
      {title: "Banana", price_in_cent: 149, company: "Čikita"},
      {title: "Sir 500g", price_in_cent: 276, company: "Vindija"},
      {title: "Kava 250g", price_in_cent: 320, company: "Franck"},
    ]},
    {shop_name: "Spar", currency: currency_sample, products: [
      {title: "Sir 500g", price_in_cent: 261, company: "Vindija"},
      {title: "Kruh", price_in_cent: 63, company: "Kraš"},
      {title: "Jaja 10 kom", price_in_cent: 152, company: "Zagorska"},
      {title: "Ćevapćići 300g", price_in_cent: 426, company: "K plus"},
    ]},
    {shop_name: "Lidl", currency: currency_sample, products: [
      {title: "Kruh", price_in_cent: 59, company: "Kraš"},
      {title: "Banana", price_in_cent: 123, company: "Čikita"},
      {title: "Kava 250g", price_in_cent: 309, company: "Franck"},
      {title: "Ćevapćići 300g", price_in_cent: 415, company: "K plus"},
    ]},
    {shop_name: "Interspar", currency: currency_sample, products: [
      {title: "CocaCola 2l", price_in_cent: 202, company: "Coca Cola"},
      {title: "Ćevapćići 300g", price_in_cent: 383, company: "K plus"},
      {title: "Voćni jogurt 150g", price_in_cent: 79, company: "Z bregov"},
      {title: "Jaja 10 kom", price_in_cent: 137, company: "Zagorska"},
    ]},
    {shop_name: "Spar", currency: currency_sample, products: [
      {title: "Voćni jogurt 150g", price_in_cent: 77, company: "Z bregov"},
      {title: "Ćevapćići 300g", price_in_cent: 428, company: "K plus"},
      {title: "Sir 500g", price_in_cent: 241, company: "Vindija"},
      {title: "CocaCola 2l", price_in_cent: 197, company: "Coca Cola"},
    ]},
    {shop_name: "Metro", currency: currency_sample, products: [
      {title: "Ćevapćići 300g", price_in_cent: 400, company: "K plus"},
      {title: "Banana", price_in_cent: 117, company: "Čikita"},
      {title: "Mlijeko 1l", price_in_cent: 77, company: "Dukat"},
      {title: "Voćni jogurt 150g", price_in_cent: 69, company: "Z bregov"},
    ]},
    {shop_name: "Konzum", currency: currency_sample, products: [
      {title: "Kruh", price_in_cent: 70, company: "Kraš"},
      {title: "Kava 250g", price_in_cent: 258, company: "Franck"},
      {title: "Mlijeko 1l", price_in_cent: 70, company: "Dukat"},
      {title: "Voćni jogurt 150g", price_in_cent: 63, company: "Z bregov"},
    ]},
    {shop_name: "Billa", currency: currency_sample, products: [
      {title: "Maslac 250g", price_in_cent: 185, company: "Dukat"},
      {title: "Jaja 10 kom", price_in_cent: 149, company: "Zagorska"},
      {title: "Voćni jogurt 150g", price_in_cent: 65, company: "Z bregov"},
    ]},
    {shop_name: "Tommy", currency: currency_sample, products: [
      {title: "Kava 250g", price_in_cent: 302, company: "Franck"},
      {title: "Maslac 250g", price_in_cent: 178, company: "Dukat"},
      {title: "Ćevapćići 300g", price_in_cent: 374, company: "K plus"},
      {title: "Banana", price_in_cent: 135, company: "Čikita"},
      {title: "Mlijeko 1l", price_in_cent: 90, company: "Dukat"},
      {title: "Voćni jogurt 150g", price_in_cent: 62, company: "Z bregov"},
    ]},
    {shop_name: "Billa", currency: currency_sample, products: [
      {title: "Maslac 250g", price_in_cent: 168, company: "Dukat"},
      {title: "Kruh", price_in_cent: 50, company: "Kraš"},
      {title: "Kava 250g", price_in_cent: 318, company: "Franck"},
      {title: "CocaCola 2l", price_in_cent: 199, company: "Coca Cola"},
    ]},
    {shop_name: "Interspar", currency: currency_sample, products: [
      {title: "Voćni jogurt 150g", price_in_cent: 67, company: "Z bregov"},
      {title: "Mlijeko 1l", price_in_cent: 81, company: "Dukat"},
      {title: "Maslac 250g", price_in_cent: 150, company: "Dukat"},
      {title: "Kava 250g", price_in_cent: 250, company: "Franck"},
      {title: "Kruh", price_in_cent: 70, company: "Kraš"},
    ]},
  ]

  lists_data.each do |list_data|
    list = List.create(
      shop_name: list_data[:shop_name],
      currency: list_data[:currency],
      taken_at: random_taken_at,
      user_id: user.id
    )
    list_data[:products].each do |product|
      create_product(list, product)
    end
  end
end
