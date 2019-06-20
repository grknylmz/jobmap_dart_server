class IndeedHelper {
  static String buildUrl(String keyword, String countryCode) {
    String url = '';
    switch (countryCode) {
      case 'BG':
      case 'BY':
      case 'EE':
      case 'HR':
      case 'LV':
      case 'SK':
        url = '';
        break;
      case 'CA':
      case 'CH':
      case 'ES':
      case 'FI':
      case 'FR':
      case 'LU':
      case 'NL':
      case 'PT':
        url =
            'https://www.indeed.${countryCode.toLowerCase()}/jobs?q=${keyword}&l';
        break;
      case 'GB':
        url = 'https://www.indeed.co.uk/jobs?q=${keyword}&l';
        break;
      case 'SG':
        url = 'https://www.indeed.com.sg/jobs?q=${keyword}&l';
        break;
      case 'US':
        url = 'https://www.indeed.com/jobs?q=${keyword}&l';
        break;
      default:
        {
          url =
              'https://${countryCode.toLowerCase()}.indeed.com/jobs?q=${keyword}&l';
        }
    }
    return url;
  }
}
