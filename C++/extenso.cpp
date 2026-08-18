#include <iostream>
#include <locale>
using namespace std;

int main() 
{	
	setlocale(LC_ALL, "Portuguese");
	
	int num1, num2, num3, aux;

	cout << "Entre com um inteiro (N1): ";
	cin >> num1;

	cout << "Entre com um inteiro (N2): ";
	cin >> num2;
	
	num3 = num1 - num2;
	
	if(num3 >=20 && num3 <= 100)
	{
		if(num3 >= 20 && num3 <= 29){ cout << "VINTE"; aux = 20; };
		if(num3 >= 30 && num3 <= 39){ cout << "TRINTA"; aux = 30; };
		if(num3 >= 40 && num3 <= 49){ cout << "QUARENTA"; aux = 40; };
		if(num3 >= 50 && num3 <= 59){ cout << "CINQUENTA"; aux = 50; };
		if(num3 >= 60 && num3 <= 69){ cout << "SESENTA"; aux = 60; };
		if(num3 >= 70 && num3 <= 79){ cout << "SETENTA"; aux = 70; };
		if(num3 >= 80 && num3 <= 89){ cout << "OITENTA"; aux = 80; };
		if(num3 >= 90 && num3 <= 99){ cout << "NOVENTA"; aux = 90; };
	}
	
	if(num3 <= 19)
		aux = num3;
	else{
		if(num3 % 10 > 0) 
			cout << " e ";
		aux = num3 - aux;
			
	}
		

	switch(aux)
	{
		case 1: cout << " UM"; break;
		case 2: cout << " DOIS"; break;
		case 3: cout << " TRÊS"; break;
		case 4: cout << " QUATRO"; break;
		case 5: cout << " CINCO"; break;
		case 6: cout << " SEIS"; break;
		case 7: cout << " SETE"; break;
		case 8: cout << " OITO"; break;
		case 9: cout << " NOVE"; break;
		case 10: cout << " DEZ"; break;
		case 11: cout << " ONZE"; break;
		case 12: cout << " DOZE"; break;
		case 13: cout << " TREZE"; break;
		case 14: cout << " QUATORZE"; break;
		case 15: cout << " QUINZE"; break;
		case 16: cout << " DEZESEIS"; break;
		case 17: cout << " DEZESETE"; break;
		case 18: cout << " DEZOITO"; break;
		case 19: cout << " DEZENOVE"; break;
	}

}


