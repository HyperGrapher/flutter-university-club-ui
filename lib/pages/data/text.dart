class PageText {
  static final String libBody = """
    <p>Our Central Library is open between 8.00 a.m. - 5.00 p.m. During academic year it is open until 11.00 p.m. </p>
    <p>(In the exam period, It’s open for 24 hours a day.)</p>
    <p>You can enter to the library and use reading rooms with your student cards or student certificates.</p>
    <p>If you want to borrow a book from the Library, you should be a library member</p>
    <h2>How to register?</h2>
    <p>You should apply with your student card, fill-in a form and pay 10 TL. You can keep the books for 14 days and you can extend the duration twice. </p>
    <p>For using e-book service, you should contact to eduroam (<a>eduroam.ege.edu.tr</a>) in campus.</p>
""";
  static final String poolBody = """
    <p>All the students should be registrated. </p>
    <h2>How to register?</h2>
    <p>You should go to Ziraat Bank of Ege University Hospital and pay 50 TL to “Havuz Hesabi”. </p>
    <p>You can use olympic pool daily or monthly.</p>
    <p>Daily entrance fee for 1 hour: 5 TL</p>
    <p>Monthly fee: 100 TL.</p>
    <p>Swimming Pool Opening Hours</p>
    <p>Weekdays: 07.00 a.m. - 10.00 p.m.</p>
    <p>Weenends: 07.00 a.m. - 8.00 p.m.</p>
""";

  static final String healthBody = """
    <p>Medico Health Center offers full of range of medical services, check ups and dental services.</p>
    <p>Working hours: Between 8.00 a.m. - 04.00 p.m.</p>
    <p>After your residence permit application is confirmed, Immigration Office will send your residence permit cards to your address. On the card it’s written your identity Turkish number valid in Turkey. After you get your Turkish identity number you can benefit from medical services.</p>

""";
  static final String gymBody = """
    <p>Ege University Sports Hall with a big capacity of spectacles is composed of basketball, handball, gymnastics, tennis, table tennis facilities in international standarts and exercise and trainin room (step, aerobic and gymnastics) and a fitness saloon.</p>
    <p>In order to use gymnasium, you should go to Mediko / Sport Services Dept. and register with your student card.</p>
    <p>There are also a cafeteria, dressing rooms and showers in the facility.</p>
    <p>Monthly fee: 70 TL.</p>
    <p></p>

""";

  static final String diningBody = """
    <p>The students provided food at modest prices in Dining Hall of Number 1 and Number 2.</p>
    <p>You can take the meal by your Ege University Card that you can load money in.</p>
    <p>For loading money you should log in <a> www.kimlik.ege.edu.tr</a> and choose dining hall system written in Turkish “Yemekhane Sistemi”.</p>
    <p>You should load at least 5 TL.</p>
    <p>Daily meal fee: 3.50 TL</p>

""";

  final Map<String, String> library = {
    "title": "Central Library",
    "body": libBody
  };
  final Map<String, String> health = {
    "title": "Mediko Health Center",
    "body": healthBody
  };
  final Map<String, String> gym = {
    "title": "Ege University Gymnasium",
    "body": gymBody
  };
  final Map<String, String> pool = {
    "title": "Swimming Pool",
    "body": poolBody
  };
  final Map<String, String> dining = {
    "title": "Student Dining Halls",
    "body": diningBody
  };
}
