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

void laanInfo(Laan laan){
  println("Forfatter: " + laan.getBog().getForfatter() + " Titel: " + laan.getBog().getTitel());
    println("BrugerId: " + laan.getBruger().getBrugerId() + " navn: " + laan.getBruger().getNavn());
    println("aktivt lån: " + laan.aktivtLaan + " Låndato: "+ laan.laanDato);
}

void ThingsDO(){
  lånBog(biblioteka.bøger.get(3),biblioteka.brugere.get(0));
  laanInfo(biblioteka.udLaan.get(0));
  afleverBog(biblioteka.bøger.get(3),biblioteka.brugere.get(0));
}
