#include <iostream>
#include <string.h>
using namespace std;
int moisture = 0;
int months();
void control(int month);
string Moisture();
void r_cropping();
void int_cropping();
string months(int num);
void winter_planting_season();
void summer_planting_season();
void winter_harvesting_season();
string crop_for_winter(int num ,int method);
string crop_for_summer(int num ,int method);
void moisture_track();
void summer_harvesting_season();
bool winterplanting = false;
bool summerplanting = false;
int maize =0;
bool maize_fertility =false;
int sorghum = 0;
bool sorghum_fertility =false;
int watermelon =0;
bool watermelon_fertility =false;
int groundnuts = 0;
bool groundnuts_fertility =false;
int potatoes = 0;
bool potatoes_fertility =false;
int beans= 0;
bool beans_fertility =false;
int peas = 0 ;
bool peas_fertility =false;
int wheat = 0;
bool wheat_fertility =false;
int pumpkin = 0;
bool pumpkin_fertility =false;
int yeild(bool fertility);


void moisture_track()
{
	cout<<"WAS THERE ANY RAIN DURING THE MONTH [Y/N] :";
	string choose;
	cin>>choose;
	if(choose == "y"||choose == "Y")
	{
		moisture = moisture +1;
	}
}

void winter_harvesting_season()
{
	cout<<"______________________________________________ITS WINTER HARVESTING SEASON _________________________________________\n\n\n";
	if(winterplanting )
	{
		cout<<"the yeild is ::\n";
		int mult ;
		if(wheat != 0)
		{
			cout<<"wheat seeds planted "<<wheat<<" and  harvest is ";
			mult = yeild(wheat_fertility);
			wheat = wheat*mult;
			cout<<wheat<<endl;
		}
		else if(peas != 0)
		{
			cout<<"peas  seeds planted "<<peas<<" and  harvest is ";
			mult = yeild(peas_fertility);
			peas  = peas *mult;
			cout<<peas <<endl;
		}else if(potatoes != 0)
		{
			cout<<"potatoes  seeds planted "<<potatoes<<" and  harvest is ";
			mult = yeild(potatoes_fertility);
			potatoes = potatoes *mult;
			cout<<potatoes <<endl;
		}	
	}
	else
	{
		cout<<"\n\n\n_________________________________________________________________________________________________________________________________________"<<endl;
		cout<<"                                    there was no planting last winter so no crops to harvest                                             "<<endl;
		cout<<"_________________________________________________________________________________________________________________________________________\n\n\n"<<endl;
	}
	cout<<" ##Done harvesting for winter##  ##Done harvesting for winter##  ##Done harvesting for winter##  ##Done harvesting for winter##  ##Done harvesting for winter## "<<endl;
	moisture = 0;
	moisture_track();
	wheat= 0;
	peas = 0;
	potatoes= 0;
	peas_fertility = false;
	wheat_fertility = false;
	potatoes_fertility = false;
}
void summer_harvesting_season()
{
	cout<<"_________________________________________ITS SUMMER HARVESTING SEASON _________________________________________\n\n\n";
	if(summerplanting)
	{
		cout<<"the yeild is ::\n";
		int mult ;
		if(maize != 0)
		{
			cout<<"maize seeds planted "<<maize<<" and  harvest is ";
			mult = yeild(maize_fertility);
			maize = maize*mult;
			cout<<maize<<endl;
		}
		else if(sorghum != 0)
		{
			cout<<"sorghum  seeds planted "<<sorghum<<" and  harvest is ";
			mult = yeild(sorghum_fertility);
			sorghum  = sorghum *mult;
			cout<<sorghum <<endl;
		}else if(watermelon != 0)
		{
			cout<<"watermelon  seeds planted "<<watermelon<<" and  harvest is ";
			mult = yeild(watermelon_fertility);
			watermelon  = watermelon *mult;
			cout<<watermelon <<endl;
		}else if(groundnuts != 0)
		{
			cout<<"groundnuts  seeds planted "<<groundnuts<<" and  harvest is ";
			mult = yeild(groundnuts_fertility);
			groundnuts  = groundnuts*mult;
			cout<<groundnuts <<endl;
		}else if(beans != 0)
		{
			cout<<"beans  seeds planted "<<beans<<" and  harvest is ";
			mult = yeild(beans_fertility);
			beans  = beans*mult;
			cout<<beans <<endl;
		}	
	}
	else
	{
		cout<<"\n\n\n_________________________________________________________________________________________________________________________________________"<<endl;
		cout<<"                                    there was no planting last summer so no crops to harvest                                             "<<endl;
		cout<<"_________________________________________________________________________________________________________________________________________\n\n\n"<<endl;
	}
	
	cout<<" ##Done harvesting for summer##  ##Done harvesting for summer##  ##Done harvesting for summer##  ##Done harvesting for summer##  ##Done harvesting for summer## "<<endl;
	moisture_track();
	maize =0;
	sorghum = 0;
	watermelon = 0;
	groundnuts = 0;
	beans = 0;
	beans_fertility = false;
	sorghum_fertility = false;
	maize_fertility = false;
	watermelon_fertility = false;
	groundnuts_fertility = false;

	
}

