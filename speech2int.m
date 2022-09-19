% N=speech2int(speech3,digits)    

function y = speech2int(sp,digits)
    speech1=audioread('speech1.wav');
    digits2=[1:4000;6001:10000;12001:16000;18001:22000;24001:28000;30001:34000;36001:40000;42001:46000;48001:52000]';
    for j=1:9
        for i=1:10
            r(j,i)=abs(sum(sp(digits2(:,j)).*speech1(digits(:,i)))/((sum(abs(sp(digits2(:,j))).^2)^0.5*sum(abs(speech1(digits(:,i))).^2)^0.5)));
        end
    end
    for i=1:9
        [digr,digcol(i)]=find(r==max(r(i,:)));
    end
    digcol=digcol-1;
    y = sum(digcol.*10.^[length(digcol)-1:-1:0])
end