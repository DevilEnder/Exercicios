#include <iostream>
#include <cstdlib>
#include <ctime>
using namespace std;
int main(){
	
	int i,j, aux, vet[10];
	srand(time(NULL));
	
	for(i=0; i<10;i++){
		vet[i] = rand()%10;
		cout << "vet["<<i<<"] = "<<vet[i]<<endl;
	}
	
    for(i=0;i<=8;i++){
    	for(j=i+1; j<= 9; j++){
    		if(vet[i] > vet[j]){
    			aux = vet[i];
    			vet[i] = vet[j];
    			vet[j] = aux;
			}
		}
	}	
	
	cout<<endl;
	cout << "Vetor Ordenado"<<endl;
	for(i=0; i<10;i++){
		cout << "vet["<<i<<"] = "<<vet[i]<<endl;
	}
}