void control(int count)
{
	bool terminate = false;
	while(!terminate)
	{
		if(count<=3)
		{
			 winter_harvesting_season();
		}
		else if(count <=5)
		{
			winter_planting_season();     
			
		}
		else if(count<=7)
		{
			cout<<"\n\n\n_________________________________________________________________________________________________________________________________________"<<endl;
			cout<<"                                    there is nothing to do during this time                                                                    "<<endl;
			cout<<"_______________________________________________________________________________________________________________________________________________n\n\n"<<endl;
			moisture_track();
		}
		
		else if(count<=9)
		{
			summer_planting_season();     
		}
		else if(count<=12)
		{
			summer_harvesting_season();
		}	
		else 	
		{
			count = 1;
			continue;
		}
		
		cout<<"please enter t to terminate programm or C to continue \n";
        cout<<"enter slection ::";
        string temp;
        cin>>temp;
        if(temp == "t" || temp == "T")
        {
            terminate= true;
            cout<<"\n\n\n########################################## QUITING PROGRAMM ####################################### QUITING PROGRAMM #################### QUITING PROGRAMM ###########\n\n\n";
            break;
        }else if(temp == "C" || temp == "c" )
        {
        	cout<<"\n\n\n######################################################\t END OF "<< months(count) <<"\t###################################################################\n\n\n\n"<<endl;
        	count++;
            continue;
        }else
        {
        	cout<<"invalid selection please write the correct selection "<<endl;
        	control(count);
		}
	}
}


void welcome_menu(){
	cout<<"\n\n\n==========================================================================Welcome to Machobane Farming System===============================================================\n\n"<< endl;
	cout<< "About Machobane Farming System:\n" <<endl;
	cout<<"The Machobane Farming System is a simple," 
	  		"low-input technique based on intercropping and localized "
			"application of organic manures. Since its re-introduction in "
			"the early 1990s, nearly five thousand farmers have integrated "
			"this system into their land management, increasing land productivity "
			"three-fold compared to traditional monocropping " 
			"\nThis program offers the following services: \n\n\n" 
			"-------------------------------------------\n"
			"\t\t1. Soil Preparation \n"
			"\t\t2. Planting         \n"
			"\t\t3. Crop management  \n"
			"\t\t4. Harvesting       \n"
			"---------------------------------------------\n\n";
			
	string ans;
	cout<<"Do you wish to continue? [Y/N] :";
	cin>>ans;
	if(ans=="Y" || ans=="y")
	{
	int month= months();
	control(month);
	
	}
	else if (ans=="N" || ans=="n")
	{
	cout<<"########################            Thank you for using our program :)    #################################################"<<endl;
	}else
	{
	cout<<"invalid option choose again "<<endl;
	welcome_menu();
	
	}		
	  
	  
}
int months()
{
	int temp;
	cout<<"1. January   \n "
		"2. February  \n "
		"3. March     \n "
		"4. April     \n "
		"5. May       \n "
		"6. June      \n "
		"7. July      \n "
		"8. August    \n "
		"9. September \n "
		"10.October   \n "
		"11.November  \n "
		"12.December  \n\n"
		"Select the month you are currently in   : :";
	cin>>temp;
	if(temp>12 || temp<1 )
	{
		cout<<"invalid month try again "<<endl;
		months();
	}
	return temp;
}

