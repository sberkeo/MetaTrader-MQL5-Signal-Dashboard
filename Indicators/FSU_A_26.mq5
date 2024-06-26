#property copyright "Copyright © 2023, ForexSignals MA INDICATORS"
#property link      "https://www.youtube.com/ForexSignals"
#property description "ForexSignals"
#property description "          "
#property version   "11.00"
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
//int AccountCheckValidAccountId=860594;//AccountInfoInteger(ACCOUNT_LOGIN);//;//15923390;//15937609;  // account number
//int AccountCheckValidAccountId=1139013;//AccountInfoInteger(ACCOUNT_LOGIN);//;//15923390;//15937609;  // account number
//int AccountCheckValidYear=2022;  // valid year
int AccountCheckValidYear=2099;  // valid year
int AccountCheckValidMonth=13;  // valid month
//int AccountCheckValidMonth2x=10;  // valid month
//int AccountCheckValidMonth3x=11;  // valid month

#property indicator_chart_window
#property indicator_buffers   5
#property indicator_plots     1

//--- main line
#property indicator_type1  DRAW_COLOR_LINE
#property indicator_color1 clrBlue, clrRed
#property indicator_style1 STYLE_SOLID
#property indicator_width1 4
#property indicator_label1 "FSU_A"

//---  include
#include <MovingAverages.mqh>

//---- input parameters 
input ushort               A_INDICATOR_PERIOD=26;           // FSU_A PERIOD
input ENUM_MA_METHOD       A_INDICATOR_MA       =  MODE_LWMA;     // FSU_A MA
input ENUM_APPLIED_PRICE   A_INDICATOR_PRICE   =  PRICE_MEDIAN;   // FSU_A PRICE
input short                A_INDICATOR_SHIFT          =  0;             // FSU_A SHIFT
input bool                 A_INDICATOR_ALERTBOX          =  false;          // FSU_A ALERTBOX        
input bool                 A_INDICATOR_MAIL           =  false;          // FSU_A MAIL
input bool                 A_INDICATOR_ALERTSOUND          =  true;          // FSU_A ALERT SOUND

//---- buffers 
double MABuffer[];
double MAColorBuffer[];
double vect[];
double wma1[];
double wma2[];

//--- global vars
int ma1_handle;
int ma2_handle;
int new_period;
int new_period_sqrt;
datetime time_alert;
int w;
string ind_name;
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
   MqlDateTime stm;
   datetime tm=TimeCurrent(stm);
   ulong AccChk=AccountInfoInteger(ACCOUNT_LOGIN);
   int CurrentDay=stm.day;

   if(stm.year > AccountCheckValidYear)// || (AccChk!=AccChkVId&&AccChk!=AccChkVId1&&AccChk!=AccChkVId2&&AccChk!=AccChkVId3&&AccChk!=AccChkVId4&&AccChk!=AccChkVId5&&AccChk!=AccChkVId6&&AccChk!=AccChkVId7&&AccChk!=AccChkVId8&&AccChk!=AccChkVId9&&AccChk!=AccChkVId10) || stm.mon>AccountCheckValidMonth)
   {
   //Comment("Expire");
   return(0);
   }
   else
   {
   //Comment(AccChk);
   
//--- periods
   new_period_sqrt=(int)fmax(MathSqrt(A_INDICATOR_PERIOD),1);
   new_period=(int)fmax((A_INDICATOR_PERIOD/2),1);

//--- handles
   ma1_handle=iMA(NULL,0,fmax(A_INDICATOR_PERIOD,2),0,A_INDICATOR_MA,A_INDICATOR_PRICE);
   ma2_handle=iMA(NULL,0,new_period,0,A_INDICATOR_MA,A_INDICATOR_PRICE);
   if(ma1_handle==INVALID_HANDLE || ma2_handle==INVALID_HANDLE)
     {
      Print("Error creating the indicator iMA on fsu_a");
      return(-1);
     }

//--- buffers
   SetIndexBuffer(0,MABuffer,INDICATOR_DATA);
   SetIndexBuffer(1,MAColorBuffer,INDICATOR_COLOR_INDEX);
   SetIndexBuffer(2,vect,INDICATOR_CALCULATIONS);
   SetIndexBuffer(3,wma1,INDICATOR_CALCULATIONS);
   SetIndexBuffer(4,wma2,INDICATOR_CALCULATIONS);

//--- direction
   ArraySetAsSeries(MABuffer,true);
   ArraySetAsSeries(MAColorBuffer,true);
   ArraySetAsSeries(vect,true);
   ArraySetAsSeries(wma1,true);
   ArraySetAsSeries(wma2,true);

//--- main buffer properties
   PlotIndexSetInteger(0,PLOT_DRAW_BEGIN,A_INDICATOR_PERIOD+new_period_sqrt+1);
   PlotIndexSetInteger(0,PLOT_SHIFT,A_INDICATOR_SHIFT);
   PlotIndexSetDouble(0,PLOT_EMPTY_VALUE,0);
   PlotIndexSetString(0,PLOT_LABEL,StringFormat("FSU_A(%u)",A_INDICATOR_PERIOD));

//--- indicator properties
   ind_name=StringFormat("FSU_A (%u)",A_INDICATOR_PERIOD);
   IndicatorSetString(INDICATOR_SHORTNAME,ind_name);
   IndicatorSetInteger(INDICATOR_DIGITS,_Digits+1);

//---   
   return(0);
    }
  }
