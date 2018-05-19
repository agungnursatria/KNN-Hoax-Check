clc
clear
    
DataTrain=xlsread('Dataset Tugas 3 AI 1718.xlsx','DataTrain');
train=DataTrain(1:4000,1:5);
DataTest=xlsread('Dataset Tugas 3 AI 1718.xlsx','DataTest');
test=DataTest(1:1000,1:4);
neighbors=[]; % berisi nilai perhitungan & hoax tidaknya data yg dibandingkan 
benar = 0;
salah = 0;
totalhoax = 0;
totaltidakhoax = 0;
k=53;
k=round(sqrt(size(train)));
filename = 'HasilManhattanMethod.xlsx';
A = {'Berita','Like','Provokasi','Komentar','Emosi','Hoax'};
for i=1:size(test)
    % Similarity
    for j=1:size(train)      
        Manhattan = 0;
        for l=1:4
            Manhattan=Manhattan + abs((test(i,l)-train(j,l)));
        end
        neighbors(j,1)= Manhattan; % mencari nilai manhattan distance
        neighbors(j,2) = train(j,5); %berisi nilai hoax atau tidak dari train
    end;
    hasil = abs(sortrows(neighbors,1));
    countHoax = size(find(hasil(1:k,2)==1),1);
    countTidakHoax = size(find(hasil(1:k,2)==0),1);
    if(countHoax > countTidakHoax)
        hoax=1;
        totalhoax=totalhoax+1;
    else
        hoax=0;
        totaltidakhoax=totaltidakhoax+1;
    end
    
    if i<1000
        namaBerita = strcat('B00',num2str(i));
    else
        namaBerita = strcat('B0',num2str(i));
    end
    
    B = {namaBerita,num2str(test(i,1)),num2str(test(i,2)),num2str(test(i,3)),num2str(test(i,4)),num2str(hoax)};
    A= vertcat(A,B);
end
xlswrite(filename,A);
tothoax = ['Total Hoax: ',num2str(totalhoax)];
disp(tothoax);
tottdkHoax = ['Total Tidak Hoax: ',num2str(totaltidakhoax)];
disp(tottdkHoax);