int soil_preparation()
{
	string key;
		cout<<"\n\nYou are currently in the  Planting Season. Before planting you must first prepare your land for planting.\n\n"
		  "\t\t1. Till the land  \n"
		  "\t\t2. Add Fertiliser(manure)\n"
		  "\t\t3. Add moisture\n\n "
		  "First we will Till the land. Press any key to continue."<<endl;
		  
	cin>>key;
	cout<<"\n \n[Tilling Your land......]\n\n"<<endl;
	
	cout<<"You have finished tilling your land. Next we move on to applying fertilizer.\n "
	      "Press any key to continue."<<endl;
	cin>>key;
	cout<<"We will now add fertilizer/ organic manure to your land" 
		  " The symbol '~' represents manure.\n Press any key to continue"<<endl;
	cin>>key;
	cout<<"\n\n [Applying Fertilizer...]\n\n "
	      "Your fertilized land:\n\n "
		  "~ ~ ~ ~ ~ \n"
		  " ~ ~ ~ ~ ~\n"
		  "~ ~ ~ ~ ~ \n"
		  "~ ~ ~ ~ ~ \n"
		  "~ ~ ~ ~ ~ \n "<<endl;	
	cout<<"For the best soil fertility, you should water your land to ensure it has the best moisture for plant growth\n\n [Watering...]\n\n "
		  "With this you are done preparing your land, Next we move on to planting."<<endl;
	
	cout<<"Machobane Farming uses relay cropping and intercropping."
			"\n Enter   \n"
			"\t\t1 for Relay cropping  \n "
			"\t\t2 for intercropping   "
			"please enter selection :"<<endl;
	int choose ;
	cin>>choose;
	return choose;		 
				  
}

void winter_planting_season()
{
	cout<<"____________________________ITS WINTER PLANTING SEASON_____________________________\n\n\n";
	cout<<"do you wish to continue to the next month [y] or continue planting [n] :";
	string select ;
	cin>>select;
	
	if(select == "n"||select=="N")
	{
		int method = soil_preparation();
		int crop1,crop2,crop3;
		string cropA,cropB,cropC;
		cout<<"In the Winter planting season these are the available crops:\n\n\n"
			  "\t\t1. Wheat    (÷)        \n"
			  "\t\t2. Peas     (*)        \n"
			  "\t\t3. Potatoes (@)      \n\n\n" 
			  "Select the crops you would like to grow :";
		cin>>crop1;
		cropA = crop_for_winter(crop1 , method);
		if(method==1)
		{
			cout<<"choose another crop to pactice relay cropping with\n"<<endl;
			cin>>crop2;
			cropA =crop_for_winter(crop2 , method);
			cout<<"The second crop will be planted at the end of the first one's growing season\n "
				  "Here is your current plot"<<endl;
			cout<<cropA<<" "<<cropA<<" "<<cropA<<" "<<cropA<<" "<<cropA<<"\n"<<" "<<" "<<" "<<" "<<" "<<" "<<" "<<" "<<" "<<"\n"<<cropA<<" "<<cropA<<" "<<cropA<<" "<<cropA<<" "<<cropA<<"\n"<<" "<<" "<<" "<<" "<<" "<<" "<<" "<<" "<<" "<<"\n"<<cropA<<" "<<cropA<<" "<<cropA<<" "<<cropA<<" "<<cropA<<"\n";
			winterplanting = true;
		}
		else if(method==2)
		{
			cout<<"Choose another crop if you wish to practice intercropping:"<<endl;
			cin>>crop2;
			cropB = crop_for_winter(crop2 , method);
			cout<<"\nHere is your plot after sowing seeds: \n\n"<<endl;
			cout<<cropA<<" "<<cropA<<" "<<cropA<<" "<<cropA<<" "<<cropA<<"\n"<<cropB<<" "<<cropB<<" "<<cropB<<" "<<cropB<<" "<<cropB<<"\n"<<cropA<<" "<<cropA<<" "<<cropA<<" "<<cropA<<" "<<cropA<<"\n"<<cropB<<" "<<cropB<<" "<<cropB<<" "<<cropB<<" "<<cropB<<"\n"<<cropA<<" "<<cropA<<" "<<cropA<<" "<<cropA<<" "<<cropA<<"\n";
		    winterplanting = true;
		}
	    winter_planting_season();
	}else
	{
		moisture_track();
	}	
}

string crop_for_winter(int num , int method)
{
	int seeds = 15;
	switch(num)
	{
		case 1 :
			wheat = wheat + seeds;
			if(method ==1 )
			{
				wheat_fertility =true;
			}
			return ("÷");
		case 2 :
			peas = peas + seeds;
			if(method ==1 )
			{
				peas_fertility =true;
			}
			return ("*");
		case 3 :
			potatoes =potatoes +seeds;
			if(method ==1 )
			{
				potatoes_fertility =true;
			}
			return ("@");
		default :
			cout<< "invalid selection"<<endl;
			return(" ");			 
	}
}

