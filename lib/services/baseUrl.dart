 String baseLIVEURL = 'http://superadmin.samicsub.com/api/';
   String baseTESTURL = 'http://testsuper.samicsub.com/api/';
   
class BaseUrl{
  //*************** API LINK ****************************
  final String registerLink = '${baseLIVEURL}user/register';
  final String loginLink = '${baseLIVEURL}user/login';
  final String buyAirtimeLink = '${baseLIVEURL}airtime/submit_airtime';
  final String airtimeTransactionLink = '${baseLIVEURL}airtime/airtime_transactions';
  final String dataTransactionLink = '${baseLIVEURL}user/data_bundles';
  final String buyDataLink = '${baseLIVEURL}user/submit_data_bundle';
  final String dataPlansLink = '${baseLIVEURL}user/get_data_bundles';
  final String userInfo = '${baseLIVEURL}user/get_user_details';
  final String airtimeNetwork = '${baseLIVEURL}airtime/airtime_networks';
}
