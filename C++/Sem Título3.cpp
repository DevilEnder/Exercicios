#include<iostream>
#include<cstdlib>
#include<ctime>
#include <cmath>
#include <iomanip>
using namespace std;
int main(){
	
	int i,n;
	float vet [10], r;
	srand(time(NULL));
	
	for(i=0; i<10;){
		
		n = rand()%900;
		r = sqrt(n);
		
		if( r >= 12.6 && r <= 28.6){
			vet[i] = r;
			i++;
		}
	}
	
    for(i=0;i<10;i++){
    	cout << "vet["<<i<<"] = "<<fixed<<setprecision(2)<<vet[i]<<endl;
	}	
}
