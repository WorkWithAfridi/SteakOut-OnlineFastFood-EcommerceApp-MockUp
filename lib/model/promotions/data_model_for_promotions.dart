class Promotions{
  String name;
  String description;
  String id;
  String discountPercentage;
  String price;
  String imageUrl;

  Promotions(this.name,  this.id,this.description, this.discountPercentage,
      this.price, this.imageUrl);
}

List<Promotions> promotions=[
  Promotions("Stake_one", "1", "Lorem 2 is a lorem ipsum generator brought to you by Manoverboard, a purpose-driven design studio based in beautiful Canada.", "10" ,"100", 'lib/assets/promotions/promotion_one.jpg'),
  Promotions("Stake_two", "2", "Lorem 2 is a lorem ipsum generator brought to you by Manoverboard, a purpose-driven design studio based in beautiful Canada.", "50" ,"200", 'lib/assets/promotions/promotion_two.jpg'),
  Promotions("Stake_three", "3", "Lorem 2 is a lorem ipsum generator brought to you by Manoverboard, a purpose-driven design studio based in beautiful Canada.", "50" ,"300", 'lib/assets/promotions/promotion_three.jpg'),
  Promotions("Stake_four", "4", "Lorem 2 is a lorem ipsum generator brought to you by Manoverboard, a purpose-driven design studio based in beautiful Canada.", "10" ,"200", 'lib/assets/promotions/promotion_four.png'),
  Promotions("Stake_five", "5", "Lorem 2 is a lorem ipsum generator brought to you by Manoverboard, a purpose-driven design studio based in beautiful Canada.", "50" ,"500", 'lib/assets/promotions/promotion_five.png'),
];