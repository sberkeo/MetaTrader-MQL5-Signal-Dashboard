
#property copyright "Copyright © 2024, FSU MASTER's SIGNAL DASHBOARD"
#property link      "https://www.youtube.com/@ForexSignals"
#property description "ForexSignals"
#property description "Open Source GNU License Please Contact with us for commercial usage eurousdforexlive@gmail.com"
#property version   "11.00"



bool license_status;// = false;
string license_status_comment;

input string license_key = "";
string type_key = "DA000";
/*
string type_key = "SP000";//Super Licenses
string type_key = "CR000";//Cronos Future Pro Licenses Gen + ScalpbyColors License
string type_key = "CR001";//Cronos V1.0 Licenses Gen
string type_key = "CR002";//Cronos V2.0 Licenses Gen
string type_key = "XN000";//Ultimate License Gen
string type_key = "XN001";//ScalpbyColors License //no gen
string type_key = "XN002";//ClearTrends License 
string type_key = "XN003";//Gama License
string type_key = "XN004";//Simple Buy Sell License
string type_key = "XN005";//FSU Cloud License
string type_key = "XN006";//FSU Step License
string type_key = "DA000";//Master Dashboard
*/

    
#import "wininet.dll"
int InternetCheckConnectionW(string &lpszUrl,uint dwFlags,uint dwReserved);
int InternetOpenW(string &lpszAgent,uint dwAccessType,string &lpszProxyName,string &lpszProxyBypass,uint dwFlags);
int InternetOpenUrlW(int hInternetSession,string &lpszUrl,string &lpszHeaders,uint dwHeadersLength,uint dwFlags,uint dwContext);
int InternetConnectW(int hInternet,string &lpszServerName,int nServerPort,string &lpszUsername,string &lpszPassword,uint dwService,uint dwFlags,uint dwContext);
int HttpOpenRequestW(int hConnect,string &lpszVerb,string &lpszObjectName,string &lpszVersion,string &lpszReferer,string &lplpszAcceptTypes,uint dwFlags,uint dwContext);
int HttpSendRequestW(int hRequest,string &lpszHeaders,uint dwHeadersLength,uchar &lpOptional[],uint dwOptionalLength);
int InternetReadFile(int hFile,uchar &lpBuffer[],uint dwNumberOfBytesToRead,uint &lpdwNumberOfBytesRead);
int InternetCloseHandle(int hInternet);
#import

uchar uc_Buffer[4096]; // InternetReadFile() expects a static buffer.


int Year();
int Month();
ulong AccChkVId=15061;//AccountInfoInteger(ACCOUNT_LOGIN);//;//15923390;//15937609;  // account number 5353497
ulong AccChkVId1=38525;//AccountInfoInteger(ACCOUNT_LOGIN);//;//15923390;//15937609;  // account number
ulong AccChkVId2=15091318;//AccountInfoInteger(ACCOUNT_LOGIN);//;//15923390;//15937609;  // account number
ulong AccChkVId3=93840157;//AccountInfoInteger(ACCOUNT_LOGIN);//;//15923390;//15937609;  // account number
ulong AccChkVId4=91985578;//AccountInfoInteger(ACCOUNT_LOGIN);//;//15923390;//15937609;  // account number
ulong AccChkVId5=51123625;//AccountInfoInteger(ACCOUNT_LOGIN);//;//15923390;//15937609;  // account number
ulong AccChkVId6=1100019197;//AccountInfoInteger(ACCOUNT_LOGIN);//;//15923390;//15937609;  // account number
ulong AccChkVId7=1100040226;//AccountInfoInteger(ACCOUNT_LOGIN);//;//15923390;//15937609;  // account number
ulong AccChkVId8=1100013415;//AccountInfoInteger(ACCOUNT_LOGIN);//;//15923390;//15937609;  // account number
ulong AccChkVId9=1100039001;//AccountInfoInteger(ACCOUNT_LOGIN);//;//15923390;//15937609;  // account number
ulong AccChkVId10=1100010672;//AccountInfoInteger(ACCOUNT_LOGIN);//;//15923390;//15937609;  // account number

int AccountCheckValidYear=2024;  // valid year
int AccountCheckValidMonth=13;  // valid month




//--- Library class for creating the graphical interface
#include <EasyAndFastGUI\WndEvents.mqh>
#include <EasyAndFastGUI\TimeCounter.mqh>

   input int INxshift89=0;
   input int INxshift55=0;
   input int INxshift34=0;
   input int INxshift26=0;
   input int INxshift18=0;
   input int INxshift8=0;
   input bool XPushGraphicCurrencyStrenght=true;
   input bool XPushAlert=true;

   
   
   input string MyTradeSuffix = "";


           
int FSU_A_Handle_89[5,35];//period,pair
int FSU_A_Handle_55[5,35];//period,pair
int FSU_A_Handle_34[5,35];//period,pair
int FSU_A_Handle_26[5,35];//period,pair
int FSU_A_Handle_18[5,35];//period,pair
int FSU_A_Handle_8[5,35];//period,pair

 string AllPairs[35];
   
int EURUSD = 0;
int GBPUSD = 1;
int AUDUSD = 2;
int USDJPY = 3;
int USDCHF = 4;
int USDCAD = 5;
int EURAUD = 6;
int EURCAD = 7;
int EURCHF = 8;
int EURGBP = 9;
int EURJPY = 10;
int GBPJPY = 11;
int GBPCHF = 12;
int NZDUSD = 13;
int AUDCAD = 14;
int AUDJPY = 15;
int CHFJPY = 16;
int AUDNZD = 17;
int NZDJPY = 18;
int NZDCAD = 19;
int NZDCHF = 20;
int GBPNZD = 21;
int EURNZD = 22;
int GBPCAD = 23;
int GBPAUD = 24;
int AUDCHF = 25;
int CADCHF = 26;
int CADJPY = 27;
int XAUUSD = 28;
int XAUAUD = 29;
int XAGUSD = 30;
int USDX = 31;
int SP500 = 32;



double Price[35];


#include <Trade\PositionInfo.mqh>               // Public Class CPositionInfo
#include <Trade\SymbolInfo.mqh>                 // Public Class CSymbolInfo
#include <Trade\Trade.mqh>                      // Public Clas CTrade
CPositionInfo  objPosition;                     // Properties of open position
CSymbolInfo    objSymbol;                       // symbol info object
CTrade         objTrade;



//gloo
string space = "";

#define ID_USD  0
#define ID_EUR  1
#define ID_GBP  2
#define ID_JPY  3
#define ID_CHF  4
#define ID_CAD  5
#define ID_NZD  6
#define ID_AUD  7
#define N_CROSS 8

extern int X = 80;
extern int Y = 50;
extern int Corner = 3;
extern int fontsize = 100;
extern string font = "Arial";


string USD = 0;
string EUR = 1;
string GBP = 2;
string JPY = 3;
string CHF = 4;
string CAD = 5;
string NZD = 6;
string AUD = 7;
string XValue;
string YValue;


string SingolaValuta[8];
int XAlertCounter=0;
int checkMin;



color ColoreValuta[] = {Red, 
                        CornflowerBlue, 
                        Turquoise, 
                        Coral, 
                        Pink,
                        PaleGreen, 
                        MediumOrchid, 
                        Gold};


string CoppiaValuta[28]; 



double CopiaPrice[28];
double CopiaD1Price[28];
double CopiaH1Price[28];

double XCopiaPrice[28,2];
double XCopiaD1Price[28,2];
double XCopiaH1Price[28,2];

double GlobalRates [28,4];
double Kopkop[28,2];
//


string XRULES[35,7];
string YRULES[35,4];
string PREXRULES[35,7];
string PREYRULES[35,4];
string CurrencyStrengtPushTableName[10];
double CurrencyStrengtPushTableValue[10];
//Cronos
//MagicNumber
ulong magicNumber=1001;
int numberBarsOpenPosition;
double operationStopLoss=0.0;
double operationTakeProffit=0.0;
double operationPrice=0.0;
double adjustPoint=0.0;
double ExtTakeProfit=0.0;
double ExtStopLoss=0.0;
input ushort               InpStopLoss=0;//Don't Change
input ushort               InpTakeProfit=0;//Don't Change

double MarketPrices[35,21000];
int MarketPriceShift;
//MarketPrice değerleri init aşamasında okunacaktır.
//10.000 dakika önceki veri 50.0000 ci array dizi değerine yazılacak
//ve devam eden 9.999 uncu veri 49.999 u veri olacak devam edecektir.
//değerlerin takibi için MarketPriceShift değişkeni kullanılacaktır.
//MarketPrices verisinde ilk değer çiftin int değer karşılığı ikinci değer hesaplanmış ortalamadır.
int HowManyPairsWorking=29; //bu değer üstünde çalışılacak ilk kaç çift işleme alınacak onu belirler.
int HowManyPairsWorkingx2=28; //bu değer üstünde çalışılacak ilk kaç çift işleme alınacak onu belirler.
//AllPairs değişkenleri global array içinde boyutlandırılmış ve init aşamasında boyutlara veriler işlenmiş olacaktır.
//çiftlerin karışık tanımlamaları ise int değişken olarak aşağıda bulunmaktadır. Bu değerler
//gerekli hallerde karışık cağırmaları için kullanılacaktır.
//Commentte push edilecek GlobalCommentText değeri tanımlama ile sıfırlanır
string GlobalCommentText=""; 

//Market manuplasyonu hesaplayan kısım her dakika için 2 ticaret işlemi vardır. Bu işlemler ortalama fiyat üzerinden açılır. 
//Cronos status verisinde bu işlemlerin açık kapalı durumları tutulur. 
int CronosLongStatus[35,21000];
int CronosShortStatus[35,21000];
double CronosLongProfit[35,21000];
double CronosShortProfit[35,21000];
double CronosLongTotal[35];
double CronosShortTotal[35];
int CronosLongCount[35];
int CronosShortCount[35];
string CronosSignals[35];
double CronosRates[35];//Sinyal oransalı
double CronosMomentums[35];
double CronosSuperMomentums[35];
//Cronos hesaplarında işlemlerin status değerleri ilk olarak 1 işaretlenir
//1 işlemlerin kar zarar hesapları yapılır. 
//0 işlemler kapatılmıştır. 
//işlemler 0.01 lot üzerinden 2 USD net kar ettiğinde veya 10 USD zarar oluştuğunda kapatılır. 
//kapatılan işlemler hesaplama dışında kalır. 


//dakika kontrol değişkenleri
int PreM1Min; //birdakika bir yapılacak işlemleri kontrol ara değeridir. Bu ana değişken ile karşılaştırılmalıdır.
int PreM5Min; //beşdakika da bir yapılacak işlemleri kontrol eder.
int PreM15Min;//onbeş dakikada bir yapılacak işlemleri kontrol eder.
int PreM30Min;
int PreM60Min;
//Temel zaman kontrol değişkenleri.
int CronosCalculationMin;


//MyTradeCalculation - Order ve trade işlemleri ile ilgili hesaplamalar.

double MTBuyCounts[35];
double MTSellCounts[35];
double MTBuyVolume[35];
double MTSellVolume[35];
double MTBuyProfit[35];
double MTSellProfit[35];









//+------------------------------------------------------------------+
//| Class for creating an application                                |
//+------------------------------------------------------------------+
class CProgram : public CWndEvents
  {
private:

   //--- Trading operations
   CTrade            m_trade;
   //--- Time counters
   CTimeCounter      m_counter1;
   CTimeCounter      m_counter2;
   CTimeCounter      m_counter3;
   CTimeCounter      m_counter4;

   //--- Symbols for trading
   string            m_symbols[];
   //--- Indicator handles
   int               m_handles[];
   //--- Indicator values
   double            m_values[];
   //--- Total symbols
   int               m_symbols_total;
   //--- Current chart handle index
   int               m_current_handle_index;
   //--- Time and ticket of the last checked trade
   datetime          m_last_deal_time;
   ulong             m_last_deal_ticket;

   //--- Window
   CWindow           m_window1;
   //--- Status bar
   CStatusBar        m_status_bar;
   //--- Tabs
   CTabs             m_tabs1;
   //--- Edits
   CTextEdit         m_symb_filter;
   CTextEdit         m_lot;
   CTextEdit         m_up_level;
   CTextEdit         m_down_level;
   CTextEdit         m_chart_scale;
   //--- Buttons
   CButton           m_request;
   CButton           m_chart_shift;
   CButton           m_buy;
   CButton           m_sell;
   CButton           m_close_all;
   //--- Combo boxes
   CComboBox         m_timeframes;
   //--- Checkboxes
   CCheckBox         m_date_scale;
   CCheckBox         m_price_scale;
   CCheckBox         m_show_indicator;
   //--- Tables
   CTable            m_table_positions;
   CTable            m_table_symb;
   //--- Standard chart
   CStandardChart    m_sub_chart1;
   //--- Progress bar
   CProgressBar      m_progress_bar;
   //---TEXT BOXES
   CTextBox          m_text_box2;
   CTextBox          m_text_box3;
public:
                     CProgram(void);
                    ~CProgram(void);
   //--- Initialization/deinitialization
   bool              OnInitEvent(void);
   void              OnDeinitEvent(const int reason);
   //--- "New tick" event handler
   void              OnTickEvent(void);
   //--- Trading event handler
   void              OnTradeEvent(void);
   //--- Timer
   void              OnTimerEvent(void);
   //--- Tester
   double            OnTesterEvent(void);
   //---
      //--- Set values in the value table
   void              SetValuesToPositionsTable();
      //--- Update the position table
   void              UpdatePositionsTable(void);
protected:
   //--- Handler of chart events
   virtual void      OnEvent(const int id,const long &lparam,const double &dparam,const string &sparam);
   //---
public:
   //--- Create the graphical interface
   bool              CreateGUI(void);
   //---
private:
   //--- Form
   bool              CreateWindow(const string text);
   //--- Status bar
   bool              CreateStatusBar(const int x_gap,const int y_gap);
   //--- Tabs
   bool              CreateTabs1(const int x_gap,const int y_gap);
   //--- Edits
  // bool              CreateSymbolsFilter(const int x_gap,const int y_gap,const string text);
      //--- Text 2

   //bool              CreateTextBox2(const int x_gap,const int y_gap);
   //bool              CreateTextBox3(const int x_gap,const int y_gap);


   //---
   
      bool              CreatePositionsTable(const int x_gap,const int y_gap);
      //TABLE MANUAL GAPS
#define TABLE1_GAP_X          (1)
#define TABLE1_GAP_Y          (1)

private:
   //--- Requesting data
   
   /*
   
   20 SL 30 TP ,, 3PİP GİT STOP İZLİ OLUR 
   İLK NOKTADAN 5 PİP SONRA 0.01
   
   */
   
   };
//+------------------------------------------------------------------+
//| Constructor                                                      |
//+------------------------------------------------------------------+
CProgram::CProgram(void) : m_symbols_total(0),
                           m_current_handle_index(WRONG_VALUE),
                           m_last_deal_time(NULL),
                           m_last_deal_ticket(WRONG_VALUE)
  {
//--- Setting parameters for the time counters
   m_counter1.SetParameters(16,1200);
   m_counter2.SetParameters(16,5000);
   m_counter3.SetParameters(16,5000);
   m_counter4.SetParameters(16,5000);
//counter 4 tablo yenileme hızı 500 yapınca saniyede bir ama çat çat yapıyor.
//---
  }
//+------------------------------------------------------------------+
//| Destructor                                                       |
//+------------------------------------------------------------------+
CProgram::~CProgram(void)
  {
  }
//+------------------------------------------------------------------+
//| Initialization                                                   |
//+------------------------------------------------------------------+
bool CProgram::OnInitEvent(void)
  {

//--- Initialization completed successfully
   return(true);
  }
//+------------------------------------------------------------------+
//| Deinitialization                                                 |
//+------------------------------------------------------------------+
void CProgram::OnDeinitEvent(const int reason)
  {

//--- Remove the interface
   CWndEvents::Destroy();
  }
//+------------------------------------------------------------------+
//| Trade operation event                                            |
//+------------------------------------------------------------------+
void CProgram::OnTradeEvent(void)
  {

  }
