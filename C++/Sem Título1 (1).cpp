#include<iostream>
#include<cstdlib>
#include<ctime>
using namespace std;
int main(){
	
	int i, dim, aux, cont_par = 0, cont_imp = 0;
	
	cout << "informe o tamanho do vetor\n" ; 
	cin >>dim;
	int vet [dim], par[dim], imp[dim];
	srand(time(NULL));
	
	for(i=0; i<dim;){
		aux = rand()%37;
		if(aux >= 12){
			vet[i] = aux;
			i++;
		}
	}
	
	for(i=0; i<dim; i++){
		if(vet[i]%2==0){
			par[cont_par] = vet[i];
			cont_par++;
		}else{
			imp[cont_imp]= vet[i];
			cont_imp++;
		}
    }
    
    for(i=0;i<dim;i++){
    	cout << "vet["<<i<<"] = "<<vet[i]<<endl;
	}
	cout<<endl;
    for(i=0;i<cont_par;i++){
    	cout << "par["<<i<<"] = "<<par[i]<<endl;
	}
	cout<<endl;
	for(i=0;i<cont_imp;i++){
    	cout << "impar["<<i<<"] = "<<imp[i]<<endl;
	}	
}
