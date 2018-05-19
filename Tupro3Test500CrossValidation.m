clc
clear

DataTrain=xlsread('Dataset Tugas 3 AI 1718.xlsx','DataTrain');

x=0;
y=x+1;
sum = 0;
for z=1:8
    if x==8
        x=0;
    end
    if y==8
        y=0;
    end
    x=x+1;
    y=y+1;
    train=DataTrain( (((x-1)*500)+1):(x*500),1:5);
    test=DataTrain( (((y-1)*500)+1):(y*500),1:5);
    neighbors=[]; % berisi nilai perhitungan & hoax tidaknya data yg dibandingkan 
    benar = 0;
    salah = 0;

    k=77;
    for i=1:size(test)
        % Similarity euclidean distance
        for j=1:size(train)         
    %             euclid = 0;
    %             for l=1:4
    %                 euclid=euclid + ((test(i,l)-train(j,l))^2);
    %             end
    %             neighbors(j,1)= sqrt(euclid); % mencari nilai euclidean distance

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
    batas = ['Train: ',num2str(((x-1)*500)+1),':',num2str(x*500),' - ','Test: ',num2str(((y-1)*500)+1),':',num2str(y*500)];
    disp(batas)
    akurasi = (benar/(benar+salah))*100;
    displayakurasi = ['Akurasi = ', num2str(akurasi)];
    disp(displayakurasi)
    disp(' ');
    sum = sum + akurasi;
end
rata2 = sum/z