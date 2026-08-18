#include<iostream>
#include<cstdlib>
#include<ctime>
using namespace std;
int main(){
	
	int i, dim, aux, maior, indice;
	
	indice = 0;
	maior = 0;	
	dim = 10;
	int vet [dim];
	srand(time(NULL));
	
	for(i=0; i<dim;){
		aux = rand()%38;
		if (aux >= 12){
			vet[i] = aux;
			if(aux> maior){
				maior = aux;
				indice = i;
			}
			i++;
		}
	}
	
    for(i=0;i<dim;i++){
    	cout << "vet["<<i<<"] = "<<vet[i]<<endl;
	}	
	cout << "maior numero do vetor " <<"vet[" << indice<< "] = " << maior << endl;
}
