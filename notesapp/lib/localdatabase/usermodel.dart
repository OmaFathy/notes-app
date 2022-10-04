class usermodel{
     String? name;
     String? email;
    String? phone;
   usermodel({
     this.name,
   this.email,
     this.phone
   });
    usermodel.fromJson(Map<dynamic,dynamic>map)
    {
      if(map==null)
      {
        return;
      }
      name=map['name'];
      email=map['email'];
      phone=map['phone'];
    }
    toJson(){
      return{
        'name':name,
        'email':email,
        'phone':phone,
      };
    }
}