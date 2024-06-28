
function[Max_PT_Score] = ahp()
    %% Kriteria
    disp('Matriks Perbandingan Berpasangan pada Kriteria');
    %        K    P    O    W
    MPBk = [ 1/1  3/1  2/1  2/1;  %Kuantitas
             1/3  1/1  1/3  1/2; %Pembayaran
             1/2  3/1  1/1  1/1; %Order
             1/2  2/1  1/1  1/1 ]%Waktu
    %norm matriks
    w_MPB = calc_norm(MPBk)

    %hitung eigenvector
    [m n] = size(w_MPB);
        for i=1 : m,
            sumRow = 0;
            for j=1 : n,
                sumRow = sumRow + w_MPB(i,j);
            end
        V(i)=(sumRow);
        end

        disp('EigenVector Kriteria')
        w_MPB=transpose(V)/m


    %%Kuantitas
    disp('Perbandingan Kuantitas');

    anin = 90; %anindita
    mblis = 80; %mbak lis
    lmby = 75; %lembayung
    fari = 85; %faachril

    ACM_Kuan = [ anin;
                 mblis;
                 lmby;
                 fari]

    w_Kuant = calc_norm(ACM_Kuan)

    %%Pembayaran
    disp('Matriks Perbandingan Berpasangan pada kriteria Pembayaran');
    %        A    M    L    F
    MPBp = [ 1/1  2/1  3/1 4/1;     %anindita
             1/2  1/1  2/1 3/1;      %mbaklis
             1/3  1/2  1/1 2/1;       %lembayung
             1/4  1/3  1/2 1/1 ] %Fachril

    %norm matriks
    w_Pay = calc_norm(MPBp)

    %hitung eigenvector
    [m n] = size(w_Pay);
        for i=1 : m,
            sumRow = 0;
            for j=1 : n,
                sumRow = sumRow + w_Pay(i,j);
            end
        V(i)=(sumRow);
        end

        disp('EigenVector Pembayaran')
        w_Pay=transpose(V)/m


    %%Kelanjutan Pesanan
    disp('Matriks Perbandingan Berpasangan pada kriteria Kelanjutan Pesanan');
    %        A    M    L    F
    MPBo = [ 1/1  2/1  1/2 1/3;     %anindita
             1/2  1/1  1/2 1/4;      %mbaklis
             2/1  3/1  1/1 1/2;       %lembayung
             3/1  4/1  2/1 1/1 ] %Fachril

    %norm matriks
    w_Ord = calc_norm(MPBo)

    %hitung eigenvector
    [m n] = size(w_Ord);
        for i=1 : m,
            sumRow = 0;
            for j=1 : n,
                sumRow = sumRow + w_Ord(i,j);
            end
        V(i)=(sumRow);
        end

        disp('EigenVector Kelanjutan Pesanan')
        w_Ord=transpose(V)/m


    %%Waktu
    disp('Matriks Perbandingan Berpasangan pada Waktu');
    %        A    M    L    F
    MPBj = [ 1/1  2/1  3/1 4/1;     %anindita
             1/2  1/1  2/1 3/1;      %mbaklis
             1/3  1/2  1/1 2/1;       %lembayung
             1/4  1/3  1/2 1/1 ] %Fachril

    %norm matriks
    w_Time = calc_norm(MPBj)

    %hitung eigenvector
    [m n] = size(w_Time);
        for i=1 : m,
            sumRow = 0;
            for j=1 : n,
                sumRow = sumRow + w_Time(i,j);
            end
        V(i)=(sumRow);
        end

        disp('EigenVector Waktu')
        w_Time=transpose(V)/m

    
    %%Hitung Jawaban akhir
    wM= [w_Kuant  w_Pay  w_Ord  w_Time];

    disp('Nilai akhir untuk: anindita, mbak lis, lembayung, faachril rizky');
    MC_Scores = wM * w_MPB;
    disp(MC_Scores);

    %Warung terbaik
    disp('Nilai Warung terbaik terpilih berdasarkan manfaat(kriteria)');
    Max_MC_Benefits = max(MC_Scores)
    
    function [normvect] = calc_norm(M)
           sM = sum(M);
           normvect = M./sM;
           disp('Normalisasi Matriks');
    end
   
end


%AHP FIX%

