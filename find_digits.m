 
% digits=find_digits(speech1);
% % figure(1)
% % plot(speech1(digits(:,1)))
% figure(2)
% plot(speech1(digits(:,2)))
% % figure(3)
% % plot(speech1(digits(:,3)))
% % figure(4)
% % plot(speech1(digits(:,4)))
% % figure(5)
% % plot(speech1(digits(:,5)))
% figure(6)
% plot(speech1(digits(:,6)))
% % figure(7)
% % plot(speech1(digits(:,7)))
%  figure(8)
% plot(speech1(digits(:,8)))
% % figure(9)
% % plot(speech1(digits(:,9)))
%  figure(10)
% plot(speech1(digits(:,10)))
%  sound(speech1(digits(:,1)),8000)
function intervals = find_digits(x);
    curPos = 1;
    L = length(x);
    w = zeros(40,1);
    for (i=1:40)
        window = (x(curPos:curPos+4000-1));
        w(i) = (1/(4000)) * sum(abs(window.^2));
        curPos = curPos + 2000;
    end
    w(w<0.0011)=0;
    ii = zeros(size(w));
    jj = w > 0;
    ii(strfind([0,jj(:)'],[0 1])) = 1;
    idx = cumsum(ii).*jj;
    out = accumarray( idx(jj),w(jj)',[],@(x){x'});%Getting intervals seperated by 0
    for(i=1:10)
        w2=w==out{i};
        [row,col]=find(w2==1);
        Cp(i)= mean(row)
        intervals(:,i)=[(Cp(i)-1)*2000:(Cp(i)+1)*2000-1]
    end
end
    