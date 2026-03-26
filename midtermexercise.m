%temizlik :) 
clear; clc; close all ;

%1 stock sectim 
stocks = {"YKBNK_Price_USD"};

%dosyayi okudum 
T = readtable("BIST30_ALL_STOCKS_COMBINED.xlsx");

%Date duzenliyoruz ve matlaba cekiyor
T.Date = datetime(T.Date);

%tam olarak 2020yilini almak icin spesifik islem yapiyoruz
mask = T.Date >= datetime(2020,1,1) & T.Date <= datetime(2020,12,31);

%filtreledim-ama tum sutunleri almak istedigim icin : kullandim
filteredData = T(mask, :);

%ilk sutunu cekmek istedim 
x = filteredData.(stocks{1});
x = x(:);
[n,~] = size(x);

%NAN kontrolu yaptimmm
for i = 2:n-1
    if isnan(x(i,1))
        x(i,1) = (x(i-1) + x(i+1,1)) / 2
    end
end 

%tarihleri aldim
dates = filteredData.Date;

%plot yapiyorum
plot(dates,x);
xlabel('Months in 2020')
ylabel('YKBNK hisse degisimi(USD)')
title('YKBNK hisse degisimi over 2020')
grid on

%mean hesapladim
m = sum(x) / n;

%std hesapladim
toplam = 0;
for i = 1:n
    toplam = toplam + (x(i) - m)^2;
end
s = sqrt(toplam / n);

%baslangicta 100 tl var
cash = 100;
stockAmount = 0;

%al sat stratejisi 
for i = 1:n;

    if x(i) < m - s cash > 0
        stockAmount = cash / x(i);
        cash = 0;
    end


    if x(i) > m + s   stockAmount > 0
    cash = stockAmount * x(i);
    stockAmount = 0;
    end

end


%final value (amount)
finalValue = cash + stockAmount * x(n);

disp('Mean:')
disp(m)

disp('Std:')
disp(s)

disp('Final Value:')
disp(finalValue)