void summer_planting_season()
{
	cout<<"____________________________ITS SUMMER PLANTING SEASON _________________________________________\n\n\n\n";
	cout<<"do you wish to continue to the next month [y] or continue planting [n] :";
	string select ;
	cin>>select;
	
	if(select == "n"||select=="N")
	{
		int method = soil_preparation();
		int crop1,crop2,crop3;
		string cropA,cropB,cropC;
		cout<<"In the Summer planting season these are the available crops:\n\n\n"
			  " \t\t1. Maize ($)      \n "
			  " \t\t2. Beans (%)      \n "
			  " \t\t3. Pumpkin (+)    \n "
			  " \t\t4. Sorghum (=)    \n "
		      " \t\t5. Watermelon (&) \n "
			  " \t\t6. Groundnuts (#) \n\n"
			  "Select the crops you would like to grow";
		cin>>crop1;
		cropA = crop_for_summer(crop1 , method);
		if(method==1)
		{
			cout<<"choose another crop to pactice relay cropping with\n"<<endl;
			cin>>crop2;
			cropB = crop_for_summer(crop2 , method);
			cout<<"The second crop will be planted at the end of the first one's growing season\n "
			     "Here is your current plot"<<endl;
			cout<<cropA<<" "<<cropA<<" "<<cropA<<" "<<cropA<<" "<<cropA<<"\n"<<" "<<" "<<" "<<" "<<" "<<" "<<" "<<" "<<" "<<"\n"<<cropA<<" "<<cropA<<" "<<cropA<<" "<<cropA<<" "<<cropA<<"\n"<<" "<<" "<<" "<<" "<<" "<<" "<<" "<<" "<<" "<<"\n"<<cropA<<" "<<cropA<<" "<<cropA<<" "<<cropA<<" "<<cropA<<"\n";
			summerplanting = true;
			}
			else if(method==2)
			{
				cout<<"Choose another crop if you wish to practice intercropping:"<<endl;
				cin>>crop2;
				cropB = crop_for_summer(crop2 , method);
				cout<<"\nHere is your plot after sowing seeds: \n\n"<<endl;
				cout<<cropA<<" "<<cropA<<" "<<cropA<<" "<<cropA<<" "<<cropA<<"\n"<<cropB<<" "<<cropB<<" "<<cropB<<" "<<cropB<<" "<<cropB<<"\n"<<cropA<<" "<<cropA<<" "<<cropA<<" "<<cropA<<" "<<cropA<<"\n"<<cropB<<" "<<cropB<<" "<<cropB<<" "<<cropB<<" "<<cropB<<"\n"<<cropA<<" "<<cropA<<" "<<cropA<<" "<<cropA<<" "<<cropA<<"\n";
				summerplanting = true;
		}
		summer_planting_season();
	}else
	{
		moisture_track();
	}
}

string crop_for_summer(int num , int method)
{
	int seeds = 15;
	switch(num)
	{
		case 1:
			maize =maize + seeds;
			if(method ==1 )
			{
				maize_fertility =true;
			}
			return ("$");
		case 2:
			beans =beans + seeds;
			if(method ==1 )
			{
				beans_fertility =true;
			}
			return ("%");
		case 3:
			pumpkin = pumpkin + seeds;
			if(method ==1 )
			{
				pumpkin_fertility =true;
			}
			return ("+");
		case 4:
			sorghum = sorghum + seeds;
			if(method ==1 )
			{
				sorghum_fertility =true;
			}
			return ("=");
		case 5:
			watermelon = watermelon + seeds;
			if(method ==1 )
			{
				watermelon_fertility =true;
			}
			return ("&");
		case 6:
			groundnuts =groundnuts + seeds;
			if(method ==1 )
			{
				groundnuts_fertility =true;
			}
			return ("#");
		default:
			cout<<"invalid input "<<endl;
			return (" ");	
	}
}
string Moisture()
{
	if(moisture<=4)
	{
		return "low";
	}
	else if(moisture<=8)
	{
		return "medium";
	}
	else if(moisture>8)
	{
		return "high";
	}else
	{
		return "unknown";
	}
}
int yeild( bool fertility)
{
	if(Moisture()=="low"&&fertility==false)
	{
		return 1;	
	}
	else if(Moisture()=="high" && fertility==true)
	{
		return 5;
	}
	else if(Moisture()=="high"&& fertility==false || Moisture()=="low"&& fertility==true)
	{
		return 3;
	}
	else if(Moisture()=="medium"&& fertility==false)
	{
		return 2;
	}
	else if(Moisture()=="medium"&& fertility==true)
	{
		return 4;
	}else 
	{
		return 0;
	}
	
}

int main()
{
	welcome_menu();
	
	return 0;
}