//+------------------------------------------------------------------+
//| Timer                                                            |
//+------------------------------------------------------------------+
void CProgram::OnTimerEvent(void)
  {
//--- Exit if this is the tester
   if(::MQLInfoInteger(MQL_TESTER) || ::MQLInfoInteger(MQL_FRAME_MODE))
      return;
//--- Handling the elements
   CWndEvents::OnTimerEvent();
//--- Update points in the status bar
   if(m_counter1.CheckTimeCounter())
     {
      //--- Set the values
      m_status_bar.SetValue(1,"  "+TimeToString(::TimeTradeServer(),TIME_DATE|TIME_SECONDS));
      //--- Update the points
      m_status_bar.GetItemPointer(1).Update(true);

     }
//--- Update the position table
  /* if(m_counter3.CheckTimeCounter())
     {

      //--- Update values in the table
      //SetValuesToPositionsTable();
      //UpdatePositionsTable();
     }*/
    if(m_counter4.CheckTimeCounter())
     {

      //--- Update values in the table
      SetValuesToPositionsTable();
      UpdatePositionsTable();
      //m_chart.Redraw();
      
      //UpdatePositionsTable();
      // Counter 4 tablo yenileme hızı
     }
 }
//+------------------------------------------------------------------+
//| "New tick" event                                                 |
//+------------------------------------------------------------------+
void CProgram::OnTickEvent(void)
  {   
     //SetValuesToPositionsTable();
     //UpdatePositionsTable();
      //Her tik yenileme yapınca tablo yüklenmede gecikiyor çat çat yapıyor.
  }
//+------------------------------------------------------------------+
//| Test completion event                                            |
//+------------------------------------------------------------------+
double CProgram::OnTesterEvent(void)
  {
  
   return(0.0);
  }
//+------------------------------------------------------------------+
//| Event handler                                                    |
//+------------------------------------------------------------------+
void CProgram::OnEvent(const int id,const long &lparam,const double &dparam,const string &sparam)
  {
//--- GUI creation event
  /* if(id==CHARTEVENT_CUSTOM+ON_END_CREATE_GUI)
     {
      
      //--- initialize the position table
      SetValuesToPositionsTable();
      UpdatePositionsTable();
      return;
     }*/

      return;


     
  }
  #resource "\\Images\\EasyAndFastGUI\\Icons\\bmp16\\arrowsx\\uparrow16x.bmp"
  #resource "\\Images\\EasyAndFastGUI\\Icons\\bmp16\\arrowsx\\downarrow16x.bmp"
  #resource "\\Images\\EasyAndFastGUI\\Icons\\bmp16\\arrowsx\\notr16x.bmp"


  string arrow_images_up[1]={"Images\\EasyAndFastGUI\\Icons\\bmp16\\arrowsx\\uparrow16x.bmp"};
  string arrow_images_down[1]={"Images\\EasyAndFastGUI\\Icons\\bmp16\\arrowsx\\downarrow16x.bmp"};
  string arrow_images_notr[1]={"Images\\EasyAndFastGUI\\Icons\\bmp16\\arrowsx\\notr16x.bmp"};
//+------------------------------------------------------------------+
//| Set values in the table                                          |
//+------------------------------------------------------------------+



  void CProgram::SetValuesToPositionsTable()
  {
   
   /*   
   if(license_status!=true)
   {
      if(type_key==StringSubstr(license_key,0,5))
         {
            if(license_status!=true)
               {
                  License_Check(false);
               }
         }  
      else
         {
            if(license_status!=true)
            {   
               Comment("Invalid Key Type for this product. Please check your license key. Expert will unload in 10 seconds.");
               Sleep(10000);
               ExpertRemove();
            }
         }
   }
   */
      
   MqlDateTime stm;
   datetime tm=TimeCurrent(stm);
   ulong AccChk=AccountInfoInteger(ACCOUNT_LOGIN);
   int CurrentDay=stm.day;

   //if(stm.year > AccountCheckValidYear || (AccChk!=AccChkVId&&AccChk!=AccChkVId1&&AccChk!=AccChkVId2&&AccChk!=AccChkVId3&&AccChk!=AccChkVId4&&AccChk!=AccChkVId5&&AccChk!=AccChkVId6&&AccChk!=AccChkVId7&&AccChk!=AccChkVId8&&AccChk!=AccChkVId9&&AccChk!=AccChkVId10) || stm.mon>AccountCheckValidMonth)
   //if(stm.year>AccountCheckValidYear || license_status==false)
   if(stm.year>AccountCheckValidYear)
   {
   Comment("Expire" + stm.year +":"+ license_status_comment);
   //return(0);
   }
   else
   {
     
         for(int i=0; i<HowManyPairsWorkingx2; i++)
         {

           
             m_table_positions.SetValue(3,i,DoubleToString(GlobalRates [i,0],2));
              
               if(GlobalRates [i,0]>1)
               {
                  m_table_positions.SetImages(4,i,arrow_images_up);
               } 
               if(GlobalRates [i,0]<1)
               {
                  m_table_positions.SetImages(4,i,arrow_images_down);
               }

            
          } 
           

         
         

            
         for(int i=0; i<HowManyPairsWorking; i++)
         {   


           if(XRULES[i,0]=="UP")m_table_positions.SetImages(18,i,arrow_images_up);
           else if(XRULES[i,0]=="DOWN")m_table_positions.SetImages(18,i,arrow_images_down);
           else m_table_positions.SetImages(18,i,arrow_images_notr);


           if(XRULES[i,1]=="UP")m_table_positions.SetImages(19,i,arrow_images_up);
           else if(XRULES[i,1]=="DOWN")m_table_positions.SetImages(19,i,arrow_images_down);
           else m_table_positions.SetImages(19,i,arrow_images_notr);
           
           if(XRULES[i,2]=="UP")m_table_positions.SetImages(20,i,arrow_images_up);
           else if(XRULES[i,2]=="DOWN")m_table_positions.SetImages(20,i,arrow_images_down);
           else m_table_positions.SetImages(20,i,arrow_images_notr);
           
           if(XRULES[i,3]=="UP")m_table_positions.SetImages(21,i,arrow_images_up);
           else if(XRULES[i,3]=="DOWN")m_table_positions.SetImages(21,i,arrow_images_down);
           else m_table_positions.SetImages(21,i,arrow_images_notr);
           
           if(XRULES[i,4]=="UP")m_table_positions.SetImages(22,i,arrow_images_up);
           else if(XRULES[i,4]=="DOWN")m_table_positions.SetImages(22,i,arrow_images_down);
           else m_table_positions.SetImages(22,i,arrow_images_notr);
         
           if(XRULES[i,5]=="UP")m_table_positions.SetImages(23,i,arrow_images_up);
           else if(XRULES[i,5]=="DOWN")m_table_positions.SetImages(23,i,arrow_images_down);
           else m_table_positions.SetImages(23,i,arrow_images_notr);
        
           if(XRULES[i,6]=="UP")m_table_positions.SetImages(24,i,arrow_images_up);
           else if(XRULES[i,6]=="DOWN")m_table_positions.SetImages(24,i,arrow_images_down);
           else m_table_positions.SetImages(24,i,arrow_images_notr);
           
           
 
           if(YRULES[i,1]=="UP")m_table_positions.SetImages(26,i,arrow_images_up);
           else if(YRULES[i,1]=="DOWN")m_table_positions.SetImages(26,i,arrow_images_down);
           else m_table_positions.SetImages(26,i,arrow_images_notr);
     
           if(YRULES[i,2]=="UP")m_table_positions.SetImages(27,i,arrow_images_up);
           else if(YRULES[i,2]=="DOWN")m_table_positions.SetImages(27,i,arrow_images_down);
           else m_table_positions.SetImages(27,i,arrow_images_notr);
    
           if(YRULES[i,3]=="UP")m_table_positions.SetImages(28,i,arrow_images_up);
           else if(YRULES[i,3]=="DOWN")m_table_positions.SetImages(28,i,arrow_images_down);
           else m_table_positions.SetImages(28,i,arrow_images_notr);
      

                   
            if(CronosSignals[i]=="UP")
            {
                  m_table_positions.SetImages(2,i,arrow_images_up);
            }             
            
            if(CronosSignals[i]=="DOWN")
            {
                  m_table_positions.SetImages(2,i,arrow_images_down);
            } 
            
            if(CronosSignals[i]=="NOTR")
            {
                  m_table_positions.SetImages(2,i,arrow_images_notr);
            } 
            

               
         }
         for(int i=0; i<HowManyPairsWorking; i++)
         {
            m_table_positions.SetValue(0,i,AllPairs[i]);
            //m_table_positions.SetValue(1,i-1,Price[i,0]);
            if((Price[i])<10)
            {
            m_table_positions.SetValue(1,i,DoubleToString(Price[i],5));
            }
            if((Price[i])>=10)
            {
            m_table_positions.SetValue(1,i,DoubleToString(Price[i],3));
            }
            m_table_positions.SetValue(25,i,AllPairs[i]);
       


            if(FSU_A_55(0,i,0,INxshift89)<10)
            {
             m_table_positions.SetValue(5,i,DoubleToString(FSU_A_89(0,i,0,INxshift89),5));
            }
            if(FSU_A_55(0,i,0,INxshift89)>=10)
            {
            m_table_positions.SetValue(5,i,DoubleToString(FSU_A_89(0,i,0,INxshift89),3));
            }
            
            if(FSU_A_55(0,i,0,INxshift55)<10)
            {
             m_table_positions.SetValue(7,i,DoubleToString(FSU_A_55(0,i,0,INxshift55),5));
            }
            if(FSU_A_55(0,i,0,INxshift55)>=10)
            {
            m_table_positions.SetValue(7,i,DoubleToString(FSU_A_55(0,i,0,INxshift55),3));
            }
            
            
            
            if(FSU_A_34(1,i,0,INxshift34)<10)
            {
             m_table_positions.SetValue(9,i,DoubleToString(FSU_A_34(1,i,0,INxshift34),5));
            }
            if(FSU_A_34(1,i,0,INxshift34)>=10)
            {
            m_table_positions.SetValue(9,i,DoubleToString(FSU_A_34(1,i,0,INxshift34),3));
            }
            
            
            if(FSU_A_26(2,i,0,INxshift26)<10)
            {
             m_table_positions.SetValue(11,i,DoubleToString(FSU_A_26(2,i,0,INxshift26),5));
            }
            if(FSU_A_26(2,i,0,INxshift26)>=10)
            {
            m_table_positions.SetValue(11,i,DoubleToString(FSU_A_26(2,i,0,INxshift26),3));
            }
            
            
            if(FSU_A_18(3,i,0,INxshift18)<10)
            {
             m_table_positions.SetValue(13,i,DoubleToString(FSU_A_18(3,i,0,INxshift18),5));
            }
            if(FSU_A_18(3,i,0,INxshift18)>=10)
            {
            m_table_positions.SetValue(13,i,DoubleToString(FSU_A_18(3,i,0,INxshift18),3));
            }
            
            
            if(FSU_A_8(4,i,0,INxshift8)<10)
            {
             m_table_positions.SetValue(15,i,DoubleToString(FSU_A_18(4,i,0,INxshift18),5));
            }
            if(FSU_A_8(4,i,0,INxshift8)>=10)
            {
            m_table_positions.SetValue(15,i,DoubleToString(FSU_A_18(4,i,0,INxshift18),3));
            }
           
         }  
         
            


         for(int i=0; i<HowManyPairsWorking; i++)
         {
           
           
           if(FSU_A_89(0,i,1,INxshift89)==0)m_table_positions.SetImages(6,i,arrow_images_up);
           if(FSU_A_89(0,i,1,INxshift89)==1)m_table_positions.SetImages(6,i,arrow_images_down);

           if(FSU_A_55(0,i,1,INxshift55)==0)m_table_positions.SetImages(8,i,arrow_images_up);
           if(FSU_A_55(0,i,1,INxshift55)==1)m_table_positions.SetImages(8,i,arrow_images_down);
           
           if(FSU_A_34(1,i,1,INxshift34)==0)m_table_positions.SetImages(10,i,arrow_images_up);
           if(FSU_A_34(1,i,1,INxshift34)==1)m_table_positions.SetImages(10,i,arrow_images_down);
          
           if(FSU_A_26(2,i,1,INxshift26)==0)m_table_positions.SetImages(12,i,arrow_images_up);
           if(FSU_A_26(2,i,1,INxshift26)==1)m_table_positions.SetImages(12,i,arrow_images_down);
           
           if(FSU_A_18(3,i,1,INxshift18)==0)m_table_positions.SetImages(14,i,arrow_images_up);
           if(FSU_A_18(3,i,1,INxshift18)==1)m_table_positions.SetImages(14,i,arrow_images_down);
           
           if(FSU_A_8(4,i,1,INxshift8)==0)m_table_positions.SetImages(16,i,arrow_images_up);
           if(FSU_A_8(4,i,1,INxshift8)==1)m_table_positions.SetImages(16,i,arrow_images_down);
           



           


           
         }      
         
         /*
         for(int i=0; i<8; i++)
         {

         m_table_positions.SetValue(21,i,CurrencyStrengtPushTableName[i]);   
         m_table_positions.SetValue(22,i,CurrencyStrengtPushTableValue[i]); 
         
                     m_table_positions.TextColor(21,0,clrGreen);  
                     m_table_positions.TextColor(21,1,clrGreen);
                     
                     m_table_positions.TextColor(21,6,clrRed);  
                     m_table_positions.TextColor(21,7,clrRed);
                     
                     m_table_positions.TextColor(22,0,clrGreen);  
                     m_table_positions.TextColor(22,1,clrGreen);
                     
                     m_table_positions.TextColor(22,6,clrRed);  
                     m_table_positions.TextColor(22,7,clrRed);
                                            
 
         
         }  
         
         */                                     
         for(int i=0; i<29; i++)
         {
            m_table_positions.TextColor(0,i,clrDarkBlue);
            m_table_positions.TextColor(1,i,clrBlue);
            m_table_positions.TextColor(2,i,clrBlue);
            m_table_positions.TextColor(3,i,clrBlue);
            m_table_positions.TextColor(4,i,clrBlue);
            m_table_positions.TextColor(5,i,clrBlue);
            m_table_positions.TextColor(6,i,clrBlue);
            m_table_positions.TextColor(7,i,clrBlue);
            m_table_positions.TextColor(8,i,clrBlue);
            m_table_positions.TextColor(9,i,clrBlue);
            m_table_positions.TextColor(10,i,clrBlue);
            m_table_positions.TextColor(11,i,clrBlue);
            m_table_positions.TextColor(12,i,clrBlue);
            m_table_positions.TextColor(13,i,clrBlue);
            m_table_positions.TextColor(14,i,clrBlue);
            m_table_positions.TextColor(15,i,clrBlue);
            m_table_positions.TextColor(16,i,clrBlue);
            m_table_positions.TextColor(17,i,clrBlue);
            m_table_positions.TextColor(18,i,clrBlue);
            m_table_positions.TextColor(19,i,clrBlue);
            m_table_positions.TextColor(20,i,clrBlue);
            m_table_positions.TextColor(21,i,clrBlue);
            m_table_positions.TextColor(22,i,clrBlue);
            m_table_positions.TextColor(23,i,clrBlue);
            m_table_positions.TextColor(24,i,clrBlue);
            m_table_positions.TextColor(26,i,clrBlue);
            m_table_positions.TextColor(27,i,clrBlue);
            m_table_positions.TextColor(28,i,clrBlue);
            m_table_positions.TextColor(25,i,clrDarkBlue);
  


         }

}
         
     }
     

//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//| Update the position table                                        |
//+------------------------------------------------------------------+
void CProgram::UpdatePositionsTable(void)
  {
//--- Update the table
   m_table_positions.Update(true);
   m_table_positions.GetScrollVPointer().Update(true);
   m_table_positions.GetScrollHPointer().Update(true);
  }
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//| Create the graphical interface                                   |
//+------------------------------------------------------------------+
bool CProgram::CreateGUI(void)
  {
//--- Create the form for control elements
   if(!CreateWindow("FX FOREX STORE MASTER'S DAILY PRIVATE SIGNALS DASHBOARD"))
      return(false);
//--- Create control elements
   if(!CreateStatusBar(1,23))
      return(false);
//--- Tabs
   if(!CreateTabs1(3,43))
      return(false);
//--- Edits
  /* if(!CreateSymbolsFilter(7,5,"Symbols filter: "))
      return(false);
  
   if(!CreateTextBox2(5,45))
      return(false);
   if(!CreateTextBox3(5,45))
      return(false);*/
//--- Table
   if(!CreatePositionsTable(2,2))
      return(false);



//--- Complete GUI creation
   CWndEvents::CompletedGUI();
   return(true);
  }
