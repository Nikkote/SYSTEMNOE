#include <iostream>

using namespace std;

extern "C" int MultiplMatrix(int* A, int* B, int* C, int m, int n, int l);

void PrintMatrix(int* mat, int rows, int columns, string name_matrix)
{
    for (int i = 0; i < 30; i++)
        cout << "=";
    cout << endl;

    cout << name_matrix << ":\n";
    for (int i = 0; i < rows; i++)
    {
        for (int j = 0; j < columns; j++)
        {
            int k = i * columns + j;
            cout.width(4);
            cout << mat[k] << "  ";
        }
        cout << endl;
    }
    cout << endl;
}

void GenerateMatrix(int* mat, int rows, int columns, string name_matrix)
{
    for (int i = 0; i < rows; i++)
    {
        for (int j = 0; j < columns; j++)
        {
            int k = i * columns + j;
            mat[k] = rand() % 50;
        }
    }

    PrintMatrix(mat, rows, columns, name_matrix);
}


int main()
{
    srand(time(0));

    
    const int M = 4;
    const int N = 2;
    const int L = 5;

    
    int A[M][N];
    int B[N][L];
    int C[M][L];

    int* ptr_A = &A[0][0];
    int* ptr_B = &B[0][0];
    int* ptr_C = &C[0][0];

    
    GenerateMatrix(ptr_A, M, N, "A");

    
    GenerateMatrix(ptr_B, N, L, "B");

    
    for (int i = 0; i < M; i++)
        for (int j = 0; j < L; j++)
            C[i][j] = 0;

    
    MultiplMatrix(ptr_A, ptr_B, ptr_C, M, N, L);

        PrintMatrix(ptr_C, M, L, "A x B");

    return 0;
}

