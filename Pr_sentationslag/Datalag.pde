class Bog {
  private String titel, forfatter;
  int kategori;
  private boolean udlaant;
  Bog(String temptitel, String tempforfatter, int tempkategori) {
    titel=temptitel;
    forfatter=tempforfatter;
    kategori=tempkategori;
    udlaant=false;
  }
  String getTitel() {
    return titel;
  }
  String getForfatter() {
    return forfatter;
  }
  int getkategori() {
    return kategori;
  }
  void laanBog() {
    udlaant=true;
  }
  void afleverBog() {
    udlaant=false;
  }
}

class Bruger {
  private String navn, brugerId;
  Bruger(String tempnavn, String tempbrugerId) {
    navn=tempnavn;
    brugerId=tempbrugerId;
  }
  String getNavn() {
    return navn;
  }
  String getBrugerId() {
    return brugerId;
  }
}

class Laan {
  private Bog bog;
  private Bruger bruger;
  private String laanDato;
  private boolean aktivtLaan;
  Laan(Bog tempbog, Bruger tempbruger) {
    bog=tempbog;
    bruger=tempbruger;
    laanDato=day()+"-"+month()+"-"+year();
    aktivtLaan=true;
  }
  Bog getBog() {
    return bog;
  }
  Bruger getBruger() {
    return bruger;
  }
  String getLaanDato() {
    return laanDato;
  }
  void afleverBog() {
    aktivtLaan=false;
  }
  boolean erAktivtLaan() {
    return aktivtLaan;
  }
  void VisLaanInfo() {
    println("Forfatter: " + bog.getForfatter() + " Titel: " + bog.getTitel());
    println("BrugerId: " + bruger.getBrugerId() + " navn: " + bruger.getNavn());
    println("aktivt lån: " + aktivtLaan + " Låndato: "+ laanDato);
  }
}

class Bibliotek {
  public ArrayList<Bog> bøger = new ArrayList<Bog>();
  public ArrayList<Bruger> brugere =new ArrayList<Bruger>();
  private ArrayList<Laan> udLaan = new ArrayList<Laan>();
  void laanBog(Bruger person, Bog book) {
    Laan laan = new Laan(book, person);
    udLaan.add(laan);
    println(person.getNavn()+" har lånt: "+book.getTitel());
  }

  void afleverBog(Bog book) {
    Laan aktivtLaan=null;
    for (Laan laan : udLaan) {
      if (laan.getBog().equals(book)&&laan.erAktivtLaan()) {
        aktivtLaan=laan;
        break;
      }
    }
    if (aktivtLaan!=null) {
      aktivtLaan.afleverBog();
      udLaan.remove(aktivtLaan);
      println(aktivtLaan.getBruger().getNavn()+" har afleveret: " + aktivtLaan.getBog().getTitel());
    } else {
      println("Ingen aktive lån fundet for bogen, " + book.getTitel()+ ", " + book.getForfatter());
    }
  }
  void tilfoejBog(Bog book) {
    bøger.add(book);
    println("tilføjet: "+book.getTitel()+", "+book.getForfatter());
  }
  void registrerBruger(Bruger person) {
    brugere.add(person);
    println("tilføjet: "+person.getNavn()+", "+person.getBrugerId());
  }
}
void iniBog(Bog book) {
  biblioteka.tilfoejBog(book);
}
void iniBruger(Bruger person) {
  biblioteka.registrerBruger(person);
}
