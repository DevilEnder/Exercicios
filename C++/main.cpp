#include <iostream>
using namespace std;
#define TAM 10


int soma(int vetor[TAM]) {
    int resultado = 0;
    for (int i = 0; i < TAM; i++) {
        resultado += vetor[i];
    }
    return resultado;
}

int somaPares(int vetor[TAM]) {
    int pares = 0;
    for (int i = 0; i < TAM; i++) {
        if (vetor[i] % 2 == 0) {
            pares += vetor[i];
        }
    }
    return pares;
}

int somaImpares(int vetor[TAM]) {
    int impares = 0;
    for (int i = 0; i < TAM; i++) {
        if (vetor[i] % 2 != 0) {
            impares += vetor[i];
        }
    }
    return impares;
}

int multiplicacao(int vetor[TAM]) {
    int resultado = 1;
    for (int i = 0; i < TAM; i++) {
        resultado *= vetor[i];
    }
    return resultado;
}

int multiplicacaoPares(int vetor[TAM]) {
    int resultado = 1;
    bool existePar = false;
    
    for (int i = 0; i < TAM; i++) {
        if (vetor[i] % 2 == 0) {
            resultado *= vetor[i];
            existePar = true;
        }
    }
    
    if (!existePar) {
        return 0;
    }
    
    return resultado;
}

int multiplicacaoImpares(int vetor[TAM]) {
    int resultado = 1;
    bool existeImpar = false;
    
    for (int i = 0; i < TAM; i++) {
        if (vetor[i] % 2 != 0) {
            resultado *= vetor[i];
            existeImpar = true;
        }
    }
    
    if (!existeImpar) {
        return 0;
    }
    
    return resultado;
}

int somaQuadrados(int vetor[TAM]) {
    int resultado = 0;
    for (int i = 0; i < TAM; i++) {
        resultado += (vetor[i] * vetor[i]);
    }
    return resultado;
}

int main() {
    int numero[TAM];
    int escolha;
    
    for (int i = 0; i < TAM; i++) {
        cout << "Digite o número " << (i+1) << ": ";
        cin >> numero[i];
    }
    
    cout << "\nEscolha a operação:" << endl;
    cout << "1 - Soma dos elementos" << endl;
    cout << "2 - Soma dos elementos pares" << endl;
    cout << "3 - Soma dos elementos ímpares" << endl;
    cout << "4 - Multiplicação dos elementos" << endl;
    cout << "5 - Multiplicação dos elementos pares" << endl;
    cout << "6 - Multiplicação dos elementos ímpares" << endl;
    cout << "7 - Soma dos quadrados dos elementos" << endl;
    cout << "Digite sua escolha: ";
    cin >> escolha;
    
    switch (escolha) {
        case 1:
            cout << "A soma dos elementos é: " << soma(numero) << endl;
            break;
        case 2:
            cout << "A soma dos elementos pares é: " << somaPares(numero) << endl;
            break;
        case 3:
            cout << "A soma dos elementos ímpares é: " << somaImpares(numero) << endl;
            break;
        case 4:
            cout << "A multiplicação dos elementos é: " << multiplicacao(numero) << endl;
            break;
        case 5:
            cout << "A multiplicação dos elementos pares é: " << multiplicacaoPares(numero) << endl;
            break;
        case 6:
            cout << "A multiplicação dos elementos ímpares é: " << multiplicacaoImpares(numero) << endl;
            break;
        case 7:
            cout << "A soma dos quadrados dos elementos é: " << somaQuadrados(numero) << endl;
            break;
        default:
            cout << "Opção inválida!" << endl;
    }
    
    return 0;
}