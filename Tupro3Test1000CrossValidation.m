clc
clear

DataTrain=xlsread('Dataset Tugas 3 AI 1718.xlsx','DataTrain');
x=0;
sum = 0;

for z=1:4
    x=x+1;
    test=DataTrain( (((x-1)*1000)+1):(x*1000),1:5);
    trainBawah=DataTrain( 1:((x-1)*1000),1:5);
    trainAtas=DataTrain( ((x*1000)+1):4000,1:5);
    neighbors=[]; % berisi nilai perhitungan & hoax tidaknya data yg dibandingkan 
    benar = 0;
    salah = 0;

    k=77;
    for i=1:size(test)
        % Similarity Manhattan distance
        if x>1
            for j=1:size(trainBawah)         
                Manhattan = 0;
                for l=1:4
                    Manhattan=Manhattan + abs((test(i,l)-trainBawah(j,l)));
                end
                neighbors(j,1)= Manhattan; % mencari nilai manhattan distance

                neighbors(j,2) = trainBawah(j,5); %berisi nilai hoax atau tidak dari train
            end;
        end
        if x<4
            for j=1:size(trainAtas)         
                Manhattan = 0;
                for l=1:4
                    Manhattan=Manhattan + abs((test(i,l)-trainAtas(j,l)));
                end
                neighbors(j,1)= Manhattan; % mencari nilai manhattan distance

                neighbors(j,2) = trainAtas(j,5); %berisi nilai hoax atau tidak dari train
            end;
        end

        hasil = abs(sortrows(neighbors,1));

        countHoax = size(find(hasil(1:k,2)==1),1);
        countTidakHoax = size(find(hasil(1:k,2)==0),1);
        if(countHoax > countTidakHoax)
            hoax=1;
        else
            hoax=0;
        end

        if hoax==test(i,5)
            benar = benar+1;
        else
            salah = salah+1;
        end
    end

    display = ['Akurasi ke ',num2str(z)];
    disp(display)
    if x==1
        batasAtasTrain = 4000;
    else
        batasAtasTrain = (x-1)*1000;
    end
    
    batas = ['Test: ',num2str((x-1)*1000+1),':',num2str(x*1000),' - ','Train: ',num2str(mod((x*1000+1),4000)),':',num2str(batasAtasTrain)];
    disp(batas)
    akurasi = (benar/(benar+salah))*100;
    displayakurasi = ['Akurasi = ', num2str(akurasi)];
    disp(displayakurasi)
    disp(' ');
    sum = sum + akurasi;
end
rata2 = sum/z