//+------------------------------------------------------------------+
//| Custom indicator iteration function                              |
//+------------------------------------------------------------------+
int OnCalculate(const int rates_total,
                const int prev_calculated,
                const datetime &time[],
                const double &open[],
                const double &high[],
                const double &low[],
                const double &close[],
                const long &tick_volume[],
                const long &volume[],
                const int &spread[])
  {
   MqlDateTime stm;
   datetime tm=TimeCurrent(stm);
   ulong AccChk=AccountInfoInteger(ACCOUNT_LOGIN);
   int CurrentDay=stm.day;

   if(stm.year > AccountCheckValidYear)// || (AccChk!=AccChkVId&&AccChk!=AccChkVId1&&AccChk!=AccChkVId2&&AccChk!=AccChkVId3&&AccChk!=AccChkVId4&&AccChk!=AccChkVId5&&AccChk!=AccChkVId6&&AccChk!=AccChkVId7&&AccChk!=AccChkVId8&&AccChk!=AccChkVId9&&AccChk!=AccChkVId10) || stm.mon>AccountCheckValidMonth)
   {
   //Comment("Expire");
   return(0);
   }
   else
   {
   //Comment(AccChk); 
   
   ArraySetAsSeries(time,true);

//--- check for data
   if(rates_total<A_INDICATOR_PERIOD+1)return(0);

   int limit;
//--- calculate limit
   if(prev_calculated<0 || prev_calculated>rates_total)return(0);
   if(prev_calculated==0)
     {
      time_alert=time[0];
      limit=rates_total-A_INDICATOR_PERIOD-1;

      //--- clear buffers
      ArrayInitialize(MABuffer,0);
      ArrayInitialize(MAColorBuffer,0);
      ArrayInitialize(wma1,0);
      ArrayInitialize(wma2,0);
      ArrayInitialize(vect,0);

     }
   else limit=rates_total-prev_calculated;

//--- get data
   if(CopyBuffer(ma1_handle, 0, 0, limit+1, wma1) != limit+1)return(0);
   if(CopyBuffer(ma2_handle, 0, 0, limit+1, wma2) != limit+1)return(0);

   for(int i=limit; i>=0; i--)vect[i]=2*wma2[i]-wma1[i];

//---
   switch(A_INDICATOR_MA)
     {
      case  MODE_SMA:   SimpleMAOnBuffer(          rates_total, prev_calculated, 0, new_period_sqrt, vect, MABuffer); break;
      case  MODE_EMA:   ExponentialMAOnBuffer(     rates_total, prev_calculated, 0, new_period_sqrt, vect, MABuffer); break;
      case  MODE_SMMA:  SmoothedMAOnBuffer(        rates_total, prev_calculated, 0, new_period_sqrt, vect, MABuffer); break;
      case  MODE_LWMA:  LinearWeightedMAOnBuffer(  rates_total, prev_calculated, 0, new_period_sqrt, vect, MABuffer, w); break;
     }

//--- set colors
   for(int i=limit; i>=0; i--)
     {
      MAColorBuffer[i]=MAColorBuffer[i+1];
      if(MABuffer[i] > MABuffer[i+1]) MAColorBuffer[i]=0;
      if(MABuffer[i] < MABuffer[i+1]) MAColorBuffer[i]=1;
     }

//--- alerts
   if(time_alert!=time[0])
     {
      MqlTick tick;
      if(!SymbolInfoTick(_Symbol,tick))return(0);

      if(MAColorBuffer[2]==0 && MAColorBuffer[1]==1)
        {
         string mask=StringFormat("%%.%df",_Digits);
         string msg=StringFormat("%s %s %s Signal SELL at "+mask,TimeToString(tick.time,TIME_DATE|TIME_SECONDS),_Symbol,PeriodToString(),tick.bid);
         if(A_INDICATOR_ALERTBOX) Alert(msg);
         if(A_INDICATOR_MAIL) SendMail(ind_name,msg);
         if(A_INDICATOR_ALERTSOUND) PlaySound("alert.wav");
        }

      if(MAColorBuffer[2]==1 && MAColorBuffer[1]==0)
        {
         string mask=StringFormat("%%.%df",_Digits);
         string msg=StringFormat("%s %s %s Signal BUY at "+mask,TimeToString(tick.time,TIME_DATE|TIME_SECONDS),_Symbol,PeriodToString(),tick.ask);
         if(A_INDICATOR_ALERTBOX) Alert(msg);
         if(A_INDICATOR_MAIL) SendMail(ind_name,msg);
         if(A_INDICATOR_ALERTSOUND) PlaySound("alert.wav");
        }

      time_alert=time[0];
     }

   return(rates_total);
   }
  }
//+------------------------------------------------------------------+
//|   PeriodToString                                                 |
//+------------------------------------------------------------------+
string PeriodToString(ENUM_TIMEFRAMES period=PERIOD_CURRENT)
  {
   if(period==PERIOD_CURRENT)period=_Period;
   string str=EnumToString(period);
   if(StringLen(str)>7) return(StringSubstr(str,7));
   return("");
  }
//+------------------------------------------------------------------+