//+------------------------------------------------------------------+
//| Creates a form for control elements                              |
//+------------------------------------------------------------------+
bool CProgram::CreateWindow(const string caption_text)
  {
//--- Add a window pointer to the window array
   CWndContainer::AddWindow(m_window1);
//--- Properties
   m_window1.XSize(1500);
   m_window1.YSize(868);
   m_window1.FontSize(9);
   m_window1.IsMovable(true);
   m_window1.ResizeMode(true);
   m_window1.CloseButtonIsUsed(true);
   m_window1.CollapseButtonIsUsed(true);
   m_window1.TooltipsButtonIsUsed(false);
   m_window1.FullscreenButtonIsUsed(true);
//--- Set the tooltips
   m_window1.GetCloseButtonPointer().Tooltip("Close");
// m_window1.GetTooltipButtonPointer().Tooltip("Tooltips");
   m_window1.GetFullscreenButtonPointer().Tooltip("Fullscreen");
   m_window1.GetCollapseButtonPointer().Tooltip("Collapse/Expand");
//--- Create the form
   if(!m_window1.CreateWindow(m_chart_id,m_subwin,caption_text,1,1))
      return(false);
//---
   return(true);
  }
//+------------------------------------------------------------------+
//| Creates the status bar                                           |
//+------------------------------------------------------------------+
bool CProgram::CreateStatusBar(const int x_gap,const int y_gap)
  {
#define STATUS_LABELS_TOTAL 2
//--- Store the window pointer
   m_status_bar.MainPointer(m_window1);
//--- Properties
   m_status_bar.AutoXResizeMode(true);
   m_status_bar.AutoXResizeRightOffset(1);
   m_status_bar.AnchorBottomWindowSide(true);
//--- Specify the number of parts and set their properties
   int width[STATUS_LABELS_TOTAL]={0,135};
   for(int i=0; i<STATUS_LABELS_TOTAL; i++)
      m_status_bar.AddItem(width[i]);
//--- Create a control element
   if(!m_status_bar.CreateStatusBar(x_gap,y_gap))
      return(false);
//--- Set text to the items of the status bar
   m_status_bar.SetValue(0,"https://www.youtube.com/ForexSignals | https://www.youtube.com/@ForexSignals | For More Information : eurousdforexlive@gmail.com");
//--- Add the object to the common array of object groups
   CWndContainer::AddToElementsArray(0,m_status_bar);
   return(true);
  }

//+------------------------------------------------------------------+
//| Create a group with tabs 1                                       |
//+------------------------------------------------------------------+
bool CProgram::CreateTabs1(const int x_gap,const int y_gap)
  {
#define TABS1_TOTAL 1
//--- Store the pointer to the main control
   m_tabs1.MainPointer(m_window1);
//--- Properties
   m_tabs1.IsCenterText(true);
   m_tabs1.PositionMode(TABS_TOP);
   m_tabs1.AutoXResizeMode(true);
   m_tabs1.AutoYResizeMode(true);
   m_tabs1.AutoXResizeRightOffset(3);
   m_tabs1.AutoYResizeBottomOffset(23);
//--- Add tabs with the specified properties
   string tabs_names[TABS1_TOTAL]={"FSU_MS DASHBOARD"};
   for(int i=0; i<TABS1_TOTAL; i++)
      m_tabs1.AddTab(tabs_names[i],220);
//--- Create a control element
   if(!m_tabs1.CreateTabs(x_gap,y_gap))
      return(false);
//--- Add the object to the common array of object groups
   CWndContainer::AddToElementsArray(0,m_tabs1);
   return(true);
  }

//+------------------------------------------------------------------+
//| Create a table                                                   |
//+------------------------------------------------------------------+
bool CProgram::CreatePositionsTable(const int x_gap,const int y_gap)
  {
#define COLUMNS2_TOTAL 29
#define ROWS2_TOTAL    29
//--- Store the pointer to the main control
   m_table_positions.MainPointer(m_tabs1);
//--- Attach to tab
   m_tabs1.AddToElementsArray(0,m_table_positions);
//--- Array of column widths
   int width[COLUMNS2_TOTAL];
   ::ArrayInitialize(width,75);

   width[0]=80;
   width[1]=80;
   width[2]=36;
   width[3]=80;
   width[4]=36;
   width[5]=80;
   width[6]=36;
   width[7]=80;
   width[8]=36;
   width[9]=80;
   width[10]=36;
   width[11]=80;
   width[12]=36;
   width[13]=80;
   width[14]=36;
   width[15]=80;
   width[16]=36;
   width[17]=36;
   
   width[18]=36;
  
   width[19]=36;
   width[20]=36;
   width[21]=36;
   
   width[22]=36;
   width[23]=36;
   width[24]=36;
   
   width[25]=80;
   
   width[26]=36;
   width[27]=36;
   width[28]=36;
   

   

//--- Array of text alignment in columns
   ENUM_ALIGN_MODE align[COLUMNS2_TOTAL];
   ::ArrayInitialize(align,ALIGN_CENTER);

   align[2]=ALIGN_LEFT;
   align[4]=ALIGN_LEFT;
   align[6]=ALIGN_LEFT;
   align[8]=ALIGN_LEFT;
   align[10]=ALIGN_LEFT;
   align[12]=ALIGN_LEFT;
   align[13]=ALIGN_LEFT;   
   align[14]=ALIGN_LEFT;

   align[16]=ALIGN_LEFT;
   align[18]=ALIGN_LEFT;   
   align[19]=ALIGN_LEFT;   
   align[20]=ALIGN_LEFT;   
   align[21]=ALIGN_LEFT;   
   align[22]=ALIGN_LEFT;   
   align[23]=ALIGN_LEFT;   
   align[24]=ALIGN_LEFT;   
   align[26]=ALIGN_LEFT;   
   align[27]=ALIGN_LEFT;   
   align[28]=ALIGN_LEFT;   


   
//--- Array of text offset along the X axis in the columns
   int text_x_offset[COLUMNS2_TOTAL];
   ::ArrayInitialize(text_x_offset,21);

//--- Array of column image offsets along the X axis
   int image_x_offset[COLUMNS2_TOTAL];
   ::ArrayInitialize(image_x_offset,10);
//--- Array of column image offsets along the Y axis
   int image_y_offset[COLUMNS2_TOTAL];
   ::ArrayInitialize(image_y_offset,7);
   
   
   
  int height=(26);
//--- Properties
   m_table_positions.TableSize(COLUMNS2_TOTAL,ROWS2_TOTAL);
   m_table_positions.ColumnsWidth(width);
   m_table_positions.CellYSize(height);
   m_table_positions.TextAlign(align);
   m_table_positions.HeadersTextColor(clrBlack);
   m_table_positions.TextXOffset(text_x_offset);
   m_table_positions.ImageXOffset(image_x_offset);
   m_table_positions.ImageYOffset(image_y_offset);
   m_table_positions.ShowHeaders(true);
   m_table_positions.IsSortMode(true);
   m_table_positions.SelectableRow(true);
   m_table_positions.ColumnResizeMode(true);
   m_table_positions.IsZebraFormatRows(clrWhiteSmoke);
   m_table_positions.AutoXResizeMode(true);
   m_table_positions.AutoYResizeMode(true);
   m_table_positions.AutoXResizeRightOffset(2);
   m_table_positions.AutoYResizeBottomOffset(2);
   m_table_positions.FontSize(9);
   m_table_positions.HeaderYSize(25);
   m_table_positions.HeadersColor(clrLightSkyBlue);

   //m_table_positions.CellType(0,0,CELL_BUTTON);
   //m_table_positions.SetImages(0,1,arrow_images);
//--- Create a control element
   if(!m_table_positions.CreateTable(x_gap,y_gap))
      return(false);
//--- Set the header titles
   string headers[COLUMNS2_TOTAL]={"PAIRS","MARKET","MS","X/Y","X/Y","M1(89)"," M1","M5(55)"," M5","M15(34)","M15","H1(26)"," H1","H4(18)"," H4","D1(8)"," D1","  ","  X0","  X1","  X2","  X3","  X4","  X5","  X6","PAIRS","  Y1","  Y2","  Y3"};
   for(int i=0; i<COLUMNS2_TOTAL; i++)
      m_table_positions.SetHeaderText(i,headers[i]);
 
//--- Add the object to the common array of object groups
   CWndContainer::AddToElementsArray(0,m_table_positions);
   return(true);
  }
//+------------------------------------------------------------------+


//--- Include application class

