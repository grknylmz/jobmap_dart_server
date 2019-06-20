class NeuvooHelper {
  static String buildUrl(String keyword, String countryCode) {
    String url = '';
    switch (countryCode) {
      case 'AU':
        url = 'https://au.neuvoo.com/jobs/?k=${keyword}&l=&f=&o=&p=&r=15';
        break;
      case 'AT':
        url = 'https://neuvoo.at/jobs/?k=${keyword}&l=&f=&o=&p=&r=15';
        break;
      case 'CA':
        url = 'https://neuvoo.ca/jobs/?k=${keyword}&l=&f=&o=&p=&r=15';
        break;
      case 'BE':
        url = 'https://neuvoo.be/vacatures/?k=${keyword}&l=&f=&o=&p=&r=15';
        break;
      case 'CH':
        url = 'https://neuvoo.ch/jobs/?k=${keyword}&l=&f=&o=&p=&r=15';
        break;
      case 'CZ':
        url = 'https://neuvoo.cz/pr%C3%A1ce/?k=${keyword}&l=&f=&o=&p=&r=15';
        break;
      case 'DE':
        url = 'https://neuvoo.de/jobs/?k=${keyword}&l=&f=&o=&p=&r=15';
        break;
      case 'DK':
        url = 'https://dk.neuvoo.com/job/?k=${keyword}&l=&f=&o=&p=&r=15';
        break;
      case 'ES':
        url = 'https://neuvoo.es/empleos/?k=${keyword}&l=&f=&o=&p=&r=15';
        break;
      case 'FI':
        url =
            'https://fi.neuvoo.com/ty%C3%B6paikat/?k=${keyword}&l=&f=&o=&p=&r=15';
        break;
      case 'GB':
        url = 'https://neuvoo.co.uk/jobs/?k=${keyword}&l=&f=&o=&p=&r=15';
        break;
      case 'GR':
        url =
            'https://neuvoo.gr/%CE%B5%CF%81%CE%B3%CE%B1%CF%83%CE%B9%CE%B1/?k=${keyword}&l=&f=&o=&p=&r=15';
        break;
      case 'HU':
        url =
            'https://neuvoo.hu/%C3%A1ll%C3%A1s/?k=${keyword}&l=&f=&o=&p=&r=15';
        break;
      case 'IE':
        url = 'https://ie.neuvoo.com/jobs/?k=${keyword}&l=&f=&o=&p=&r=15';
        break;
      case 'IT':
        url = 'https://neuvoo.it/lavori/?k=${keyword}&l=&f=&o=&p=&r=15';
        break;
      case 'LU':
        url = 'https://neuvoo.lu/emplois/?k=${keyword}&l=&f=&o=&p=&r=15';
        break;
      case 'NL':
        url = 'https://neuvoo.nl/jobs/?k=${keyword}&l=&f=&o=&p=&r=15';
        break;
      case 'NO':
        url = 'https://no.neuvoo.com/jobb/?k=${keyword}&l=&f=&o=&p=&r=15';
        break;
      case 'NZ':
        url = 'https://neuvoo.co.nz/jobs/?k=${keyword}&l=&f=&o=&p=&r=15';
        break;
      case 'PL':
        url = 'https://neuvoo.pl/praca/?k=${keyword}&l=&f=&o=&p=&r=15';
        break;
      case 'PT':
        url = 'https://neuvoo.pt/emprego/?k=${keyword}&l=&f=&o=&p=&r=15';
        break;
      case 'RO':
        url = 'https://neuvoo.ro/locuri-munca/?k=${keyword}&l=&f=&o=&p=&r=15';
        break;
      case 'SG':
        url = 'https://sg.neuvoo.com/jobs/?k=${keyword}&l=&f=&o=&p=&r=15';
        break;
      case 'SE':
        url = 'https://se.neuvoo.com/jobb/?k=${keyword}&l=&f=&o=&p=&r=15';
        break;
      case 'TR':
        url = 'https://tr.neuvoo.com/i%C5%9F/?k=${keyword}&l=&f=&o=&p=&r=15';
        break;
      case 'UA':
        url =
            'https://neuvoo.com.ua/%D1%80%D0%BE%D0%B1%D0%BE%D1%82%D0%B0/?k=${keyword}&l=&f=&o=&p=&r=15';
        break;
      case 'US':
        url = 'https://neuvoo.com/jobs/?k=${keyword}&l=&f=&o=&p=&r=15';
        break;
    }
    return url;
  }
}
