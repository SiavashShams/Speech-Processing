
% N=810197644;
% speech2=int2speech(digits,N);
% noise=randn(length(speech2),1);
% E1=sum(abs(noise).^2);
% E2=sum(abs(speech2).^2);
% audiowrite('speech3.wav',speech2+(E2/E1/10)^(0.5)*noise,8000);
function y = int2speech(digits,N)
    speech=audioread('speech1.wav');
    m = floor(log10(N));  
    D = mod(floor(N ./ 10 .^ (m:-1:0)), 10);
    y =zeros(length(D)*4000+(length(D)-1)*2000,1)
    curpos=1;
    for (i=1:length(D))
        y(curpos:curpos+4000-1)=speech(digits(:,D(i)+1));
        curpos=curpos+6000;
    end
    audiowrite('speech22.wav',y,8000);
end