CProgram program;
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit(void)
  {
   /*
   if(license_status!=true)
   {
      if(type_key==StringSubstr(license_key,0,5))
         {
            if(license_status!=true)
               {
                  License_Check(false);
               }
         }  
      else
         {
            if(license_status!=true)
            {   
               Comment("Invalid Key Type for this product. Please check your license key. Expert will unload in 30 seconds.");
               Sleep(30000);
               ExpertRemove();
            }
         }
   }
   */
   MqlDateTime stm;
   datetime tm=TimeCurrent(stm);
   ulong AccChk=AccountInfoInteger(ACCOUNT_LOGIN);
   int CurrentDay=stm.day;

   //if(stm.year > AccountCheckValidYear || (AccChk!=AccChkVId&&AccChk!=AccChkVId1&&AccChk!=AccChkVId2&&AccChk!=AccChkVId3&&AccChk!=AccChkVId4&&AccChk!=AccChkVId5&&AccChk!=AccChkVId6&&AccChk!=AccChkVId7&&AccChk!=AccChkVId8&&AccChk!=AccChkVId9&&AccChk!=AccChkVId10) || stm.mon>AccountCheckValidMonth)
   //if(stm.year>AccountCheckValidYear || license_status==false)
   if(stm.year>AccountCheckValidYear)
   {
   Comment("License Invalid : " + stm.year +  " Check Status : " + license_status_comment);
   return(0);
   }
   else
   {
   Comment(AccChk);
   
   
   
   AllPairs[0]="EURUSD"+MyTradeSuffix;
   AllPairs[1]="GBPUSD"+MyTradeSuffix;
   AllPairs[2]="AUDUSD"+MyTradeSuffix;
   AllPairs[3]="USDJPY"+MyTradeSuffix;
   AllPairs[4]="USDCHF"+MyTradeSuffix;
   AllPairs[5]="USDCAD"+MyTradeSuffix;
   AllPairs[6]="EURAUD"+MyTradeSuffix;
   AllPairs[7]="EURCAD"+MyTradeSuffix;
   AllPairs[8]="EURCHF"+MyTradeSuffix;
   AllPairs[9]="EURGBP"+MyTradeSuffix;
   AllPairs[10]="EURJPY"+MyTradeSuffix;
   AllPairs[11]="GBPJPY"+MyTradeSuffix;
   AllPairs[12]="GBPCHF"+MyTradeSuffix;
   AllPairs[13]="NZDUSD"+MyTradeSuffix;
   AllPairs[14]="AUDCAD"+MyTradeSuffix;
   AllPairs[15]="AUDJPY"+MyTradeSuffix;
   AllPairs[16]="CHFJPY"+MyTradeSuffix;
   AllPairs[17]="AUDNZD"+MyTradeSuffix;
   AllPairs[18]="NZDJPY"+MyTradeSuffix;
   AllPairs[19]="NZDCAD"+MyTradeSuffix;
   AllPairs[20]="NZDCHF"+MyTradeSuffix;
   AllPairs[21]="GBPNZD"+MyTradeSuffix;
   AllPairs[22]="EURNZD"+MyTradeSuffix;
   AllPairs[23]="GBPCAD"+MyTradeSuffix;
   AllPairs[24]="GBPAUD"+MyTradeSuffix;
   AllPairs[25]="AUDCHF"+MyTradeSuffix;
   AllPairs[26]="CADCHF"+MyTradeSuffix;
   AllPairs[27]="CADJPY"+MyTradeSuffix;
   AllPairs[28]="XAUUSD"+MyTradeSuffix;
   AllPairs[29]="XAUAUD"+MyTradeSuffix;
   AllPairs[30]="";
   AllPairs[31]="";
   AllPairs[32]="";

  
   for(int xpai=0; xpai<29; xpai++)
   {
   
      FSU_A_Handle_89[0,xpai]=iCustom(AllPairs[xpai],PERIOD_M5,"FSU_A_89");         
      FSU_A_Handle_89[1,xpai]=iCustom(AllPairs[xpai],PERIOD_M15,"FSU_A_89");
      FSU_A_Handle_89[2,xpai]=iCustom(AllPairs[xpai],PERIOD_H1,"FSU_A_89");
      FSU_A_Handle_89[3,xpai]=iCustom(AllPairs[xpai],PERIOD_H4,"FSU_A_89");
      FSU_A_Handle_89[4,xpai]=iCustom(AllPairs[xpai],PERIOD_D1,"FSU_A_89");

      FSU_A_Handle_55[0,xpai]=iCustom(AllPairs[xpai],PERIOD_M5,"FSU_A_55");         
      FSU_A_Handle_55[1,xpai]=iCustom(AllPairs[xpai],PERIOD_M15,"FSU_A_55");
      FSU_A_Handle_55[2,xpai]=iCustom(AllPairs[xpai],PERIOD_H1,"FSU_A_55");
      FSU_A_Handle_55[3,xpai]=iCustom(AllPairs[xpai],PERIOD_H4,"FSU_A_55");
      FSU_A_Handle_55[4,xpai]=iCustom(AllPairs[xpai],PERIOD_D1,"FSU_A_55");
      
      FSU_A_Handle_34[0,xpai]=iCustom(AllPairs[xpai],PERIOD_M5,"FSU_A_34");      
      FSU_A_Handle_34[1,xpai]=iCustom(AllPairs[xpai],PERIOD_M15,"FSU_A_34");
      FSU_A_Handle_34[2,xpai]=iCustom(AllPairs[xpai],PERIOD_H1,"FSU_A_34");
      FSU_A_Handle_34[3,xpai]=iCustom(AllPairs[xpai],PERIOD_H4,"FSU_A_34");
      FSU_A_Handle_34[4,xpai]=iCustom(AllPairs[xpai],PERIOD_D1,"FSU_A_34");

      FSU_A_Handle_26[0,xpai]=iCustom(AllPairs[xpai],PERIOD_M5,"FSU_A_26");
      FSU_A_Handle_26[1,xpai]=iCustom(AllPairs[xpai],PERIOD_M15,"FSU_A_26");
      FSU_A_Handle_26[2,xpai]=iCustom(AllPairs[xpai],PERIOD_H1,"FSU_A_26");
      FSU_A_Handle_26[3,xpai]=iCustom(AllPairs[xpai],PERIOD_H4,"FSU_A_26");
      FSU_A_Handle_26[4,xpai]=iCustom(AllPairs[xpai],PERIOD_D1,"FSU_A_26");

      FSU_A_Handle_18[0,xpai]=iCustom(AllPairs[xpai],PERIOD_M5,"FSU_A_18");      
      FSU_A_Handle_18[1,xpai]=iCustom(AllPairs[xpai],PERIOD_M15,"FSU_A_18");
      FSU_A_Handle_18[2,xpai]=iCustom(AllPairs[xpai],PERIOD_H1,"FSU_A_18");
      FSU_A_Handle_18[3,xpai]=iCustom(AllPairs[xpai],PERIOD_H4,"FSU_A_18");
      FSU_A_Handle_18[4,xpai]=iCustom(AllPairs[xpai],PERIOD_D1,"FSU_A_18");
      
      FSU_A_Handle_8[0,xpai]=iCustom(AllPairs[xpai],PERIOD_M5,"FSU_A_8");      
      FSU_A_Handle_8[1,xpai]=iCustom(AllPairs[xpai],PERIOD_M15,"FSU_A_8");
      FSU_A_Handle_8[2,xpai]=iCustom(AllPairs[xpai],PERIOD_H1,"FSU_A_8");
      FSU_A_Handle_8[3,xpai]=iCustom(AllPairs[xpai],PERIOD_H4,"FSU_A_8");
      FSU_A_Handle_8[4,xpai]=iCustom(AllPairs[xpai],PERIOD_D1,"FSU_A_8");
    
    }
//---------------CRONOS------------------------------//
//karlılık kontrolleri


// Cronos Status Values Reset
// Cronos Profit Values Reset
      for(int i=0;i<21000;i++)
      {
         for(int j=0;j<HowManyPairsWorking;j++)
         {
         CronosLongStatus[j,i]=0;
         CronosShortStatus[j,i]=0;
         CronosLongProfit[j,i]=0.00;
         CronosShortProfit[j,i]=0.00;
         }
      }

//Market fiyatlarının okunması
   GlobalCommentText = "Read Pairs ..";
   for(int i=0; i<HowManyPairsWorking; i++) //Pairs loop
     {
      //çiftlere ait i değerleri okunuyor.
      string WorkingPair = AllPairs[i]; //Calışılacak çiftin etiket değeri alınıyor.
      GlobalCommentText = GlobalCommentText + "/" + WorkingPair;
      //10.000' i shift 20.000 ne yazılacak.'
      for(int j=10000; j>0; j--)
        {
         //fiyat okumaları yapılıyor. ve PushPriceValue shift değeri ile ortalama fiyat MarketFiyatı olarak yazılıyor.
         int PushPriceValue = j;
         double HighPrice = iHigh(WorkingPair,PERIOD_M1,j);
         double LowPrice = iLow(WorkingPair,PERIOD_M1,j);
         double OpenPrice = iOpen(WorkingPair,PERIOD_M1,j);
         double ClosePrice = iClose(WorkingPair,PERIOD_M1,j);
         double AveragePrice = (HighPrice+LowPrice+OpenPrice+ClosePrice)/4;
         MarketPrices[i,PushPriceValue] = AveragePrice;
         CronosLongStatus[i,PushPriceValue]=1; //Cronos işlemleri açılmış oldu.
         CronosShortStatus[i,PushPriceValue]=1; //Cronos short işlemleri açılmış oldu.
        }
      GlobalCommentText = GlobalCommentText + "..";  
     } // End of pairs loop

//Cronos init
   
   for(int i=0;i<HowManyPairsWorking;i++)
      { //çiftler gelecek.
         string CronosPair = AllPairs[i];
         double CronosPoint = SymbolInfoDouble(AllPairs[i],SYMBOL_POINT);
         
            for(int iCalculator=1;iCalculator<10000;iCalculator++)
              {
               //fiyat okumaları yapılıyor. ve PushPriceValue shift değeri ile ortalama fiyat MarketFiyatı olarak yazılıyor.
               double CronosCalculationPrice = MarketPrices[i,10000-iCalculator];
               
               for(int j=10000; j>10000-iCalculator;j--)
                  {
                  //iCalculator kontrol başlangıcının hesabıdır. sipariş tarama aşaması hangi noktadan başlayacak
                  //-1 kullanmamızın sebebi bir sonraki dakikaya göre işlem yapıp siparişleri taramak. 
                  if(CronosPoint!=0.0){if(CronosLongStatus[i,j]==1){CronosLongProfit[i,j]=(-MarketPrices[i,j]+CronosCalculationPrice)*(1.00/CronosPoint)*0.01;}}
                  if(CronosPoint!=0.0){if(CronosShortStatus[i,j]==1){CronosShortProfit[i,j]=(MarketPrices[i,j]-CronosCalculationPrice)*(1.00/CronosPoint)*0.01;}}
                  if(CronosLongProfit[i,j]>2.00||CronosLongProfit[i,j]<-10.00){CronosLongStatus[i,j]=0;CronosLongProfit[i,j]=0.00;}
                  if(CronosShortProfit[i,j]>2.00||CronosShortProfit[i,j]<-10.00){CronosShortStatus[i,j]=0;CronosShortProfit[i,j]=0.00;}
                  
                  }
              }
      }

//Cronos Inıt Done;
//Cronos Calculation Inıt;
      //Bu alanda cronos'a ait Status Değerleri taranacak ve bu değerlerin 1 olanları toplanıp Buy/Sell order rate elde edilecek.'
      //Bu alanda cronos'a ait Profit değerleri taranacak ve bu değerlerin toplamları ile buy sell order profit rate elde edilecek.'
      for(int i=0;i<HowManyPairsWorking;i++)
         {  
            CronosLongCount[i] = 0;
            CronosShortCount[i] = 0;
            CronosLongTotal[i] = 0;
            CronosShortTotal[i] = 0;
            for(int j=1;j<11000;j++)
               {
                  if(CronosLongStatus[i,j]!=0){CronosLongCount[i]=CronosLongCount[i]+1;}
                  if(CronosShortStatus[i,j]!=0){CronosShortCount[i]=CronosShortCount[i]+1;}
                  if(CronosLongProfit[i,j]!=0.00){CronosLongTotal[i]=CronosLongTotal[i]+CronosLongProfit[i,j];}
                  if(CronosShortProfit[i,j]!=0.00){CronosShortTotal[i]=CronosShortTotal[i]+CronosShortProfit[i,j];}
               }
         }

   

//-----------------------------------------------------------------------------------------//
//--- Initialize program
   if(!program.OnInitEvent())
     {
      ::Print(__FUNCTION__," > Failed to initialize!");
      return(INIT_FAILED);
     }
//--- Create the graphical interface
   if(!program.CreateGUI())
     {
      ::Print(__FUNCTION__," > Could not create the GUI!");
      return(INIT_FAILED);
     }
//---
   return(INIT_SUCCEEDED);
   
   }
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   program.OnDeinitEvent(reason);
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick(void)
{
   /*
   if(license_status!=true)
   {
      if(type_key==StringSubstr(license_key,0,5))
         {
            if(license_status!=true)
               {
                  License_Check(false);
               }
         }  
      else
         {
            if(license_status!=true)
            {   
               Comment("Invalid Key Type for this product. Please check your license key. Expert will unload in 10 seconds.");
               Sleep(10000);
               ExpertRemove();
            }
         }
   }
   */
   MqlDateTime stm;
   datetime tm=TimeCurrent(stm);
   ulong AccChk=AccountInfoInteger(ACCOUNT_LOGIN);
   int CurrentDay=stm.day;

   //if(stm.year > AccountCheckValidYear || (AccChk!=AccChkVId&&AccChk!=AccChkVId1&&AccChk!=AccChkVId2&&AccChk!=AccChkVId3&&AccChk!=AccChkVId4&&AccChk!=AccChkVId5&&AccChk!=AccChkVId6&&AccChk!=AccChkVId7&&AccChk!=AccChkVId8&&AccChk!=AccChkVId9&&AccChk!=AccChkVId10) || stm.mon>AccountCheckValidMonth)
   //if(stm.year>AccountCheckValidYear || license_status==false)
   if(stm.year>AccountCheckValidYear)
   {
   Comment("Expire : " + license_status_comment);
   //return(0);
   }
   else
   {
   Comment(AccChk);
   
   
   
   
   
  //---

   AllPairs[0]="EURUSD"+MyTradeSuffix;
   AllPairs[1]="GBPUSD"+MyTradeSuffix;
   AllPairs[2]="AUDUSD"+MyTradeSuffix;
   AllPairs[3]="USDJPY"+MyTradeSuffix;
   AllPairs[4]="USDCHF"+MyTradeSuffix;
   AllPairs[5]="USDCAD"+MyTradeSuffix;
   AllPairs[6]="EURAUD"+MyTradeSuffix;
   AllPairs[7]="EURCAD"+MyTradeSuffix;
   AllPairs[8]="EURCHF"+MyTradeSuffix;
   AllPairs[9]="EURGBP"+MyTradeSuffix;
   AllPairs[10]="EURJPY"+MyTradeSuffix;
   AllPairs[11]="GBPJPY"+MyTradeSuffix;
   AllPairs[12]="GBPCHF"+MyTradeSuffix;
   AllPairs[13]="NZDUSD"+MyTradeSuffix;
   AllPairs[14]="AUDCAD"+MyTradeSuffix;
   AllPairs[15]="AUDJPY"+MyTradeSuffix;
   AllPairs[16]="CHFJPY"+MyTradeSuffix;
   AllPairs[17]="AUDNZD"+MyTradeSuffix;
   AllPairs[18]="NZDJPY"+MyTradeSuffix;
   AllPairs[19]="NZDCAD"+MyTradeSuffix;
   AllPairs[20]="NZDCHF"+MyTradeSuffix;
   AllPairs[21]="GBPNZD"+MyTradeSuffix;
   AllPairs[22]="EURNZD"+MyTradeSuffix;
   AllPairs[23]="GBPCAD"+MyTradeSuffix;
   AllPairs[24]="GBPAUD"+MyTradeSuffix;
   AllPairs[25]="AUDCHF"+MyTradeSuffix;
   AllPairs[26]="CADCHF"+MyTradeSuffix;
   AllPairs[27]="CADJPY"+MyTradeSuffix;
   AllPairs[28]="XAUUSD"+MyTradeSuffix;
   AllPairs[29]="XAUAUD"+MyTradeSuffix;
   AllPairs[30]="";
   AllPairs[31]="";
   AllPairs[32]="";

/*öncelikle geçerli çift ask ve bid fiyatları okunacak*/
/*bid fiyat okuması geçerli fiyat ile yapılacak şekilde kodu yazıyoruz.*/

     for(int i=0;i<HowManyPairsWorking;i++)
     {
      Price[i]=SymbolInfoDouble(AllPairs[i],SYMBOL_BID);
     }

 
///gloooooooooo
      SingolaValuta[0]="USD"; 
      SingolaValuta[1]="EUR"; 
      SingolaValuta[2]="GBP"; 
      SingolaValuta[3]="JPY"; 
      SingolaValuta[4]="CHF"; 
      SingolaValuta[5]="CAD"; 
      SingolaValuta[6]="NZD"; 
      SingolaValuta[7]="AUD";


   CoppiaValuta[0]="EURUSD"+MyTradeSuffix;
   CoppiaValuta[1]="GBPUSD"+MyTradeSuffix;
   CoppiaValuta[2]="AUDUSD"+MyTradeSuffix;
   CoppiaValuta[3]="USDJPY"+MyTradeSuffix;
   CoppiaValuta[4]="USDCHF"+MyTradeSuffix;
   CoppiaValuta[5]="USDCAD"+MyTradeSuffix;
   CoppiaValuta[6]="EURAUD"+MyTradeSuffix;
   CoppiaValuta[7]="EURCAD"+MyTradeSuffix;
   CoppiaValuta[8]="EURCHF"+MyTradeSuffix;
   CoppiaValuta[9]="EURGBP"+MyTradeSuffix;
   CoppiaValuta[10]="EURJPY"+MyTradeSuffix;
   CoppiaValuta[11]="GBPJPY"+MyTradeSuffix;
   CoppiaValuta[12]="GBPCHF"+MyTradeSuffix;
   CoppiaValuta[13]="NZDUSD"+MyTradeSuffix;
   CoppiaValuta[14]="AUDCAD"+MyTradeSuffix;
   CoppiaValuta[15]="AUDJPY"+MyTradeSuffix;
   CoppiaValuta[16]="CHFJPY"+MyTradeSuffix;
   CoppiaValuta[17]="AUDNZD"+MyTradeSuffix;
   CoppiaValuta[18]="NZDJPY"+MyTradeSuffix;
   CoppiaValuta[19]="NZDCAD"+MyTradeSuffix;
   CoppiaValuta[20]="NZDCHF"+MyTradeSuffix;
   CoppiaValuta[21]="GBPNZD"+MyTradeSuffix;
   CoppiaValuta[22]="EURNZD"+MyTradeSuffix;
   CoppiaValuta[23]="GBPCAD"+MyTradeSuffix;
   CoppiaValuta[24]="GBPAUD"+MyTradeSuffix;
   CoppiaValuta[25]="AUDCHF"+MyTradeSuffix;
   CoppiaValuta[26]="CADCHF"+MyTradeSuffix;
   CoppiaValuta[27]="CADJPY"+MyTradeSuffix;
   
   
   
   
   double ValoreZero[N_CROSS,2];
   color  ColoreZero[N_CROSS,2];
   
   ValoreZero[ID_USD,0] = currency_strength(SingolaValuta[ID_USD]);
   ValoreZero[ID_EUR,0] = currency_strength(SingolaValuta[ID_EUR]);
   ValoreZero[ID_GBP,0] = currency_strength(SingolaValuta[ID_GBP]);
   ValoreZero[ID_JPY,0] = currency_strength(SingolaValuta[ID_JPY]);
   ValoreZero[ID_CHF,0] = currency_strength(SingolaValuta[ID_CHF]);
   ValoreZero[ID_CAD,0] = currency_strength(SingolaValuta[ID_CAD]);
   ValoreZero[ID_NZD,0] = currency_strength(SingolaValuta[ID_NZD]);
   ValoreZero[ID_AUD,0] = currency_strength(SingolaValuta[ID_AUD]);
   
   ValoreZero[ID_USD,1] = ID_USD;  //1
   ValoreZero[ID_EUR,1] = ID_EUR;  //2
   ValoreZero[ID_GBP,1] = ID_GBP;  //3
   ValoreZero[ID_JPY,1] = ID_JPY;  //4
   ValoreZero[ID_CHF,1] = ID_CHF;  //5
   ValoreZero[ID_CAD,1] = ID_CAD;  //6
   ValoreZero[ID_NZD,1] = ID_NZD;  //7
   ValoreZero[ID_AUD,1] = ID_AUD;  //8
   
   double WWWW = (ValoreZero[ID_USD,0]+ValoreZero[ID_EUR,0]+ValoreZero[ID_GBP,0]+ValoreZero[ID_JPY,0]+ValoreZero[ID_CHF,0]+ValoreZero[ID_CAD,0]+ValoreZero[ID_NZD,0]+ValoreZero[ID_AUD,0])/8.00;
   
   for (int ii=0;ii<28;ii++)
   {
      string XPair=NULL;
      string CurrencyLeft=NULL;
      string CurrencyRight=NULL;
      int XCurrencyLeft=NULL;
      int XCurrencyRight=NULL;

      XPair = CoppiaValuta[ii];
      CurrencyLeft = StringSubstr(XPair, 0, 3);
      CurrencyRight = StringSubstr(XPair, 3, 3);

      if(CurrencyLeft == "USD")XCurrencyLeft=0;
      if(CurrencyLeft == "EUR")XCurrencyLeft=1;
      if(CurrencyLeft == "GBP")XCurrencyLeft=2;
      if(CurrencyLeft == "JPY")XCurrencyLeft=3;
      if(CurrencyLeft == "CHF")XCurrencyLeft=4;
      if(CurrencyLeft == "CAD")XCurrencyLeft=5;
      if(CurrencyLeft == "NZD")XCurrencyLeft=6;
      if(CurrencyLeft == "AUD")XCurrencyLeft=7;
      if(CurrencyRight == "USD")XCurrencyRight=0;
      if(CurrencyRight == "EUR")XCurrencyRight=1;
      if(CurrencyRight == "GBP")XCurrencyRight=2;
      if(CurrencyRight == "JPY")XCurrencyRight=3;
      if(CurrencyRight == "CHF")XCurrencyRight=4;
      if(CurrencyRight == "CAD")XCurrencyRight=5;
      if(CurrencyRight == "NZD")XCurrencyRight=6;
      if(CurrencyRight == "AUD")XCurrencyRight=7;

      if(ValoreZero[XCurrencyRight,0]!=0)GlobalRates [ii,0] = ValoreZero[XCurrencyLeft,0]/ValoreZero[XCurrencyRight,0];
      if(ValoreZero[XCurrencyLeft,0]!=0)GlobalRates [ii,1] = ValoreZero[XCurrencyRight,0]/ValoreZero[XCurrencyLeft,0];
      if(WWWW!=0)GlobalRates [ii,2] = ValoreZero[XCurrencyLeft,0]/WWWW;
      if(WWWW!=0)GlobalRates [ii,3] = ValoreZero[XCurrencyRight,0]/WWWW;
      
      Kopkop[ii,0]=GlobalRates [ii,0];
      Kopkop[ii,1]=ii;
      
      //GlobalCommentText = GlobalCommentText +"\n" + XPair +":"+ DoubleToString(GlobalRates [ii,0],2)+":"+ DoubleToString(GlobalRates [ii,1],2)+"\n" + XPair +":"+ DoubleToString(GlobalRates [ii,2],2)+":"+ DoubleToString(GlobalRates [ii,3],2);
     
      CopiaPrice[ii]=SymbolInfoDouble(CoppiaValuta[ii],SYMBOL_BID);
      CopiaD1Price[ii]=iOpen(CoppiaValuta[ii],PERIOD_D1,0);
      CopiaH1Price[ii]=iOpen(CoppiaValuta[ii],PERIOD_H1,0);
      
     // XCopiaD1Price[ii,0]=(CopiaD1Price[ii]-CopiaPrice[ii])*-1.00/(SymbolInfoDouble(CoppiaValuta[ii],SYMBOL_POINT));
      if((SymbolInfoDouble(CoppiaValuta[ii],SYMBOL_POINT)>0.00))XCopiaD1Price[ii,0]=(CopiaD1Price[ii]-CopiaPrice[ii])*-1.00/(SymbolInfoDouble(CoppiaValuta[ii],SYMBOL_POINT));
      XCopiaD1Price[ii,1]=ii;
      //DoubleToString((CopiaD1Price[kopkopvalue]-CopiaPrice[kopkopvalue])*-1.00/(SymbolInfoDouble(CoppiaValuta[kopkopvalue],SYMBOL_POINT)),1)
      //(CopiaD1Price[kopkopvalue]-CopiaPrice[kopkopvalue])*-1.00/(SymbolInfoDouble(CoppiaValuta[kopkopvalue],SYMBOL_POINT))
   }
   
   
   
   
   
 
   double XXXX;
   double YYYY;
   double ZZZZUSD;
   double ZZZZEUR;
   
   if(ValoreZero[ID_EUR,0]>0)XXXX=(ValoreZero[ID_USD,0]/ValoreZero[ID_EUR,0]);
   if(ValoreZero[ID_USD,0]>0)YYYY=(ValoreZero[ID_EUR,0]/ValoreZero[ID_USD,0]);
   if(WWWW>0)ZZZZUSD=(ValoreZero[ID_USD,0]/WWWW);
   if(WWWW>0)ZZZZEUR=(ValoreZero[ID_EUR,0]/WWWW);
   
 

   ArraySort(ValoreZero);
   ArrayReverse(ValoreZero,0,WHOLE_ARRAY);

   ArraySort(Kopkop);
   ArrayReverse(Kopkop,0,WHOLE_ARRAY);
   
   ArraySort(XCopiaD1Price);
   ArrayReverse(XCopiaD1Price,0,WHOLE_ARRAY);
   
   int jxx,Y2=Y;
   
   for(int i=0; i<N_CROSS; i++)
   {
      jxx = ValoreZero[i,1];
      if(XPushGraphicCurrencyStrenght==true)objectCreate(SingolaValuta[jxx]+"_pos", Corner, X+70, Y2, 0,( i+1)+". ", fontsize, font, Gray);
      if(XPushGraphicCurrencyStrenght==true)objectCreate(SingolaValuta[jxx]+"_nom", Corner, X+40, Y2, 0, SingolaValuta[jxx], fontsize, font, ColoreValuta[jxx]);
      if(XPushGraphicCurrencyStrenght==true)objectCreate(SingolaValuta[jxx]+"_val", Corner, X, Y2, 0, DoubleToString(ValoreZero[i,0],2), fontsize+20, font, symcolor(ValoreZero[i,0]));
      Y2 += 24;
      
      CurrencyStrengtPushTableName[i]=SingolaValuta[jxx];
      CurrencyStrengtPushTableValue[i]=DoubleToString(ValoreZero[i,0],2);
      
      
   }
   //--------------------------------//
   /*
         for(int i=0; i<33; i++)
         {
           if(FSU_A_55(0,i,1,INxshift55)==0 && FSU_A_34(1,i,1,INxshift34)==0 && FSU_A_26(2,i,1,INxshift26)==0 )xx3[i]="UP";
           else if(FSU_A_55(0,i,1,INxshift55)==1 && FSU_A_34(1,i,1,INxshift34)==1 && FSU_A_26(2,i,1,INxshift26)==1 )xx3[i]="DOWN";
           else xx3[i]="NOTR"; 
           
           if(FSU_A_55(0,i,1,INxshift55)==0 && FSU_A_34(1,i,1,INxshift34)==0 && FSU_A_26(2,i,1,INxshift26)==0 && FSU_A_18(3,i,1,INxshift18)==0)xx4[i]="UP";
           else if(FSU_A_55(0,i,1,INxshift55)==1 && FSU_A_34(1,i,1,INxshift34)==1 && FSU_A_26(2,i,1,INxshift26)==1 && FSU_A_18(3,i,1,INxshift18)==1)xx4[i]="DOWN";
           else xx4[i]="NOTR"; 
           
           
           if(FSU_A_55(0,i,1,INxshift55)==0 && FSU_A_34(1,i,1,INxshift34)==0 && FSU_A_26(2,i,1,INxshift26)==0 && FSU_A_18(3,i,1,INxshift18)==0 && FSU_A_8(4,i,1,INxshift8)==0)xx5[i]="UP";
           else if(FSU_A_55(0,i,1,INxshift55)==1 && FSU_A_34(1,i,1,INxshift34)==1 && FSU_A_26(2,i,1,INxshift26)==1 && FSU_A_18(3,i,1,INxshift18)==1 && FSU_A_8(4,i,1,INxshift8)==1)xx5[i]="DOWN";
           else xx5[i]="NOTR"; 
         }
         
         for(int i=0; i<33; i++)
         {
            if(prevxx3[i]!=xx3[i] && xx3[i]=="UP" && XPushAlert==true)
            {
            Alert("X3 "+AllPairs[i]+" = UP | DATE : "+TimeCurrent());
            PlaySound("alert.wav");
            prevxx3[i]=xx3[i];
            }
            if(prevxx3[i]!=xx3[i] && xx3[i]=="DOWN"&& XPushAlert==true)
            {
            Alert("X3 "+AllPairs[i]+" = DOWN | DATE : "+TimeCurrent());
            PlaySound("alert.wav");
            prevxx3[i]=xx3[i];
            }
            if(prevxx3[i]!=xx3[i] && xx3[i]=="NOTR"&& XPushAlert==true)
            {
            Alert("X3 "+AllPairs[i]+" = NOTR | DATE : "+TimeCurrent());
            PlaySound("alert.wav");
            prevxx3[i]=xx3[i];
            }
            
            
            if(prevxx4[i]!=xx4[i] && xx4[i]=="UP"&& XPushAlert==true)
            {
            Alert("X4 "+AllPairs[i]+" = UP | DATE : "+TimeCurrent());
            PlaySound("alert.wav");
            prevxx4[i]=xx4[i];
            }
            if(prevxx4[i]!=xx4[i] && xx4[i]=="DOWN"&& XPushAlert==true)
            {
            Alert("X4 "+AllPairs[i]+" = DOWN | DATE : "+TimeCurrent());
            PlaySound("alert.wav");
            prevxx4[i]=xx4[i];
            }
            if(prevxx4[i]!=xx4[i] && xx4[i]=="NOTR"&& XPushAlert==true)
            {
            Alert("X4 "+AllPairs[i]+" = NOTR | DATE : "+TimeCurrent());
            PlaySound("alert.wav");
            prevxx4[i]=xx4[i];
            }
            
            
            
            if(prevxx5[i]!=xx5[i] && xx5[i]=="UP"&& XPushAlert==true)
            {
            Alert("X5 "+AllPairs[i]+" = UP | DATE : "+TimeCurrent());
            PlaySound("alert.wav");
            prevxx5[i]=xx5[i];
            }
            if(prevxx5[i]!=xx5[i] && xx5[i]=="DOWN"&& XPushAlert==true)
            {
            Alert("X5 "+AllPairs[i]+" = DOWN | DATE : "+TimeCurrent());
            PlaySound("alert.wav");
            prevxx5[i]=xx5[i];
            }
            if(prevxx5[i]!=xx5[i] && xx5[i]=="NOTR"&& XPushAlert==true)
            {
            Alert("X5 "+AllPairs[i]+" = NOTR | DATE : "+TimeCurrent());
            PlaySound("alert.wav");
            prevxx5[i]=xx5[i];
            }
         }
         */
//--------------CRONOS-------------------//

 

//karlilik kontrolleri

   double CheckValueAccountBalance=AccountInfoDouble(ACCOUNT_BALANCE)+AccountInfoDouble(ACCOUNT_CREDIT);
   double CheckValueAccounEquity=AccountInfoDouble(ACCOUNT_EQUITY);
   double CheckNetProfit=CheckValueAccounEquity-CheckValueAccountBalance;
   
   if(CheckNetProfit>100.00)
      {
      for(int i=1;i<200;i++)
         {
         CloseAllPositions();
         }
      //burada tüm pozisyonların kapanmaması hatası oluşuyor. Buna yonelik bir çözüm gerekli. 
      }  
   
   
  
//Proje hakkında açıklama
//Bu proje de piyasa da oluşan manuplasyon noktaları Cronos Base ve Yeni Planlanan Cronos ile işlenecek.
//Geriye dönük dakika analizi aşamasında 10.000 dakikalık veri kullanacağız.
//Veri Set Acıklamaları
//MarketPrice[1000];Geriye dönük 10.000 dakikalık ortalama market fiyatı Enyüksek, Endüşük, Açılış ve Kapanış Verileri ortalaması kullanılacak.

//CronosHesaplama işlemleri yapılacak bunun için CronosCalculation çalışması lazım her bir dakikada
//Onceki dakika değerini PreviousMin, PreviousM5, PreviousM15 değişkenler ile tutuyoruz. 
   
   if(CronosCalculationMin!=stm.min)
      {
      //.cronos calculation işlemleri yapılacak. 
      //.bu işlem geri donuk olarak tüm siparişlerin mevcut fiyat ile karşılaştırılmasına dayanır. 
      //.cronos ilk yükleme anında tüm cronos siparişlerini geriye dönük olarak Cronos Inıt kısmında işlediği için
      //.bu aşamadan sonra tüm siparişler sadece market fiyatı ile 1 dakika da bir karşılaştırılacaktır. 
      

   //GlobalCommentText = "Read Pairs ..";
   for(int i=0; i<HowManyPairsWorking; i++) //Pairs loop
     {
      //çiftlere ait i değerleri okunuyor.
      string WorkingPair = AllPairs[i]; //Calışılacak çiftin etiket değeri alınıyor.
      //GlobalCommentText = GlobalCommentText + "/" + WorkingPair;
      //10.000' i shift 20.000 ne yazılacak.'
      for(int j=10000; j>1; j--)
         {
         //fiyat kaymaları yapılacak bu aralıkta. 
         MarketPrices[i,j] = MarketPrices[i,j-1]; //10.000 ci sıradaki fiyat > 9999 nu sıradaki ile yer değiştirdi.
         //1 sıraya ise aşağıda ki işlem ile fiyat atanacak. 
         CronosLongStatus[i,j]=1; //Cronos işlemleri açılmış oldu.
         CronosShortStatus[i,j]=1; //Cronos short işlemleri açılmış oldu.
         //yukarıdaki iki satırda sipariş durumları sıfırlanıyor. 
         }
      

         //fiyat okumaları yapılıyor. 
         //1 numaralı alana ise yazım yapılıyor. 
         int PushPriceValue = 1;
         double HighPrice = iHigh(WorkingPair,PERIOD_M1,1);
         double LowPrice = iLow(WorkingPair,PERIOD_M1,1);
         double OpenPrice = iOpen(WorkingPair,PERIOD_M1,1);
         double ClosePrice = iClose(WorkingPair,PERIOD_M1,1);
         double AveragePrice = (HighPrice+LowPrice+OpenPrice+ClosePrice)/4;
         MarketPrices[i,PushPriceValue] = AveragePrice;
         CronosLongStatus[i,PushPriceValue]=1; //Cronos işlemleri açılmış oldu.
         CronosShortStatus[i,PushPriceValue]=1; //Cronos short işlemleri açılmış oldu.
        // test 
      //GlobalCommentText = GlobalCommentText + "..";  
      CronosCalculationMin=stm.min;
     } // End of pairs loop

//Cronos init
   
   for(int i=0;i<HowManyPairsWorking;i++)
      { //çiftler gelecek.
         string CronosPair = AllPairs[i];
         double CronosPoint = SymbolInfoDouble(AllPairs[i],SYMBOL_POINT);
         
            for(int iCalculator=1;iCalculator<10000;iCalculator++)
              {
               //fiyat okumaları yapılıyor. ve PushPriceValue shift değeri ile ortalama fiyat MarketFiyatı olarak yazılıyor.
               double CronosCalculationPrice = MarketPrices[i,10000-iCalculator];
               
               for(int j=10000; j>10000-iCalculator;j--)
                  {
                  //iCalculator kontrol başlangıcının hesabıdır. sipariş tarama aşaması hangi noktadan başlayacak
                  //-1 kullanmamızın sebebi bir sonraki dakikaya göre işlem yapıp siparişleri taramak. 
                  if(CronosPoint!=0.0){if(CronosLongStatus[i,j]==1){CronosLongProfit[i,j]=(-MarketPrices[i,j]+CronosCalculationPrice)*(1.00/CronosPoint)*0.01;}}
                  if(CronosPoint!=0.0){if(CronosShortStatus[i,j]==1){CronosShortProfit[i,j]=(MarketPrices[i,j]-CronosCalculationPrice)*(1.00/CronosPoint)*0.01;}}
                  if(CronosLongProfit[i,j]>2.00||CronosLongProfit[i,j]<-10.00){CronosLongStatus[i,j]=0;CronosLongProfit[i,j]=0.00;}
                  if(CronosShortProfit[i,j]>2.00||CronosShortProfit[i,j]<-10.00){CronosShortStatus[i,j]=0;CronosShortProfit[i,j]=0.00;}
                  
                  }
              }
      }

//Cronos Inıt Done;
//Cronos Calculation Inıt;
      //Bu alanda cronos'a ait Status Değerleri taranacak ve bu değerlerin 1 olanları toplanıp Buy/Sell order rate elde edilecek.'
      //Bu alanda cronos'a ait Profit değerleri taranacak ve bu değerlerin toplamları ile buy sell order profit rate elde edilecek.'
      for(int i=0;i<HowManyPairsWorking;i++)
         {
            //dikkat bu alandaki sıfırlama hesapların yeniden yapılabilmesi için gerekli.
            CronosLongCount[i] = 0;
            CronosShortCount[i] = 0;
            CronosLongTotal[i] = 0;
            CronosShortTotal[i] = 0;
            for(int j=1;j<11000;j++)
               {
                  if(CronosLongStatus[i,j]!=0){CronosLongCount[i]=CronosLongCount[i]+1;}
                  if(CronosShortStatus[i,j]!=0){CronosShortCount[i]=CronosShortCount[i]+1;}
                  if(CronosLongProfit[i,j]!=0.00){CronosLongTotal[i]=CronosLongTotal[i]+CronosLongProfit[i,j];}
                  if(CronosShortProfit[i,j]!=0.00){CronosShortTotal[i]=CronosShortTotal[i]+CronosShortProfit[i,j];}
               }
         }  

      
      
      
      
      }
      
         for(int i=0;i<HowManyPairsWorking;i++)
         {
         double UpProfit = -CronosLongTotal[i]-CronosShortCount[i]*10.00+CronosLongCount[i]*2.00;
         double DownProfit = -CronosShortTotal[i]-CronosLongCount[i]*10.00+CronosShortCount[i]*2.00;
         string DirectionCronos;
         if(UpProfit<DownProfit)DirectionCronos = "UP";
         if(UpProfit>DownProfit)DirectionCronos = "DOWN";
         CronosSignals[i]=DirectionCronos;
         if(MathAbs(DownProfit)!=0){CronosRates[i]= 1/(MathAbs(UpProfit)/MathAbs(DownProfit));}
         if(MathAbs(CronosShortTotal[i])!=0){CronosMomentums[i]= MathAbs(CronosLongTotal[i])/MathAbs(CronosShortTotal[i]);}
         CronosSuperMomentums[i]=MathAbs(CronosShortTotal[i])-MathAbs(CronosLongTotal[i]);
         GlobalCommentText = GlobalCommentText+DoubleToString(CronosSuperMomentums[i],0)+":"+DoubleToString(CronosMomentums[i],4)+":"+DoubleToString(CronosRates[i],4)+":"+DirectionCronos+":"+AllPairs[i]+": long:"+DoubleToString(CronosLongTotal[i],2)+" short"+DoubleToString(CronosShortTotal[i],2)+" long count:"+IntegerToString(CronosLongCount[i],9,' ')+ " short count:"+IntegerToString(CronosShortCount[i],9,' ');
         GlobalCommentText = GlobalCommentText+" UpSide:"+DoubleToString(UpProfit,2)+" DownSide:"+DoubleToString(DownProfit,2)+"\n";
         
         CronosSignals[i]="NOTR";
         if(CronosSuperMomentums[i]>100&&CronosMomentums[i]<0.99&&CronosRates[i]<0.99)CronosSignals[i]="UP";
         if(CronosSuperMomentums[i]<-100&&CronosMomentums[i]>1.01&&CronosRates[i]>1.01)CronosSignals[i]="DOWN";
         
         }
   

 
      TradeInfo();
      
         for(int i=0; i<HowManyPairsWorkingx2; i++)
         {
           if(GlobalRates[i,0]>1 && FSU_A_89(0,i,1,INxshift89)==0){XRULES[i,1]="UP";}
           else if(GlobalRates[i,0]<1 && FSU_A_89(0,i,1,INxshift89)==1){XRULES[i,1]="DOWN";}
           else XRULES[i,1]="NOTR";
           
           if(GlobalRates[i,0]>1 && FSU_A_55(0,i,1,INxshift55)==0){XRULES[i,2]="UP";}
           else if(GlobalRates[i,0]<1 &&  FSU_A_55(0,i,1,INxshift55)==1){XRULES[i,2]="DOWN";}
           else XRULES[i,2]="NOTR";
         }  
         for(int i=0; i<HowManyPairsWorking; i++)
         {
         
           if(FSU_A_89(0,i,1,INxshift89)==0){XRULES[i,0]="UP";}
           else if(FSU_A_89(0,i,1,INxshift89)==1){XRULES[i,0]="DOWN";}
           else XRULES[i,0]="NOTR";
           /*
           X0 89  OK
           X1 XY İLE M1 İLE   OK
           X2 XY İLE M5   
           
           Y1  OK
           
           X3 M5 VE M15 OK
           X4 M15 VE MS OK
           
           Y2 OK
           
           X5 MS VE H1 OK
           X6 H4 D1 OK
           
           Y3 OK
           
           
           
           OLDS
           if(FSU_A_34(1,i,1,INxshift34)==0 && FSU_A_55(0,i,1,INxshift55)==0){XRULES[i,2]="UP";}
           else if(FSU_A_34(1,i,1,INxshift34)==1 && FSU_A_55(0,i,1,INxshift55)==1){XRULES[i,2]="DOWN";}
           else XRULES[i,2]="NOTR";
           
                      if(FSU_A_34(1,i,1,INxshift34)==0 && CronosSignals[i]=="UP"){XRULES[i,3]="UP";}
           else if(FSU_A_34(1,i,1,INxshift34)==1 && CronosSignals[i]=="DOWN"){XRULES[i,3]="DOWN";}
           else XRULES[i,3]="NOTR";
           
                      if(FSU_A_26(2,i,1,INxshift26)==0 && CronosSignals[i]=="UP"){XRULES[i,4]="UP";}
           else if(FSU_A_26(2,i,1,INxshift26)==1 && CronosSignals[i]=="DOWN"){XRULES[i,4]="DOWN";}
           else XRULES[i,4]="NOTR";
           
                      if(FSU_A_26(2,i,1,INxshift26)==0 && FSU_A_18(3,i,1,INxshift18)==0){XRULES[i,5]="UP";}
           else if(FSU_A_26(2,i,1,INxshift26)==1 && FSU_A_18(3,i,1,INxshift18)==1){XRULES[i,5]="DOWN";}
           else XRULES[i,5]="NOTR";
           */

           
                 
           if(FSU_A_34(1,i,1,INxshift34)==0 && FSU_A_55(0,i,1,INxshift55)==0){XRULES[i,3]="UP";}
           else if(FSU_A_34(1,i,1,INxshift34)==1 &&  FSU_A_55(0,i,1,INxshift55)==1){XRULES[i,3]="DOWN";}
           else XRULES[i,3]="NOTR";
           
           
           if(FSU_A_34(1,i,1,INxshift34)==0 && CronosSignals[i]=="UP"){XRULES[i,4]="UP";}
           else if(FSU_A_34(1,i,1,INxshift34)==1 && CronosSignals[i]=="DOWN"){XRULES[i,4]="DOWN";}
           else XRULES[i,4]="NOTR";
           
           
           if(FSU_A_26(2,i,1,INxshift26)==0 && CronosSignals[i]=="UP"){XRULES[i,5]="UP";}
           else if(FSU_A_26(2,i,1,INxshift26)==1 && CronosSignals[i]=="DOWN"){XRULES[i,5]="DOWN";}
           else XRULES[i,5]="NOTR";
           
           
           if(FSU_A_18(3,i,1,INxshift18)==0 && FSU_A_8(4,i,1,INxshift8)==0){XRULES[i,6]="UP";}
           else if(FSU_A_18(3,i,1,INxshift18)==1 && FSU_A_8(4,i,1,INxshift8)==1){XRULES[i,6]="DOWN";}
           else XRULES[i,6]="NOTR";
        
         }
         for(int i=0; i<HowManyPairsWorking; i++)
         {
         

           
           
           if(XRULES[i,1]=="UP" && XRULES[i,2]=="UP"){YRULES[i,1]="UP";}
           else if(XRULES[i,1]=="DOWN" && XRULES[i,2]=="DOWN"){YRULES[i,1]="DOWN";}
           else YRULES[i,1]="NOTR";
           
           if(XRULES[i,3]=="UP" && XRULES[i,4]=="UP"){YRULES[i,2]="UP";}
           else if(XRULES[i,3]=="DOWN" && XRULES[i,4]=="DOWN"){YRULES[i,2]="DOWN";}
           else YRULES[i,2]="NOTR";         

           if(XRULES[i,5]=="UP" && XRULES[i,6]=="UP"){YRULES[i,3]="UP";}
           else if(XRULES[i,5]=="DOWN" && XRULES[i,6]=="DOWN"){YRULES[i,3]="DOWN";}
           else YRULES[i,3]="NOTR";
         }       
         
         if(checkMin!=stm.min)
         {
           XAlertCounter=XAlertCounter+1;
           if(XAlertCounter<=3)
           {
               for(int i=0; i<HowManyPairsWorking; i++)
               {
               PREXRULES[i,1]=XRULES[i,1];
               PREXRULES[i,2]=XRULES[i,2];
               PREXRULES[i,3]=XRULES[i,3];
               PREXRULES[i,4]=XRULES[i,4];
               PREXRULES[i,5]=XRULES[i,5];
               PREXRULES[i,6]=XRULES[i,6];
               
               PREYRULES[i,1]=YRULES[i,1];
               PREYRULES[i,2]=YRULES[i,2];
               PREYRULES[i,3]=YRULES[i,3];
               
               }
           }  
           checkMin = stm.min; 
         }
         for(int i=0; i<HowManyPairsWorking; i++)
         {
            



            if(PREYRULES[i,1]!=YRULES[i,1] && YRULES[i,1]=="UP" && XPushAlert==true && XAlertCounter>4)
            {
            Alert("Y1 "+AllPairs[i]+" = UP | DATE : "+TimeCurrent());
            PlaySound("alert.wav");
            PREYRULES[i,1]=YRULES[i,1];
            }
            if(PREYRULES[i,1]!=YRULES[i,1] && YRULES[i,1]=="DOWN"&& XPushAlert==true && XAlertCounter>4)
            {
            Alert("Y1 "+AllPairs[i]+" = DOWN | DATE : "+TimeCurrent());
            PlaySound("alert.wav");
            PREYRULES[i,1]=YRULES[i,1];
            }

            if(PREYRULES[i,2]!=YRULES[i,2] && YRULES[i,2]=="UP" && XPushAlert==true && XAlertCounter>4)
            {
            Alert("Y2 "+AllPairs[i]+" = UP | DATE : "+TimeCurrent());
            PlaySound("alert.wav");
            PREYRULES[i,2]=YRULES[i,2];
            }
            if(PREYRULES[i,2]!=YRULES[i,2] && YRULES[i,2]=="DOWN"&& XPushAlert==true && XAlertCounter>4)
            {
            Alert("Y2 "+AllPairs[i]+" = DOWN | DATE : "+TimeCurrent());
            PlaySound("alert.wav");
            PREYRULES[i,2]=YRULES[i,2];
            }

            if(PREYRULES[i,3]!=YRULES[i,3] && YRULES[i,3]=="UP" && XPushAlert==true && XAlertCounter>4)
            {
            Alert("Y3 "+AllPairs[i]+" = UP | DATE : "+TimeCurrent());
            PlaySound("alert.wav");
            PREYRULES[i,3]=YRULES[i,3];
            }
            if(PREYRULES[i,3]!=YRULES[i,3] && YRULES[i,3]=="DOWN"&& XPushAlert==true && XAlertCounter>4)
            {
            Alert("Y3 "+AllPairs[i]+" = DOWN | DATE : "+TimeCurrent());
            PlaySound("alert.wav");
            PREYRULES[i,3]=YRULES[i,3];
            }
         }



///





   program.OnTickEvent();
   
   }

  }
//+------------------------------------------------------------------+
//| Timer function                                                   |
//+------------------------------------------------------------------+
void OnTimer(void)
  {
   program.OnTimerEvent();
  }
//+------------------------------------------------------------------+
//| Trade function                                                   |
//+------------------------------------------------------------------+
void OnTrade(void)
  {
   program.OnTradeEvent();
  }
//+------------------------------------------------------------------+
//| ChartEvent function                                              |
//+------------------------------------------------------------------+
void OnChartEvent(const int id,const long &lparam,const double &dparam,const string &sparam)
  {
   program.ChartEvent(id,lparam,dparam,sparam);
  }
//+------------------------------------------------------------------+
//| Tester function                                                  |
//+------------------------------------------------------------------+
double OnTester(void)
  {
   return(program.OnTesterEvent());
  }
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
double FSU_A_89(int xperiod,int xpair,int xpossiblebuffernumber, int xshift)//possible buffers 0 to 4
  {
   double fsu_a_values_89[];
   ArraySetAsSeries(fsu_a_values_89,true);
   if(CopyBuffer((FSU_A_Handle_89[xperiod,xpair]),xpossiblebuffernumber,xshift,3,fsu_a_values_89)<0)
     {
      //print("FSU_Median error =",GetLastError());
     }
   return fsu_a_values_89[0];
  }
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
double FSU_A_55(int xperiod,int xpair,int xpossiblebuffernumber, int xshift)//possible buffers 0 to 4
  {
   double fsu_a_values_55[];
   ArraySetAsSeries(fsu_a_values_55,true);
   if(CopyBuffer((FSU_A_Handle_55[xperiod,xpair]),xpossiblebuffernumber,xshift,3,fsu_a_values_55)<0)
     {
      //print("FSU_Median error =",GetLastError());
     }
   return fsu_a_values_55[0];
  }
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
double FSU_A_34(int xperiod,int xpair,int xpossiblebuffernumber, int xshift)//possible buffers 0 to 4
  {
   double fsu_a_values_34[];
   ArraySetAsSeries(fsu_a_values_34,true);
   if(CopyBuffer((FSU_A_Handle_34[xperiod,xpair]),xpossiblebuffernumber,xshift,3,fsu_a_values_34)<0)
     {
      //print("FSU_Median error =",GetLastError());
     }
   return fsu_a_values_34[0];
  }
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
double FSU_A_26(int xperiod,int xpair,int xpossiblebuffernumber, int xshift)//possible buffers 0 to 4
  {
   double fsu_a_values_26[];
   ArraySetAsSeries(fsu_a_values_26,true);
   if(CopyBuffer((FSU_A_Handle_26[xperiod,xpair]),xpossiblebuffernumber,xshift,3,fsu_a_values_26)<0)
     {
      //print("FSU_Median error =",GetLastError());
     }
   return fsu_a_values_26[0];
  }
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
double FSU_A_18(int xperiod,int xpair,int xpossiblebuffernumber, int xshift)//possible buffers 0 to 4
  {
   double fsu_a_values_18[];
   ArraySetAsSeries(fsu_a_values_18,true);
   if(CopyBuffer((FSU_A_Handle_18[xperiod,xpair]),xpossiblebuffernumber,xshift,3,fsu_a_values_18)<0)
     {
      //print("FSU_Median error =",GetLastError());
     }
   return fsu_a_values_18[0];
  }
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
double FSU_A_8(int xperiod,int xpair,int xpossiblebuffernumber, int xshift)//possible buffers 0 to 4
  {
   double fsu_a_values_8[];
   ArraySetAsSeries(fsu_a_values_8,true);
   if(CopyBuffer((FSU_A_Handle_8[xperiod,xpair]),xpossiblebuffernumber,xshift,3,fsu_a_values_8)<0)
     {
      //print("FSU_Median error =",GetLastError());
     }
   return fsu_a_values_8[0];
  }
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//| symcolor function                                                |
//+------------------------------------------------------------------+
int symcolor(double ad_0) {
   int li_ret_8;
   if (ad_0 <= 2.0) li_ret_8 = Red;
   if (ad_0 > 2.0) li_ret_8 = Silver;
   if (ad_0 >= 7.0) li_ret_8 = Green;
   return (li_ret_8);
}


//+------------------------------------------------------------------+
//| currency_strength function                                       |
//+------------------------------------------------------------------+
double currency_strength(string couple) {
   int index;
   string Pair;
   double HiLo;
   double ld_28;
   double ld_ret_36 = 0;
   int cnt = 0;
   for (int i = 0; i < ArraySize(CoppiaValuta); i++) {
      index = 0;
      Pair = CoppiaValuta[i];
      if (couple == StringSubstr(Pair, 0, 3) || couple == StringSubstr(Pair, 3, 3)) {
         Pair = Pair + space;
         HiLo = (SymbolInfoDouble(Pair,SYMBOL_BIDHIGH) - SymbolInfoDouble(Pair,SYMBOL_BIDLOW)) * SymbolInfoDouble(Pair,SYMBOL_POINT);
         if (HiLo != 0.0) {
            ld_28 = 100.0 * ((SymbolInfoDouble(Pair,SYMBOL_BID) - SymbolInfoDouble(Pair,SYMBOL_BIDLOW)) / HiLo * SymbolInfoDouble(Pair,SYMBOL_POINT));
            if (ld_28 >  3.0) index = 1;
            if (ld_28 > 10.0) index = 2;
            if (ld_28 > 25.0) index = 3;
            if (ld_28 > 40.0) index = 4;
            if (ld_28 > 50.0) index = 5;
            if (ld_28 > 60.0) index = 6;
            if (ld_28 > 75.0) index = 7;
            if (ld_28 > 90.0) index = 8;
            if (ld_28 > 97.0) index = 9;
            cnt++;
            if (couple == StringSubstr(Pair, 3, 3)) index = 9 - index;
            ld_ret_36 += index;
         }
      }
   }
   if(cnt!=0)ld_ret_36 /= cnt;
   return (ld_ret_36);
}

//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//| objectCreate function                                            |
//+------------------------------------------------------------------+
void objectCreate(string nome, int angolo, int val_x, int val_y, int val_ang, string testo = "-", int fontsize = 42, string fontname = "Arial", color colore1 = -1)
   {
   if (ObjectFind(0,nome) != 0) {
      ObjectCreate(0,nome, OBJ_LABEL, 0, 0, 0);
      ObjectSetInteger(0,nome, OBJPROP_CORNER, angolo);
      ObjectSetInteger(0,nome, OBJPROP_COLOR, colore1);
      ObjectSetInteger(0,nome, OBJPROP_XDISTANCE, val_x);
      ObjectSetInteger(0,nome, OBJPROP_YDISTANCE, val_y);
      ObjectSetDouble(0,nome, OBJPROP_ANGLE, val_ang);
      ObjectSetString(0,nome,OBJPROP_TEXT,testo);
      return;
   }
   ObjectSetInteger(0,nome, OBJPROP_CORNER, angolo);
   ObjectSetInteger(0,nome, OBJPROP_COLOR, colore1);
   ObjectSetInteger(0,nome, OBJPROP_XDISTANCE, val_x);
   ObjectSetInteger(0,nome, OBJPROP_YDISTANCE, val_y);
   ObjectSetDouble(0,nome, OBJPROP_ANGLE, val_ang);
   ObjectSetString(0,nome,OBJPROP_TEXT,testo);
}
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
void Sell(double _volume=0.01,string _symbol="EURUSD",string _CommentSellProfit="0.00")
  {
   double volume=_volume;
//string symbol=_symbol;
   string symbol=_symbol;
   int    digits=(int)SymbolInfoInteger(symbol,SYMBOL_DIGITS);
   double SL=SetStopLoss(ORDER_TYPE_SELL);
   SL=NormalizeDouble(SL,digits);
   double TP=SetTakeProffit(ORDER_TYPE_SELL);
   TP=NormalizeDouble(TP,digits);
   double open_price=SymbolInfoDouble(symbol,SYMBOL_BID);
   string comment=StringFormat("SELL %s %G lots at %s, SL=%s TP=%s",
                               symbol,volume,
                               DoubleToString(open_price,digits),
                               DoubleToString(SL,digits),
                               DoubleToString(TP,digits));
   //comment = magicNumber + " " + comment;
   comment = _CommentSellProfit;

//Print(comment);
   operationStopLoss=SL;
   operationTakeProffit=TP;
   operationPrice=open_price;
   objTrade.SetExpertMagicNumber(magicNumber);
   numberBarsOpenPosition=Bars(Symbol(),PERIOD_CURRENT);
   bool canSell=objTrade.Sell(volume,symbol,open_price,SL,TP,comment);
   if(!canSell)
     {
      //--- mensaje de error
      /*Print("Fail Sell() method. Return code=",objTrade.ResultRetcode(),
            ". error message: ",objTrade.ResultRetcodeDescription());*/
     }
//Sleep(8000);

  }
//+------------------------------------------------------------------+
void Buy(double _volume=0.01,string _symbol="EURUSD", string _CommentBuyProfit=0.00)
  {
   double volume=_volume;
//string symbol=_symbol;
   string symbol=_symbol;
   int    digits=(int)SymbolInfoInteger(symbol,SYMBOL_DIGITS);
   double SL=SetStopLoss(ORDER_TYPE_BUY);
   SL=NormalizeDouble(SL,digits);
   double TP=SetTakeProffit(ORDER_TYPE_BUY);
   TP=NormalizeDouble(TP,digits);
   double open_price=SymbolInfoDouble(symbol,SYMBOL_ASK);
   string comment=StringFormat("BUY %s %G lots at %s, SL=%s TP=%s",
                               symbol,volume,
                               DoubleToString(open_price,digits),
                               DoubleToString(SL,digits),
                               DoubleToString(TP,digits));
   //comment = magicNumber + " " + comment;
   comment = _CommentBuyProfit;
//Print(comment);
   operationStopLoss=SL;
   operationTakeProffit=TP;
   operationPrice=open_price;
   objTrade.SetExpertMagicNumber(magicNumber);
   numberBarsOpenPosition=Bars(Symbol(),PERIOD_CURRENT);
   bool canBuy=objTrade.Buy(volume,symbol,open_price,SL,TP,comment);
   if(!canBuy)
     {
      //--- mensaje de error
      /*Print("Fail Buy() method. Return code=",objTrade.ResultRetcode(),
            ". error message: ",objTrade.ResultRetcodeDescription());*/
     }
//Sleep(8000);
  }
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
double SetStopLoss(ENUM_ORDER_TYPE orderType)
  {
   double sl=0.0;
   double _ASK = SymbolInfoDouble(Symbol(),SYMBOL_ASK);
   double _BID = SymbolInfoDouble(Symbol(),SYMBOL_BID);
   if(orderType==ORDER_TYPE_BUY)
     {
      sl=(InpStopLoss==0)?0.0:_ASK-ExtStopLoss;
     }
   else
      if(orderType==ORDER_TYPE_SELL)
        {
         sl=(InpStopLoss==0)?0.0:_BID+ExtStopLoss;
        }
   return(sl);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double SetTakeProffit(ENUM_ORDER_TYPE orderType)
  {
   double tp=0.0;
   double _ASK = SymbolInfoDouble(Symbol(),SYMBOL_ASK);
   double _BID = SymbolInfoDouble(Symbol(),SYMBOL_BID);
   if(orderType==ORDER_TYPE_BUY)
     {
      tp=(InpTakeProfit==0)?0.0:_ASK+ExtTakeProfit;
     }
   else
      if(orderType==ORDER_TYPE_SELL)
        {
         tp=(InpTakeProfit==0)?0.0: _BID-ExtTakeProfit;
        }
   return(tp);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
int SetDigitsAdjusts(int adjustDigits=1)
  {
   int _adjustDigits=adjustDigits;
   int symbolDigits=objSymbol.Digits();
   if(symbolDigits==3 || symbolDigits==5)
      _adjustDigits=10;
   return(_adjustDigits);
  }
//+------------------------------------------------------------------+
void CloseAllPositionsSellOrderbyPair(string _PairsLabel="EURUSD")
{
   int total=PositionsTotal();
   for(int i=0; i<total; i++)
     {
      ulong  position_ticket=PositionGetTicket(i);
      string position_symbol=PositionGetString(POSITION_SYMBOL);
      double position_profit=PositionGetDouble(POSITION_PROFIT);
      ulong  magic=PositionGetInteger(POSITION_MAGIC);
      ENUM_POSITION_TYPE type=(ENUM_POSITION_TYPE)PositionGetInteger(POSITION_TYPE);
      if(POSITION_TYPE_SELL==type && position_symbol==_PairsLabel )
        {
         ClosePosition(position_ticket);
        }
     }
}
void CloseAllPositionsBuyOrderbyPair(string _PairsLabel="EURUSD")
{
   int total=PositionsTotal();
   for(int i=0; i<total; i++)
     {
      ulong  position_ticket=PositionGetTicket(i);
      string position_symbol=PositionGetString(POSITION_SYMBOL);
      double position_profit=PositionGetDouble(POSITION_PROFIT);
      ulong  magic=PositionGetInteger(POSITION_MAGIC);
      ENUM_POSITION_TYPE type=(ENUM_POSITION_TYPE)PositionGetInteger(POSITION_TYPE);
      if(POSITION_TYPE_BUY==type && position_symbol==_PairsLabel)
        {
         ClosePosition(position_ticket);
        }
     }
}



//+------------------------------------------------------------------+
void closeAllBuyPositionsPositive()
  {
   int total=PositionsTotal();
   for(int i=0; i<total; i++)
     {
      ulong  position_ticket=PositionGetTicket(i);
      string position_symbol=PositionGetString(POSITION_SYMBOL);
      double position_profit=PositionGetDouble(POSITION_PROFIT);
      ulong  magic=PositionGetInteger(POSITION_MAGIC);
      ENUM_POSITION_TYPE type=(ENUM_POSITION_TYPE)PositionGetInteger(POSITION_TYPE);
      if(POSITION_TYPE_BUY==type && magic==magicNumber && position_profit>0.00)
        {
         ClosePosition(position_ticket);
        }
     }
  }
  

 
//+------------------------------------------------------------------+
void closeAllSellPositionsPositive()
  {
   int total=PositionsTotal();
   for(int i=0; i<total; i++)
     {
      ulong  position_ticket=PositionGetTicket(i);
      string position_symbol=PositionGetString(POSITION_SYMBOL);
      double position_profit=PositionGetDouble(POSITION_PROFIT);
      ulong  magic=PositionGetInteger(POSITION_MAGIC);
      ENUM_POSITION_TYPE type=(ENUM_POSITION_TYPE)PositionGetInteger(POSITION_TYPE);
      if(POSITION_TYPE_SELL==type && magic==magicNumber && position_profit>0.00)
        {
         ClosePosition(position_ticket);
        }
     }
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
bool closeAllBuyPositionsNegative()
  {
   int positionsTotal=PositionsTotal();
   int contClosePositionFail=0;
   for(int i=positionsTotal-1; i>=0; i--)
     {
      ulong  ticket=PositionGetTicket(i);
      string position_symbol=PositionGetString(POSITION_SYMBOL);
      double position_profit=PositionGetDouble(POSITION_PROFIT);
      ulong  magic=PositionGetInteger(POSITION_MAGIC);
      ENUM_POSITION_TYPE type=(ENUM_POSITION_TYPE)PositionGetInteger(POSITION_TYPE);
      if(POSITION_TYPE_BUY==type && magic==magicNumber && position_profit<-75.00)
        {
         //ClosePosition(ticket);
         bool restulClosePositon=ClosePosition(ticket);
         if(!restulClosePositon)
           {
            contClosePositionFail++;
            //Print(restulClosePositon);
           }
        }

     }
   return(contClosePositionFail>0 ?true : false);
  }
//+---------------------------------------------------------------------+
bool closeAllSellPositionsNegative()
  {
   int positionsTotal=PositionsTotal();
   int contClosePositionFail=0;
   for(int i=positionsTotal-1; i>=0; i--)
     {
      ulong  ticket=PositionGetTicket(i);
      string position_symbol=PositionGetString(POSITION_SYMBOL);
      double position_profit=PositionGetDouble(POSITION_PROFIT);
      ulong  magic=PositionGetInteger(POSITION_MAGIC);
      ENUM_POSITION_TYPE type=(ENUM_POSITION_TYPE)PositionGetInteger(POSITION_TYPE);
      if(POSITION_TYPE_SELL==type && magic==magicNumber && position_profit<-75.00)
        {
         //ClosePosition(ticket);
         bool restulClosePositon=ClosePosition(ticket);
         if(!restulClosePositon)
           {
            contClosePositionFail++;
            //Print(restulClosePositon);
           }
        }
     }
   return(contClosePositionFail>0 ?true : false);
  }
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+UY
bool ClosePosition(ulong ticket=0)
  {
   return objTrade.PositionClose(ticket);
  }

//+------------------------------------------------------------------+
bool CloseAllPositions()
  {
//magicNumber=XmagicNumber;
//magicNumberLevel=1;
   int contClosePositionFail=0;
   int positionsTotal=PositionsTotal();
   for(int i=positionsTotal-1; i>=0; i--)
     {
      ulong ticket=PositionGetTicket(i);

      ulong  position_ticket=PositionGetTicket(i);
      string position_symbol=PositionGetString(POSITION_SYMBOL);
      double position_profit=PositionGetDouble(POSITION_PROFIT);
      double position_size=PositionGetDouble(POSITION_VOLUME);
      ulong  magic=PositionGetInteger(POSITION_MAGIC);
      bool restulClosePositon;
      //if(position_size!=MyLotSize&&magic==magicNumber)
         restulClosePositon=ClosePosition(ticket);

      if(!restulClosePositon)
         contClosePositionFail++;
     }
   return(contClosePositionFail>0 ?true : false);
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
bool CloseAllPositionsOrders()
  {
//magicNumber=XmagicNumber;
//magicNumberLevel=1;
   int contClosePositionFail=0;
   int positionsTotal=PositionsTotal();
   for(int i=positionsTotal-1; i>=0; i--)
     {
      ulong ticket=PositionGetTicket(i);

      ulong  position_ticket=PositionGetTicket(i);
      string position_symbol=PositionGetString(POSITION_SYMBOL);
      double position_profit=PositionGetDouble(POSITION_PROFIT);
      double position_size=PositionGetDouble(POSITION_VOLUME);
      ulong  magic=PositionGetInteger(POSITION_MAGIC);
      bool restulClosePositon;
      if(position_size!="0.01"&&magic==magicNumber)
         restulClosePositon=ClosePosition(ticket);

      if(!restulClosePositon)
         contClosePositionFail++;
     }
   return(contClosePositionFail>0 ?true : false);
  }
//+------------------------------------------------------------------+



//+------------------------------------------------------------------+
void getSellOrdersProfitInfo()
  {
   int total=PositionsTotal();
   for(int kl=0; kl<HowManyPairsWorking; kl++)
     {
      MTSellCounts[kl]=0.00;
      MTSellProfit[kl]=0.00;
      MTSellVolume[kl]=0.00;
     }
   for(int i=0; i<total; i++)
     {
      ulong  position_ticket=PositionGetTicket(i);
      string position_symbol=PositionGetString(POSITION_SYMBOL);
      double position_profit=PositionGetDouble(POSITION_PROFIT)+PositionGetDouble(POSITION_SWAP);
      double position_size=PositionGetDouble(POSITION_VOLUME);
      ulong  magic=PositionGetInteger(POSITION_MAGIC);
      ENUM_POSITION_TYPE type=(ENUM_POSITION_TYPE)PositionGetInteger(POSITION_TYPE);

      for(int j=0; j<28; j++)

        {
         if(position_symbol==AllPairs[j]&&POSITION_TYPE_SELL==type)
           {
               MTSellCounts[j]=MTBuyCounts[j]+1.00;
               MTSellProfit[j]=MTBuyProfit[j]+position_profit;
               MTSellVolume[j]=MTBuyVolume[j]+position_size;
           }
        }


     }
  }
//+------------------------------------------------------------------+
void getBuyOrdersProfitInfo()
  {
   int total=PositionsTotal();
   for(int kl=0; kl<HowManyPairsWorking; kl++)
     {
      MTBuyCounts[kl]=0.00;
      MTBuyProfit[kl]=0.00;
      MTBuyVolume[kl]=0.00;
     }
   for(int i=0; i<total; i++)
     {
      ulong  position_ticket=PositionGetTicket(i);
      string position_symbol=PositionGetString(POSITION_SYMBOL);
      double position_profit=PositionGetDouble(POSITION_PROFIT)+PositionGetDouble(POSITION_SWAP);
      double position_size=PositionGetDouble(POSITION_VOLUME);
      ulong  magic=PositionGetInteger(POSITION_MAGIC);
      ENUM_POSITION_TYPE type=(ENUM_POSITION_TYPE)PositionGetInteger(POSITION_TYPE);

      for(int j=0; j<28; j++)

        {
         if(position_symbol==AllPairs[j]&&POSITION_TYPE_BUY==type)
           {
               MTBuyCounts[j]=MTBuyCounts[j]+1.00;
               MTBuyProfit[j]=MTBuyProfit[j]+position_profit;
               MTBuyVolume[j]=MTBuyVolume[j]+position_size;
           }
        }


     }
  }
/*
//+---------------------------------------------------------------------+
bool closeAllBuyPositionsPositive10()
  {
   int positionsTotal=PositionsTotal();
   int contClosePositionFail=0;
   for(int i=positionsTotal-1; i>=0; i--)
     {
      ulong  ticket=PositionGetTicket(i);
      string position_symbol=PositionGetString(POSITION_SYMBOL);
      double position_profit=PositionGetDouble(POSITION_PROFIT);
      double position_size=PositionGetDouble(POSITION_VOLUME);
      ulong  magic=PositionGetInteger(POSITION_MAGIC);
      ENUM_POSITION_TYPE type=(ENUM_POSITION_TYPE)PositionGetInteger(POSITION_TYPE);
      int SymbolId;
      for(int fff=1; fff<29; fff++)
        {
         if(position_symbol==AllPairs[fff])
           {
            SymbolId=fff;
            break;
           }
        }

      double abara1 = xOrderMaxBuyProfit[SymbolId];
      double abara2 = xOrderTopMaxBuyProfit[SymbolId]*0.7;
      double abara3 = xOrderMaxBuyProfit[SymbolId]+xOrderMaxSellProfit[SymbolId];
      if(magic==magicNumber && abara3>99.00&&position_symbol==AllPairs[SymbolId]&&abara1<abara2&&position_size==MyLotSize)
        {
         //ClosePosition(ticket);
         bool restulClosePositon=ClosePosition(ticket);
         if(!restulClosePositon)
           {
            contClosePositionFail++;
            //Print(restulClosePositon);
           }
        }
     }
   return(contClosePositionFail>0 ?true : false);
  }
//+------------------------------------------------------------------+
*/
/*
//+---------------------------------------------------------------------+
bool closeAllSellPositionsPositive10()
  {
   int positionsTotal=PositionsTotal();
   int contClosePositionFail=0;
   for(int i=positionsTotal-1; i>=0; i--)
     {
      ulong  ticket=PositionGetTicket(i);
      string position_symbol=PositionGetString(POSITION_SYMBOL);
      double position_profit=PositionGetDouble(POSITION_PROFIT);
      double position_size=PositionGetDouble(POSITION_VOLUME);
      ulong  magic=PositionGetInteger(POSITION_MAGIC);
      ENUM_POSITION_TYPE type=(ENUM_POSITION_TYPE)PositionGetInteger(POSITION_TYPE);
      if(POSITION_TYPE_SELL==type && magic==magicNumber && position_profit>999.00&&position_size=="0.1")
        {
         //ClosePosition(ticket);
         bool restulClosePositon=ClosePosition(ticket);
         if(!restulClosePositon)
         {
         contClosePositionFail++;
         Print(restulClosePositon);
         }
        }
     }
    return(contClosePositionFail>0 ?true : false);
  }
//+------------------------------------------------------------------+

*/
/*
//+---------------------------------------------------------------------+
bool closeAllSellPositionsPositive10()
  {
   int positionsTotal=PositionsTotal();
   int contClosePositionFail=0;
   for(int i=positionsTotal-1; i>=0; i--)
     {
      ulong  ticket=PositionGetTicket(i);
      string position_symbol=PositionGetString(POSITION_SYMBOL);
      double position_profit=PositionGetDouble(POSITION_PROFIT);
      double position_size=PositionGetDouble(POSITION_VOLUME);
      ulong  magic=PositionGetInteger(POSITION_MAGIC);
      ENUM_POSITION_TYPE type=(ENUM_POSITION_TYPE)PositionGetInteger(POSITION_TYPE);
      int SymbolId;
      for(int fff=1; fff<29; fff++)
        {
         if(position_symbol==AllPairs[fff])
           {
            SymbolId=fff;
            break;
           }
        }

      double abara1 = xOrderMaxSellProfit[SymbolId];
      double abara2 = xOrderTopMaxSellProfit[SymbolId]*0.7;
      double abara3 = xOrderMaxBuyProfit[SymbolId]+xOrderMaxSellProfit[SymbolId];

      if(magic==magicNumber && abara3>99.00&&position_symbol==AllPairs[SymbolId]&&abara1<abara2&&position_size==MyLotSize)
        {
         //ClosePosition(ticket);
         bool restulClosePositon=ClosePosition(ticket);
         if(!restulClosePositon)
           {
            contClosePositionFail++;
            //Print(restulClosePositon);
           }
        }
     }
   return(contClosePositionFail>0 ?true : false);
  }
//+------------------------------------------------------------------+
*/
/*
/////////////////////////////////

void SwapMyDailySortSell(int si,int sj)

  {
   double SwapValue1 = dailysort[si,2];
   double SwapValue2 = dailysort[sj,2];

   dailysort[si,2] = SwapValue2;
   dailysort[sj,2] = SwapValue1;

//Print(SwapValue1+" sira "+dailysort[si,0]+" "+SwapValue2+" sira "+dailysort[sj,0]+" degeri yer değiştirdi.");
//Print("Yeni değerler...");
//Print(SwapValue2+". sira "+dailysort[si,0]+" "+SwapValue1+". sira "+dailysort[sj,0]+" degeri oldu.");
//Print(SwapValue1+" sira "+dailysort[sj,0]+" "+SwapValue2+" sira "+dailysort[si,0]+" degeri oldu.");

  }


void SwapMyDailySortBuy(int i,int j)

  {
   double SwapValue1 = dailysort[i,3];
   double SwapValue2 = dailysort[j,3];

   dailysort[i,3] = SwapValue2;
   dailysort[j,3] = SwapValue1;
  }

void SwapMyDailySortSellBuy(int i,int j)

  {
   double SwapValue1 = dailysort[i,2];
   double SwapValue2 = dailysort[j,3];

   dailysort[i,2] = SwapValue2;
   dailysort[j,3] = SwapValue1;
  }

void SwapMyDailySortBuySell(int i,int j)

  {
   double SwapValue1 = dailysort[i,3];
   double SwapValue2 = dailysort[j,2];

   dailysort[i,3] = SwapValue2;
   dailysort[j,2] = SwapValue1;
  }
///////////////////////////////////
*/
/*
      
void ProfitCalculationMyOrders()
{
   for(int itt=1;itt<29;itt++)
   {
      double CloseAskPrice = SymbolInfoDouble(AllPairs[itt],SYMBOL_BID);
      double CloseBidPrice = SymbolInfoDouble(AllPairs[itt],SYMBOL_ASK);
      double SymbolPoint = SymbolInfoDouble(AllPairs[itt],SYMBOL_POINT);
      
      
      if(MyOrderPriceAsk[itt]!=0.00){MyOrderProfitLong[itt] = (-MyOrderPriceAsk[itt]+CloseAskPrice)*(1.00/SymbolPoint)*0.01;}
      //Print(AllPairs[itt]+":"+MyOrderProfitLong[itt]+":"+BuyProfit[itt]);
      
      if(MyOrderPriceBid[itt]!=0.00){MyOrderProfitShort[itt] = (MyOrderPriceBid[itt]-CloseBidPrice)*(1.00/SymbolPoint)*0.01;}
      //Print(AllPairs[itt]+":"+MyOrderProfitShort[itt]+":"+SellProfit[itt]);
  
   }
   
}



void SiralaProfit()

  {

   getSellProfitInfo();
   getBuyProfitInfo();
   for(int i=1; i<29; i++)
     {
      dailysort[i,0] = SellProfit[i];
     }

   for(int i=1; i<29; i++)
     {
      dailysort[i,1] = BuyProfit[i];
     }


   for(int klmx=1; klmx<60; klmx++)
     {
      for(int i=1; i<29; i++)
        {
         for(int j=1; j<29; j++)
           {
            if(j!=i)
              {
               if(dailysort[i,0]>dailysort[j,0]&&dailysort[i,2]>dailysort[j,2])
                 {
                  SwapMyDailySortSell(i,j);
                 }
              }
           }
        }

      for(int i=1; i<29; i++)
        {
         for(int j=1; j<29; j++)
           {
            if(j!=i)
              {
               if(dailysort[i,1]>dailysort[j,1]&&dailysort[i,3]>dailysort[j,3])
                 {
                  SwapMyDailySortBuy(i,j);
                 }
              }
           }

        }

      for(int i=1; i<29; i++)
        {
         for(int j=1; j<29; j++)
           {
            if(j!=i)
              {
               if(dailysort[i,1]>dailysort[j,0]&&dailysort[i,3]>dailysort[j,2])
                 {
                  SwapMyDailySortBuySell(i,j);
                 }
              }
           }

        }
      for(int i=1; i<29; i++)
        {
         for(int j=1; j<29; j++)
           {
            if(j!=i)
              {
               if(dailysort[i,0]>dailysort[j,1]&&dailysort[i,2]>dailysort[j,3])
                 {
                  SwapMyDailySortSellBuy(i,j);
                 }
              }
           }

        }
     }

  }
//+------------------------------------------------------------------+


*/






//+------------------------------------------------------------------+
void TradeInfo()
  {
   int total=PositionsTotal();
   for(int kl=0; kl<HowManyPairsWorking; kl++)
     {
      MTSellCounts[kl]=0.00;
      MTSellProfit[kl]=0.00;
      MTSellVolume[kl]=0.00;
      MTBuyCounts[kl]=0.00;
      MTBuyProfit[kl]=0.00;
      MTBuyVolume[kl]=0.00;
     }
   for(int i=0; i<total; i++)
     {
      ulong  position_ticket=PositionGetTicket(i);
      string position_symbol=PositionGetString(POSITION_SYMBOL);
      double position_profit=PositionGetDouble(POSITION_PROFIT)+PositionGetDouble(POSITION_SWAP);
      double position_size=PositionGetDouble(POSITION_VOLUME);
      ulong  magic=PositionGetInteger(POSITION_MAGIC);
      ENUM_POSITION_TYPE type=(ENUM_POSITION_TYPE)PositionGetInteger(POSITION_TYPE);

      for(int j=0; j<HowManyPairsWorking; j++)

        {
         if(position_symbol==AllPairs[j]&&POSITION_TYPE_BUY==type)
           {
               MTBuyCounts[j]=MTBuyCounts[j]+1.00;
               MTBuyProfit[j]=MTBuyProfit[j]+position_profit;
               MTBuyVolume[j]=MTBuyVolume[j]+position_size;
           }
         if(position_symbol==AllPairs[j]&&POSITION_TYPE_SELL==type)
           {
               MTSellCounts[j]=MTSellCounts[j]+1.00;
               MTSellProfit[j]=MTSellProfit[j]+position_profit;
               MTSellVolume[j]=MTSellVolume[j]+position_size;
           }        
         }


     }
  }






//+------------------------------------------------------------------+



//+------------------------------------------------------------------+
void License_Check(bool xfalse)
  {
   ulong account_id = AccountInfoInteger(ACCOUNT_LOGIN);

   license_status = xfalse;
   license_status = false;
   string uid = "|"+(string)account_id + "|"+AccountInfoString(ACCOUNT_NAME)+ "|"+AccountInfoString(ACCOUNT_COMPANY)+"|"+AccountInfoString(ACCOUNT_CURRENCY) + "|" + AccountInfoInteger(ACCOUNT_LEVERAGE);

   string to_encode = uid;
   string encoded;
   string decoded;
   
   Base64Encode(to_encode, encoded);
   Base64Decode(encoded, decoded);

   string url = "https://fxforexstore.com/wp-json/lmfwc/v2/licenses/" + license_key +
    "?consumer_key=" + consumer_key() + "&consumer_secret=" + consumer_secret() + "&uid=" + encoded;  
   //Print(url);
    
   bool bResult;  int i,iNet1,iNet2; //, iRequest;  
   string stURL="https://fxforexstore.com";

   bResult=InternetCheckConnectionW(stURL,1,0); // 1 == FLAG_ICC_FORCE_CONNECTION
   Print("License Control Progress Started: ",bResult);
   if(!bResult) return;
//---
   string stAgent="Mozilla/5.0",stNull="";
   iNet1 = InternetOpenW(stAgent, // _In_ LPCTSTR lpszAgent 
                         1,       // 1 == INTERNET_OPEN_TYPE_DIRECT
                         stNull,  // _In_ LPCTSTR lpszProxyName
                         stNull,  // _In_ LPCTSTR lpszProxyBypass
                         NULL);   // _In_ DWORD dwFlags
   //Print("iNet1 == ",iNet1);
   if(iNet1==0) return;
//---
   stURL=url;
   string stHdr="Accept: text/*";
   iNet2 = InternetOpenUrlW(iNet1,            // HINTERNET hInternet,
                            stURL,            // LPCWSTR   lpszUrl,
                            stHdr,            // LPCWSTR   lpszHeaders,
                            StringLen(stHdr), // DWORD     dwHeadersLength,
                            0x00080000,       // DWORD dwFlags, 0x00080000 == INTERNET_FLAG_NO_COOKIES
                            NULL);            // DWORD_PTR dwContext
   //Print("iNet2 == ",iNet2);
//---
   if(iNet2==0)
     {
      InternetCloseHandle(iNet1);
      return;
     }
//---
   uint uGet,uGot;
   uGet=4080; // number of bytes to download
   bResult = InternetReadFile(iNet2,     // _In_  HINTERNET hFile
                              uc_Buffer, // _Out_ LPVOID lpBuffer
                              uGet,      // _In_  DWORD dwNumberOfBytesToRead
                              uGot);     // _Out_ LPDWORD lpdwNumberOfBytesRead
   //Print("InternetReadFile() returned ",bResult,". Number of bytes read: ",uGot);
//---
   InternetCloseHandle(iNet2);  // download done
   if(!bResult) {InternetCloseHandle(iNet1); return;}
   uc_Buffer[uGot]=0;  // Terminate string in uc_Buffer by appending a null character.
   
   string controlval = "\"status\":4";
   string xleft = StringSubstr(CharArrayToString(uc_Buffer),2,7);
   
   i=StringFind(CharArrayToString(uc_Buffer),controlval,0); // 0 == position from which search starts 
   
   
   //Print(CharArrayToString(uc_Buffer));
   
   
   //if(i==(-1)&&xleft=="success"){license_status=true; license_status_comment="License Active: "+license_key+"  www.fxforexstore.com"; InternetCloseHandle(iNet1); Print(xleft + " "+license_status + " " + license_status_comment); return;}
   //if(i!=(-1)&&xleft=="success"){license_status=false; license_status_comment="License Invalid, Renew Your Key:"+license_key+" www.fxforexstore.com";  InternetCloseHandle(iNet1); Print(xleft+" "+license_status + " " + license_status_comment);  return;}
   //if(xleft!="success"){license_status=false; license_status_comment="License Key Invalid, Check Key:"+license_key+" www.fxforexstore.com"; Print(xleft+" "+license_status + " " + license_status_comment); return;}
   
   InternetCloseHandle(iNet1); // Done with wininet.
  }//END void OnStart()
//+------------------------------------------------------------------+

string consumer_key()
   {
      return("ck_ef825c1eaea15809dcd51b6a24d4f80a338e5acf");
   } 
string consumer_secret()
   {
      return("cs_5d923e69b244a03f54a6f9a502d709caf9a7e4df");
   } 

 
static uchar ExtBase64Encode[64]={ 'A','B','C','D','E','F','G','H','I','J','K','L','M',
                                 'N','O','P','Q','R','S','T','U','V','W','X','Y','Z',
                                 'a','b','c','d','e','f','g','h','i','j','k','l','m',
                                 'n','o','p','q','r','s','t','u','v','w','x','y','z',
                                 '0','1','2','3','4','5','6','7','8','9','+','/'      };
                                 
static uchar ExtBase64Decode[256]={
                    -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,
                    -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,
                    -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  62,  -1,  -1,  -1,  63,
                    52,  53,  54,  55,  56,  57,  58,  59,  60,  61,  -1,  -1,  -1,  -2,  -1,  -1,
                    -1,   0,   1,   2,   3,   4,   5,   6,   7,   8,   9,  10,  11,  12,  13,  14,
                    15,  16,  17,  18,  19,  20,  21,  22,  23,  24,  25,  -1,  -1,  -1,  -1,  -1,
                    -1,  26,  27,  28,  29,  30,  31,  32,  33,  34,  35,  36,  37,  38,  39,  40,
                    41,  42,  43,  44,  45,  46,  47,  48,  49,  50,  51,  -1,  -1,  -1,  -1,  -1,
                    -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,
                    -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,
                    -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,
                    -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,
                    -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,
                    -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,
                    -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,
                    -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1,  -1 };
                               

void Base64Encode(string in,string &out)
  {
   int i=0,pad=0,len=StringLen(in);

   while(i<len)
     {
      
      int b3,b2,b1=StringGetCharacter(in,i);
      i++;
      if(i>=len) { b2=0; b3=0; pad=2; }
      else
        {
         b2=StringGetCharacter(in,i);
         i++;
         if(i>=len) { b3=0; pad=1; }
         else       { b3=StringGetCharacter(in,i); i++; }
        }
      //----
      int c1=(b1 >> 2);
      int c2=(((b1 & 0x3) << 4) | (b2 >> 4));
      int c3=(((b2 & 0xf) << 2) | (b3 >> 6));
      int c4=(b3 & 0x3f);
 
      out=out+CharToString(ExtBase64Encode[c1]);
      out=out+CharToString(ExtBase64Encode[c2]);
      switch(pad)
        {
         case 0:
           out=out+CharToString(ExtBase64Encode[c3]);
           out=out+CharToString(ExtBase64Encode[c4]);
           break;
         case 1:
           out=out+CharToString(ExtBase64Encode[c3]);
           out=out+"=";
           break;
         case 2:
           out=out+"==";
           break;
        }
     }
//----
  }

void Base64Decode(string in,string &out)
  {
   int i=0,len=StringLen(in);
   int shift=0,accum=0;

   while(i<len)
     {
      int value=ExtBase64Decode[StringGetCharacter(in,i)];
      if(value<0 || value>63) break;
      
      accum<<=6;
      shift+=6;
      accum|=value;
      if(shift>=8)
        {
         shift-=8;
         value=accum >> shift;
         out=out+CharToString((uchar)(value & 0xFF));
        } 
      i++;
     }
//----
  }
//+------------------------------------------------------------------+