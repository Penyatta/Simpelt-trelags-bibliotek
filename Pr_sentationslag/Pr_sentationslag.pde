void lånBog(Bog book,Bruger person){
  println(person.getNavn()+" har lånt: "+book.getTitel());
  biblioteka.laanBog(person,book);
}

void afleverBog(Bog book,Bruger person){
  if(biblioteka.afleverBog(book)){
    println(person.getNavn()+" har afleveret: " + book.getTitel());
  }
  else{
    println("Ingen aktive lån fundet for bogen, " + book.getTitel()+ ", " + book.getForfatter());
  }
}

void ThingsDO(){
  lånBog(biblioteka.bøger.get(3),biblioteka.brugere.get(0));
  afleverBog(biblioteka.bøger.get(3),biblioteka.brugere.get(0));
}
