#include <iostream>
using  namespace std;

int print (char pPrint[3][3])
{
	for(int linha = 0; linha <3; linha++)
	{
		for(int coluna=0; coluna <3; coluna++)
		{
			cout << pPrint[linha][coluna];

			if(coluna<2)
			{
				cout << '-';
			}
		}
		cout<<endl;
	}
	return 0;
}

int verificastatusjogo(char ptabuleiro[3][3], char pjogador)
{


	for(int linha = 0; linha <3; linha++)
	{
		if(ptabuleiro[linha][0] == pjogador && ptabuleiro[linha][1] == pjogador && ptabuleiro[linha][2] == pjogador)
		{
			return 1;
		}
	}


	for(int coluna=0; coluna <3; coluna++)
	{
		if(ptabuleiro[0][coluna] == pjogador && ptabuleiro[1][coluna] == pjogador && ptabuleiro[2][coluna] == pjogador)
		{
			return 1;
		}

	}

	if(ptabuleiro[0][0] == pjogador &&  ptabuleiro[1][1] == pjogador && ptabuleiro[2][2] == pjogador)
	{
		return 1;
	}


	if(ptabuleiro[0][2] == pjogador &&  ptabuleiro[1][1] == pjogador && ptabuleiro[2][0] == pjogador)
	{
		return 1;
	}


	return 0;
}
int main()
{
	char tabuleiro[3][3];
	char jogador= 'X';
	int auxlinha, auxcoluna;
	bool ganhou = false;

	for (int linha=0; linha<3; linha++)
	{
		for(int coluna=0; coluna<3; coluna++)
		{
			tabuleiro[linha][coluna]=' ';
		}
	}

	do {
		print(tabuleiro);

		cout << "jogador "<< jogador << " faC'a sua jogada(linha, coluna)"<< endl ;
		cout << "linha: ";
		cin >> auxlinha;
		cout << endl <<"coluna: ";
		cin >> auxcoluna;

		if(tabuleiro[auxlinha][auxcoluna] == ' ')
		{
			tabuleiro[auxlinha][auxcoluna] = jogador;
			verificastatusjogo(tabuleiro, jogador);

			if (verificastatusjogo(tabuleiro, jogador) == 1)
			{
				print(tabuleiro);
				cout << endl << "JOGADOR " << jogador << " VENCEU!" << endl;
				ganhou = true;
				break;
			}



			if(jogador == 'X')
			{
				jogador = 'O';
			}
			else
				jogador = 'X';
		}
	} while(auxlinha <=3 && auxcoluna <= 3);
	cout << endl << "FIM";
	return 0;
}